<script>
	import { session } from '$lib/session';
    import { goto } from '$app/navigation';
    import { Card, Button, Label, Input, Checkbox, Alert } from "flowbite-svelte";
    import { ApiAuth } from '$lib/api/ApiAuth.js';
    

    let loginError = false;
    let formData = {
        email: '',
        password: '',
        remember: true,
    }


    function handleSubmit() {
        ApiAuth.login({ email: formData.email, password: formData.password})
        .then((data) => {
            if (data === "") {
                loginError = true;
                return
            }
            const details = data;
            session.set(details);

            if (formData.remember) {
                localStorage.setItem('session', JSON.stringify(details));
            }
            
            if (data.type === 'Admin') {
                goto('/manager');
            }
            else if (data.type === 'Partner') {
                goto('/pickupPoint');
            }
        })
    }

</script>


<div class="flex justify-center items-center h-full">
    <Card size='lg' class="w-full">
        <form 
            class="flex flex-col space-y-6" 
            on:submit|preventDefault={handleSubmit}
        >
            <h3 class="text-xl font-medium text-gray-900 dark:text-white">
                Sign in to our platform
            </h3>

            <Label class="space-y-2">
                <span>Email</span>
                <Input 
                    type="email"
                    name="email"
                    placeholder="user@example.com"
                    required
                    bind:value={formData.email}
                />
            </Label>

            <Label class="space-y-2">
                <span>Your password</span>
                <Input 
                    type="password"
                    name="password"
                    placeholder="•••••" 
                    required
                    bind:value={formData.password}
                />
            </Label>

            <div class="flex items-start">
                <Checkbox
                    name="remember"
                    bind:checked={formData.remember}
                >Remember me</Checkbox>
            </div>

            {#if loginError}
                <Alert color="red">
                    <span class="font-medium">Error!</span> Invalid credentials or account waiting for approval.
                </Alert>
            {/if}

            <Button color="primary" type="submit" class="w-full">
                Login to your account
            </Button>

            <div class="text-sm font-medium text-gray-500 dark:text-gray-300">
                Not registered? 
                <a href="/register" class="text-primary-700 hover:underline dark:text-primary-500">
                    Become a Pick-up Point
                </a>
            </div>
        </form>
    </Card>
</div>  
  