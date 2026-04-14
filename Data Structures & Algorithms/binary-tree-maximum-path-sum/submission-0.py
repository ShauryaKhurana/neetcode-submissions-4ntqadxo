# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def maxPathSum(self, root: Optional['TreeNode']) -> int:
        # This will hold the maximum path sum found anywhere in the tree.
        # Initialize with a very small number so any path improves it.
        self.best = -10**15

        def dfs(node: Optional['TreeNode']) -> int:
            """
            Returns the maximum path sum starting at `node` and going downward
            (can only move to one child: left or right).
            While doing that, it updates self.best with any better path
            that passes through this node.
            """
            if node is None:
                # If there is no node, the contribution to any path is zero.
                # For downward paths, we don't want to add anything.
                return 0

            # Recursively compute the best downward sum from left and right children.
            left_gain = dfs(node.left)
            right_gain = dfs(node.right)

            # If a side is negative, it's better to ignore it for extending paths.
            if left_gain < 0:
                left_gain = 0
            if right_gain < 0:
                right_gain = 0

            # Best path that uses this node as the "highest" point (can use both children).
            current_path_sum = node.val + left_gain + right_gain

            # Update global best if this path is better.
            if current_path_sum > self.best:
                self.best = current_path_sum

            # Return the best downward path starting from this node.
            # We can only extend in one direction (left or right).
            return node.val + (left_gain if left_gain > right_gain else right_gain)

        # Start DFS from the root to fill self.best.
        dfs(root)
        return self.best