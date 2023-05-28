<script>
    import { page } from '$app/stores';
    import { onMount } from "svelte";
    import { goto } from '$app/navigation';
    import { fly } from 'svelte/transition';
    import { session } from '$lib/session';
    import { ApiPickupPoint } from '$lib/api/ApiPickupPoint';
    import { ApiAdmin } from '$lib/api/ApiAdmin';
    import Loading from "$lib/components/Loading.svelte";
    import PackageCard from './PackageCard.svelte';
    import History from './History.svelte';

    let loading = true;
    let packageId = $page.params.id;
    let packageDetails = {};


    onMount(async () => {
        
        //api call to get packages
        ApiAdmin.adminPackage(packageId)
        .then(res => {
            packageDetails = res;
            loading = false;
        })
        .catch(err => {
            console.log(err);
        })
    })
    
</script>

{#if loading}

    <Loading />

{:else}

    <div
        in:fly={{y: 100, duration: 300, opacity:0}}
        class="container my-12"
        >
        <div>
            <p class="text-4xl font-bold inline-block">Package</p>
            <span class="font-extralight italic mx-1 text-xl">{packageId}</span>   
        </div>

        <div class="my-8">
            <PackageCard packageDetails={packageDetails} />
        </div>

        <div class="my-12 ml-7">
            <History packageDetails={packageDetails} />
        </div>
    </div>

{/if}