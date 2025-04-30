class CartManager {
    static let shared = CartManager()  // Singleton pattern to access from anywhere in the app
    var cartItems: [(name: String, price: Double, imageName: String, quantity: Int, size: String)] = []

    // Method to add item to cart
    func addItemToCart(name: String, price: Double, imageName: String, quantity: Int, size: String) {
        // Adding item to cart
        cartItems.append((name: name, price: price, imageName: imageName, quantity: quantity, size: size))
    }

    // Optional method to remove item from cart
    func removeItemFromCart(at index: Int) {
        cartItems.remove(at: index)
    }
}
