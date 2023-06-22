import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gitbox/utils/appcolors.dart';
import 'package:gitbox/view/trendingrepodetailview.dart';

class TrendingView extends StatefulWidget {
  const TrendingView({super.key});

  @override
  State<TrendingView> createState() => _TrendingViewState();
}

class _TrendingViewState extends State<TrendingView> {
  List<dynamic> _trendingRepositories = [];

  @override
  void initState() {
    super.initState();
    _fetchTrendingRepositories();
  }

  Future<void> _fetchTrendingRepositories() async {
    final response = await http.get(
      Uri.parse(
          'https://api.github.com/search/repositories?q=stars:%3E1&sort=stars&order=desc'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _trendingRepositories = data['items'];
      });
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to fetch trending repositories.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
      child: _trendingRepositories.isNotEmpty
          ? ListView.separated(
              itemCount: _trendingRepositories.length,
              itemBuilder: (context, index) {
                final repo = _trendingRepositories[index.toInt()];
                return SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TrendingRepoDetailView(
                                  repo: _trendingRepositories[index.toInt()]),
                            ),
                          );
                        },
                        title: Text(
                          repo['name'] ?? 'N/A',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        subtitle: Text(
                          repo['description'] ?? 'No description',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
    );
  }
}
