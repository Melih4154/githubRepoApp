import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:github_repo_projects/models/repo/repo_model.dart';
import 'package:github_repo_projects/providers/repo_provider.dart';
import 'package:github_repo_projects/utils/extensions.dart';
import 'package:github_repo_projects/utils/styles.dart';
import 'package:github_repo_projects/widgets/card/card_widget.dart';
import 'package:github_repo_projects/widgets/custom_app_bar.dart';
import 'package:github_repo_projects/widgets/custom_button.dart';
import 'package:github_repo_projects/widgets/fields/custom_text_field.dart';
import 'package:github_repo_projects/widgets/loading_overlay.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  HomePage({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, ref) {
    final repo = ref.watch(repoProvider);

    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Githup Repo',
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 15, vertical: 10),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    name: 'username',
                    label: const Text('Username'),
                    labelStyle: TextStyle(color: S.colors.orange),
                    textStyle: TextStyle(color: S.colors.orange),
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    title: "List",
                    bgColor: S.colors.appbarColor,
                    style: TextStyle(
                      color: S.colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    onTap: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        final data = _formKey.currentState!.value;
                        repo.getRepo(username: data['username']);
                      }
                    },
                  ),
                  SizedBox(height: 10.h),
                  LoadingOverlay(
                    list: repo.repos,
                    child: repo.repos.isEmpty
                        ? const Center(
                            child: Text("Repo Not Found"),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: repo.repos.length,
                            itemBuilder: (context, i) {
                              List<Repo> repos = repo.repos;
                              return CardWidget(
                                label: repos[i].name!,
                                onTap: () {},
                                icon: null,
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
