<script>

    import AllPackages from "./AllPackages.svelte";
    import { ApiAdmin } from '$lib/api/ApiAdmin.js';

    let packages = [];

    ApiAdmin.adminPackages()
        .then(data => {
            packages = data;
        })
        .catch(err => {
            console.log("Error", err);
        })

</script>



<div class="container my-12">
    <div>
        <p class="text-4xl font-bold inline-block">Packages Management</p>
        <span class="font-extralight italic mx-1 text-lg">Administrator</span>
    </div>
    <div class="h-8"></div>


    <div class="w-full">
        <AllPackages bind:packages={packages}/>
    </div>


    



</div>