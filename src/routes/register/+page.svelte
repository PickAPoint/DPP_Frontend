<script>
    import { Card, Button, Label, Input } from "flowbite-svelte";
    import { goto } from '$app/navigation';
    import { ApiAuth } from '$lib/api/ApiAuth';
    import IoIosSend from 'svelte-icons/io/IoIosSend.svelte'

    let formData = {
        email: '',
        password: '',
        name: '',
        contact: '',
        address: ''
    }
    let loginError = false;
    let showRegisterForm = true;

    function handleSubmit() {
        
        ApiAuth.register(formData)
            .then(res => {
                if (res) {
                    showRegisterForm = false;
                }
                else {
                    loginError = true;
                }
            })
            .catch(err => {
                loginError = true;
            })
    }

</script>

{#if showRegisterForm}
    <div class="flex justify-center items-center h-full">
        <Card size='lg' class="w-full">
            <form 
                class="flex flex-col space-y-6" 
                on:submit|preventDefault={handleSubmit}
            >
                <h3 class="text-xl font-medium text-gray-900 dark:text-white">
                    Become a Pick-up Point
                </h3>

                <Label class="space-y-2">
                    <span>Name</span>
                    <Input 
                        type="text"
                        name="companyName"
                        placeholder="Business Name"
                        required
                        bind:value={formData.name}
                    />
                </Label>

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

                <Label class="space-y-2">
                    <span>Contact</span>
                    <Input 
                        type="text"
                        name="name"
                        placeholder="Business Contact"
                        required
                        bind:value={formData.contact}
                    />
                </Label>

                <Label class="space-y-2">
                    <span>Address</span>
                    <Input 
                        type="text"
                        name="companyAddress"
                        placeholder="Business Address"
                        required
                        bind:value={formData.address}
                    />
                </Label>

                {#if loginError}
                    <p class="text-red-500">Email already exists</p>
                {/if}

                <Button color="primary" type="submit" class="w-full">
                    Register
                </Button>

            </form>
        </Card>
    </div> 

{:else}
    <div class="w-full h-full relative">
        <div class="md:w-1/2 absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
            <div class="h-40 text-center"><IoIosSend class="mx-auto mb-4 w-2"/></div>
            <div class="text-center">
                <p class="text-3xl">Thank you for your application, we will review it and get back to you through email as soon as possible!</p>
                <Button color="primary" class="mt-4" on:click={() => goto('/')}>Back to Home</Button>
            </div>
        </div>
    </div>
{/if}

  