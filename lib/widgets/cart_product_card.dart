import 'package:flutter/material.dart';

import '../models/models.dart';

class CardProductCard extends StatelessWidget {
  final Product product;
  const CardProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0.0, 4.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.normal),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  '\$ ${product.price}',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {},
              ),
              Text(
                '1',
                style: Theme.of(context).textTheme.headline4,
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
