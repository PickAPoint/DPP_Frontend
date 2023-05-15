<script>
    import { page } from '$app/stores';
    import PackageCard from './PackageCard.svelte';
    import History from './History.svelte';

    let packageId = $page.params.id;

    let packageDetails = {
        id: packageId,
        eStore: "PrintPlate",
        orderDate: "10/10/2021 10:23:33",
        orderState: "Collected",
        states: [
            {
                id: 1,
                orderState: "OrderPlaced",
                orderDate: "10/10/2021 10:23:33"
            },
            {
                id: 3,
                orderState: "InTransit",
                orderDate: "10/10/2021 10:23:33"
            },
            {
                id: 4,
                orderState: "Delivered",
                orderDate: "10/10/2021 10:23:33"
            },
            {
                id: 5,
                orderState: "Collected",
                orderDate: "10/10/2021 10:23:33"
            }
        ],
        client: {
            fname: "John",
            lname: "Doe",
            email: "johndoe@gmail.com"
        }
    }
</script>


<div class="container my-12">
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
