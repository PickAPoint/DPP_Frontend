<script>
    import { Doughnut } from 'svelte-chartjs';
    import { Chart as ChartJS, Title, Tooltip, Legend, ArcElement, CategoryScale } from 'chart.js';
    import TiUpload from 'svelte-icons/ti/TiUpload.svelte'
    import TiDownload from 'svelte-icons/ti/TiDownload.svelte'
    ChartJS.register(Title, Tooltip, Legend, ArcElement, CategoryScale);

    export let packages;

    const data = {
        labels: ['Stored', 'Expected', 'Cancelled'],
        datasets: [
        {
            data: [packages.stored.length, packages.expected.length, packages.cancelled.length],
            backgroundColor: ['#FF6000', '#FFA559', '#454545']
        }]
    };

    const options = {
        responsive: false,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                display: true,
                position: 'bottom',
            }
        },
    };

    function getLastDate(type) {
        let dates = [];

        if (type == 'pickup') {
            packages.collected.forEach(collect => {
                dates.push(new Date(collect.states[collect.states.length - 1].orderDate));
            });
        }

        if (type == 'arrival') {
            packages.stored.forEach(stored => {
                dates.push(new Date(stored.states[stored.states.length - 1].orderDate));
            });

            packages.collected.forEach(collect => {
                collect.states.forEach(s => {
                    if (s.orderState == 'Delivered') {
                        dates.push(new Date(s.orderDate));
                    }
                });
            });
        }

        if (dates.length == 0) {
            return '-';
        }

        const tmp = new Date(Math.max(...dates));
        let lastDate = (tmp.getDate() < 10 ? '0' : '') + tmp.getDate() + '/' + ((tmp.getMonth() + 1) < 10 ? '0' : '') + (tmp.getMonth() + 1) + '/' + tmp.getFullYear();
        let lastTime = tmp.getHours() + ':' + (tmp.getMinutes() < 10 ? '0' : '') + tmp.getMinutes();

        return lastDate + ' - ' + lastTime;
    }


    function noPackages() {
        return packages.stored.length == 0 && packages.expected.length == 0 && packages.cancelled.length == 0 && packages.collected.length == 0;
    }

</script>


<div class="grid lg:grid-cols-2 lg:gap-4 my-12">

    <!-- Times -->
    <div class="my-auto">
        <div class="justify-between items-center my-2 bg-primary-100 dark:bg-gray-800 text-gray-500 dark:text-gray-400 rounded-lg border border-gray-200 dark:border-gray-700 shadow-md flex p-4 sm:p-6">
            <div>
                <p class="text-xl font-light">Last Pick-up</p>
                <p class="text-2xl font-bold">{getLastDate('pickup')}</p>
            </div>

            <div class="h-10 text-primary-500 dark:text-primary-400">
                <TiUpload />
            </div>
        </div>


        <div class="justify-between items-center my-2 bg-primary-100 dark:bg-gray-800 text-gray-500 dark:text-gray-400 rounded-lg border border-gray-200 dark:border-gray-700 shadow-md flex p-4 sm:p-6">
            <div>
                <p class="text-xl font-light">Last Arrival</p>
                <p class="text-2xl font-bold">{getLastDate('arrival')}</p>
            </div>
            <div class="h-10 text-primary-500 dark:text-primary-400">
                <TiDownload />
            </div>
        </div>
    </div>


    <!-- Chart -->

    {#if noPackages()}
        <div class="m-auto">
            <p class="text-center text-gray-500 dark:text-gray-400">No packages to show</p>
        </div>
    {:else}
        <div class="relative pt-4">
            <Doughnut {data} options={options} class="mx-auto" />
        </div>
    {/if}
</div>
