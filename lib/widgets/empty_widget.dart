import 'package:flutter/material.dart';
import 'package:github_repo_projects/widgets/custom_button.dart';
import 'package:github_repo_projects/widgets/custom_image.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
    this.image,
    this.title,
    this.description,
    this.onTap,
    this.buttonTitle = '',
  }) : super(key: key);

  final String? image;
  final String? title;
  final String? description;
  final void Function()? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null)
            SizedBox(
              width: double.infinity,
              child: CustomImage.asset(image),
            ),
          const SizedBox(height: 20),
          if (title != null)
            Text(
              title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          const SizedBox(height: 10),
          if (description != null)
            Text(
              description!,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          if (onTap != null)
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CustomButton(
                title: title,
                onTap: onTap ?? () {},
              ),
            )
        ],
      ),
    );
  }
}
