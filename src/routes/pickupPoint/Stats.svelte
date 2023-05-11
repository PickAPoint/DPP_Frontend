<script>
    // @ts-nocheck
    import { DonutChart } from "@carbon/charts-svelte";
    import "@carbon/styles/css/styles.css";
    import "@carbon/charts/styles.css";
    import TiUpload from 'svelte-icons/ti/TiUpload.svelte'
    import TiDownload from 'svelte-icons/ti/TiDownload.svelte'

    export let data = [];
</script>


<div class="grid grid-cols-2 gap-4 my-12">

    <!-- Times -->
    <div>
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
    <div>
        <DonutChart
            data={data}
            
            options={{
                "resizable": true,
                "legend": {
                    "alignment": "center"
                },
                "donut": {
                    "center": {
                        "label": "Packages"
                    },
                    "alignment": "center"
                },
                "height": "300px",
                "toolbar": {
                    "enabled": false
                },
                "color": {
                    "scale": {
                        "Stored": "#FF6000",
                        "Expected": "#FFA559",
                        "Forgotten": "#FFE6C7",
                        "Canceled": "#454545"
                    }
                }
            }}
        />
    </div>

</div>
