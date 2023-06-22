import 'package:flutter/material.dart';
import 'package:gitbox/utils/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:gitbox/view/repoview.dart';

class TrendingRepoDetailView extends StatefulWidget {
  final dynamic repo;

  const TrendingRepoDetailView({Key? key, required this.repo})
      : super(key: key);

  @override
  State<TrendingRepoDetailView> createState() => _TrendingRepoDetailViewState();
}

class _TrendingRepoDetailViewState extends State<TrendingRepoDetailView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.bgColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.repo['name'] ?? 'N/A',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage(widget.repo['owner']['avatar_url']),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${widget.repo['owner']['login']}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Description: ${widget.repo['description'] ?? 'No description'}',
                style: const TextStyle(fontSize: 18, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Stars',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        '${widget.repo['stargazers_count'] ?? 'N/A'}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Forks',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        '${widget.repo['forks_count'] ?? 'N/A'}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Language',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        '${widget.repo['language'] ?? 'N/A'}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    'Last Updated:',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primary,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    '${widget.repo['updated_at'] != null ? widget.repo['updated_at'] != null : 'N/A'}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'License: ${widget.repo['license'] != null ? widget.repo['license']['name'] : 'N/A'}',
                style: const TextStyle(fontSize: 16, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RepoView(
                            url: widget.repo['html_url'],
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'View Repository',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
