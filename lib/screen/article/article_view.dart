import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Artikel',
          style: semiBold16Black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_border, color: green600),
          )
        ],
        elevation: 0,
        backgroundColor: grey10,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 24),
            child: TextFormComponent(
                controller: controller,
                errortext: 'error Text',
                hintText: 'Cari Artikel',
                prefixIcon: Icons.search), //change tfc
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/article_thumbnail.png',
                        width: 87,
                        height: 87,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: 225,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Permasalahan Kesehatan Umum pada Organ Reproduksi Perempuan',
                            style: semiBold12Black,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/doctor_image.png',
                                  width: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Column(
                                children: [
                                  Text('dr. Farhan M', style: medium10Black),
                                  Text(
                                    '1 November 2023',
                                    style: regular8Black,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.bookmark_add_outlined))
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
