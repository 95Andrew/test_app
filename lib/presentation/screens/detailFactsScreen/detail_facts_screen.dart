import 'package:app/data/entity/detail_fact.dart';
import 'package:app/data/helpers/date_helper.dart';
import 'package:app/presentation/shared/app_sizes.dart';
import 'package:flutter/material.dart';

class DetailFactsScreen extends StatelessWidget {
  final List<DetailFact> listDetailFacts;

  const DetailFactsScreen({
    Key? key,
    required this.listDetailFacts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listDetailFacts.length,
            itemBuilder: (context, int index) {
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueAccent,
                    ),
                  ),
                  padding: const EdgeInsets.all(
                    AppSizes.size10,
                  ),
                  margin: const EdgeInsets.all(
                    AppSizes.size10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        listDetailFacts[index].description,
                      ),
                      const SizedBox(
                        height: AppSizes.size10,
                      ),
                      Text(
                        transformationDate(
                          listDetailFacts[index].data,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
