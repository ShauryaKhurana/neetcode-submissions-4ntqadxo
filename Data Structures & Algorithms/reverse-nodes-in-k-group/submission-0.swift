class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        // Create a dummy node to handle edge cases easily
        let dummy = ListNode(0)
        dummy.next = head // connect dummy to the original head
        var groupPrev: ListNode? = dummy // will always point to the node before the group we're reversing
        
        while true {
            // Step 1: Find the kth node from groupPrev
            var kth: ListNode? = groupPrev
            for _ in 0..<k {
                kth = kth?.next // move kth one node forward
                if kth == nil { // if we don't have enough nodes, just return
                    return dummy.next
                }
            }
            // Save the next group's head
            let groupNext = kth?.next
            
            // Step 2: Reverse the group
            var prev = groupNext // will be new group's head
            var curr = groupPrev?.next // start reversing from here
            for _ in 0..<k {
                let tmp = curr?.next // save next node
                curr?.next = prev // reverse pointer
                prev = curr // move prev forward
                curr = tmp // move curr forward
            }
            // Step 3: Update pointers
            let tmp = groupPrev?.next // this is the tail after reversal
            groupPrev?.next = kth // kth is the new head of the reversed group
            groupPrev = tmp // move groupPrev to the new tail for next round
        }
    }
}

