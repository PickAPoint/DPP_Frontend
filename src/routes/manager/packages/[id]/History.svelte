<script>
    import { Dates } from '$lib/utils/Dates';
    import { Timeline, TimelineItem, Badge } from 'flowbite-svelte';
    
    export let packageDetails;

    const states = {
        'OrderPlaced': ['purple', 'Order Placed', 'New order has been placed'],
        'InTransit': ['yellow', 'In Transit', 'Order is in transit'],
        'Delivered': ['pink', 'Delivered', 'Order has been delivered'],
        'Cancelled': ['red', 'Cancelled', 'Order has been cancelled'],
        'Collected': ['green', 'Collected', 'Order has been collected']
    }

</script>

<div>

  <Timeline>
    {#each packageDetails.states as s}
      <TimelineItem title={states[s.orderState][2]} date={Dates.getVerboseDateTime(s.orderDate)}>
        <p class="mb-4 text-base font-normal text-gray-500 dark:text-gray-400">
          <Badge color={states[s.orderState][0]}>{states[s.orderState][1]}</Badge>
        </p>
      </TimelineItem>
    {/each}
  </Timeline>
</div>

