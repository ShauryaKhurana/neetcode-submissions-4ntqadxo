class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        # Set the value for this node
        self.val = val
        # Set the left child node
        self.left = left
        # Set the right child node
        self.right = right

class Codec:
    def serialize(self, root):
        # Helper function for preorder DFS
        def dfs(node):
            # If node is None, append 'null'
            if not node:
                vals.append('null')
                return
            # Append the value of the node
            vals.append(str(node.val))
            # Recurse on the left child
            dfs(node.left)
            # Recurse on the right child
            dfs(node.right)
        # List to store the serialized values
        vals = []
        # Start DFS from the root
        dfs(root)
        # Join the list into a string separated by commas
        return ','.join(vals)

    def deserialize(self, data):
        # Split the data into a list
        vals = iter(data.split(','))
        # Helper function for preorder DFS
        def dfs():
            # Get the next value
            val = next(vals)
            # If it's 'null', return None
            if val == 'null':
                return None
            # Create a new node with the value
            node = TreeNode(int(val))
            # Recursively build the left child
            node.left = dfs()
            # Recursively build the right child
            node.right = dfs()
            # Return the constructed node
            return node
        # Start DFS to reconstruct the tree
        return dfs()