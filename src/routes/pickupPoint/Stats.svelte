<script>
    import { Doughnut } from 'svelte-chartjs';
    import { Chart as ChartJS, Title, Tooltip, Legend, ArcElement, CategoryScale } from 'chart.js';
    import TiUpload from 'svelte-icons/ti/TiUpload.svelte'
    import TiDownload from 'svelte-icons/ti/TiDownload.svelte'
    ChartJS.register(Title, Tooltip, Legend, ArcElement, CategoryScale);

    export let packages;

    const data = {
        labels: ['Stored', 'Expected', 'Forgotten', 'Cancelled'],
        datasets: [
        {
            data: [300, 50, 100, 40],
            backgroundColor: ['#FF6000', '#FFA559', '#FFE6C7', '#454545']
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

</script>


<div class="grid lg:grid-cols-2 lg:gap-4 my-12">

    <!-- Times -->
    <div class="my-auto">
        <div class="justify-between items-center my-2 bg-primary-100 dark:bg-gray-800 text-gray-500 dark:text-gray-400 rounded-lg border border-gray-200 dark:border-gray-700 shadow-md flex p-4 sm:p-6">
            <div>
                <p class="text-xl font-light">Last Pick-up</p>
                <p class="text-2xl font-bold">{"10/05/2023 10:34"}</p>
            </div>

            <div class="h-10 text-primary-500 dark:text-primary-400">
                <TiUpload />
            </div>
        </div>


        <div class="justify-between items-center my-2 bg-primary-100 dark:bg-gray-800 text-gray-500 dark:text-gray-400 rounded-lg border border-gray-200 dark:border-gray-700 shadow-md flex p-4 sm:p-6">
            <div>
                <p class="text-xl font-light">Last Arrival</p>
                <p class="text-2xl font-bold">{"10/05/2023 10:34"}</p>
            </div>
            <div class="h-10 text-primary-500 dark:text-primary-400">
                <TiDownload />
            </div>
        </div>
    </div>


    <!-- Chart -->
    <div class="relative">
        <Doughnut {data} options={options} class="mx-auto" />
    </div>

</div>
