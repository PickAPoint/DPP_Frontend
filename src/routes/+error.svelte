<script>
    import { page } from '$app/stores';
</script>

<div class="flex flex-col items-center justify-center h-full">
    <h1 class="text-4xl font-bold">{$page.status}</h1>
    <h2 class="text-2xl font-semibold">{$page.url.pathname} {$page.error.message}</h2>
</div>