import 'package:ecommerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class OrderComplete extends StatelessWidget {
  final String? orderId; // Optional: Pass order ID if available

  const OrderComplete({
    super.key,
    this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Success Animation / Icon Container
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: 120,
                    color: Colors.green.shade600,
                  ),
                ),
                const SizedBox(height: 40),

                // Main Title
                Text(
                  "Order Placed Successfully!",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900],
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                // Subtitle
                Text(
                  "Thank you for shopping with us.\nYour order is being prepared.",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // Order Info Card
                if (orderId != null)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.receipt_long_outlined,
                            color: Colors.grey),
                        const SizedBox(width: 12),
                        Text(
                          "Order ID: ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          orderId!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 48),

                // Primary Action Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton.icon(
                    onPressed: () {
                      // Navigate back or to home
                     Get.offAllNamed(AppRoutes.home);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    icon: const Icon(Icons.home_rounded, size: 24),
                    label: const Text("Back to Home"),
                  ),
                ),

                const SizedBox(height: 16),

                // Secondary Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Navigate to order tracking
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Order tracking coming soon!"),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: const Icon(Icons.track_changes_outlined),
                    label: Text(
                      "Track Order",
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}