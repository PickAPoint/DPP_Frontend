<script>
    import { Timeline, TimelineItem, Badge } from 'flowbite-svelte';
    
    export let packageDetails;

    const states = {
        'order_placed': ['purple', 'Order Placed', 'New order has been placed'],
        'processing': ['blue', 'Processing', 'Order has been processed'],
        'in_transit': ['yellow', 'In Transit', 'Order is in transit'],
        'delivered': ['pink', 'Delivered', 'Order has been delivered'],
        'cancelled': ['red', 'Cancelled', 'Order has been cancelled'],
        'collected': ['green', 'Collected', 'Order has been collected']
    }

</script>

<div>

  <Timeline>
    {#each packageDetails.states as s}
      <TimelineItem title={states[s.orderState][2]} date={s.orderDate}>
        <p class="mb-4 text-base font-normal text-gray-500 dark:text-gray-400">
          <Badge color={states[s.orderState][0]}>{states[s.orderState][1]}</Badge>
        </p>
      </TimelineItem>
    {/each}
  </Timeline>
</div>

