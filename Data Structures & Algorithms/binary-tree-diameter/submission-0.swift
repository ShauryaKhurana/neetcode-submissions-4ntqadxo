"""
diameter
left edge 
right edge 
if it its nil return 0 
diameter is left + right 
"""


class Solution {
    private var diameter: Int = 0 
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {


_ = dfs(root)

return diameter        

    }
    private func dfs(_ node: TreeNode?) -> Int{
        if node == nil {
            return 0
        }
        let leftHeight = dfs(node!.left)
        let rightHeight = dfs(node!.right)

        let localDiameter = leftHeight + rightHeight

        if localDiameter > diameter {
            diameter = localDiameter
            
        }
        let currentHeight = 1 + (leftHeight > rightHeight ? leftHeight : rightHeight)

        return currentHeight

    }
}
