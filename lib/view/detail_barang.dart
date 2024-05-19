import 'package:flutter/material.dart';
import '../model/barang.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailBarang extends StatelessWidget {
  final Product product;

  const DetailBarang({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 225, 79, 128),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: product.image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.price_change),
                  const SizedBox(width: 8),
                  Text('Price: \$${product.price}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Text(product.description, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
