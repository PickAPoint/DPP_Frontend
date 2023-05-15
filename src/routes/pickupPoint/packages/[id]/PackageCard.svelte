<script>
    import { Card, Badge } from "flowbite-svelte";
    import VscPackage from "svelte-icons-pack/vsc/VscPackage";
    import AiOutlineShoppingCart from "svelte-icons-pack/ai/AiOutlineShoppingCart";
    import BiCalendar from "svelte-icons-pack/bi/BiCalendar";
    import AiOutlineInfoCircle from "svelte-icons-pack/ai/AiOutlineInfoCircle";
    import AiOutlineUser from "svelte-icons-pack/ai/AiOutlineUser";
    import AiOutlineMail from "svelte-icons-pack/ai/AiOutlineMail";
    import Icon from 'svelte-icons-pack/Icon.svelte';

    const states = {
        'OrderPlaced': ['purple', 'Order Placed'],
        'InTransit': ['yellow', 'In Transit'],
        'Delivered': ['pink', 'Delivered'],
        'Cancelled': ['red', 'Cancelled'],
        'Collected': ['green', 'Collected']
    }

    export let packageDetails;
</script>


<Card size="xl">
    <div class="grid grid-cols-2 gap-4">

        <div>
            <p class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Package Info.</p>

            <div class="mb-1 mt-5 items-center flex">
                <Icon src={VscPackage} color="#fe795d" className="w-6 h-6 mr-3" />
                <span class="text-lg font-semibold tracking-tight text-gray-900 dark:text-white mr-2">ID</span>
                <span class="font-light text-gray-700 dark:text-gray-400 leading-tight">{packageDetails.id}</span>
            </div>

            <div class="items-center flex mt-3">
                <Icon src={AiOutlineShoppingCart} color="#fe795d" className="w-6 h-6 mr-3" />
                <span class="text-lg font-semibold tracking-tight text-gray-900 dark:text-white mr-2">eStore</span>
                <span class="font-light text-gray-700 dark:text-gray-400 leading-tight">{packageDetails.eStore}</span>
            </div>

            <div class="items-center flex mt-3">
                <Icon src={BiCalendar} color="#fe795d" className="w-6 h-6 mr-3" />
                <span class="text-lg font-semibold tracking-tight text-gray-900 dark:text-white mr-2">Order Date</span>
                <span class="font-light text-gray-700 dark:text-gray-400 leading-tight">{packageDetails.orderDate}</span>
            </div>

            <div class="items-center flex mt-3">
                <Icon src={AiOutlineInfoCircle} color="#fe795d" className="w-6 h-6 mr-3" />
                <span class="text-lg font-semibold tracking-tight text-gray-900 dark:text-white mr-2">Status</span>
                <Badge color={states[packageDetails.orderState][0]}>{states[packageDetails.orderState][1]}</Badge>

            </div>
        </div>

        <div>
            <p class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Package Info.</p>

            <div class="mb-1 mt-5 items-center flex">
                <Icon src={AiOutlineUser} color="#fe795d" className="w-6 h-6 mr-3" />
                <span class="text-lg font-semibold tracking-tight text-gray-900 dark:text-white mr-2">Name</span>
                <span class="font-light text-gray-700 dark:text-gray-400 leading-tight">{packageDetails.client.fname}</span>
            </div>

            <div class="items-center flex mt-3">
                <Icon src={AiOutlineUser} color="#fe795d" className="w-6 h-6 mr-3" />
                <span class="text-lg font-semibold tracking-tight text-gray-900 dark:text-white mr-2">Surname</span>
                <span class="font-light text-gray-700 dark:text-gray-400 leading-tight">{packageDetails.client.lname}</span>
            </div>

            <div class="items-center flex mt-3">
                <Icon src={AiOutlineMail} color="#fe795d" className="w-6 h-6 mr-3" />
                <span class="text-lg font-semibold tracking-tight text-gray-900 dark:text-white mr-2">Email</span>
                <span class="font-light text-gray-700 dark:text-gray-400 leading-tight">{packageDetails.client.email}</span>
            </div>
        </div>

      </div>
    <div>
</Card>
