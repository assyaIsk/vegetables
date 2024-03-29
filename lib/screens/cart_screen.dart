import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetables/cubits/cubit/my_states_cubit.dart';
import 'package:vegetables/data/cart_data.dart';
import 'package:vegetables/styles/style.dart';
import 'package:vegetables/widgets/header/header.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(screenName: 'Cart', isFirstTab: false),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Column(
                children: state.maybeWhen(
                    initial: (count) => [const EmptyCart()],
                    orElse: () {
                      if (carts.isEmpty) {
                        return [const EmptyCart()];
                      } else {
                        return carts
                            .map((item) => ListTile(
                                  title: Text(
                                      "${item.vegetable.name} - ${item.count}"),
                                ))
                            .toList();
                      }
                    }));
          },
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {
                  context.read<CartCubit>().clearCart();
                },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: AppStyles.redColor),
                icon: const Icon(
                  Icons.delete,
                  color: AppStyles.whiteColor,
                ),
                label: const Text(
                  'Clear Cart',
                  style: AppStyles.whiteTextStyle15,
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        )
      ],
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Cart is empty"));
  }
}
