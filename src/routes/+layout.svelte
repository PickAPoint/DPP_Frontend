<script>
    import "../app.css";
    import Navbar from "$lib/components/Navbar.svelte";
</script>


<div class="flex flex-col h-screen">
    <Navbar/>
    <div class="flex-1 overflow-y-auto">
        <slot />
    </div>
</div>