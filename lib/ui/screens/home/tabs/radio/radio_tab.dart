import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/radio_model.dart';

import 'radio_view_model.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  late RadioViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = RadioViewModel();
  }

  @override
  Widget build(BuildContext context) {
    List<RadioItemModel> currentList =
    viewModel.isRadioSelected ? viewModel.radioList : viewModel.recitersList;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.groupBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: context.height * 0.06),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.blackColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          viewModel.toggleTab(true, (fn) => setState(fn)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: viewModel.isRadioSelected
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Radio",
                          style: AppStyles.bold24Primary.copyWith(
                            color: viewModel.isRadioSelected
                                ? AppColors.blackColor
                                : AppColors.whiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          viewModel.toggleTab(false, (fn) => setState(fn)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !viewModel.isRadioSelected
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Reciters",
                          style: AppStyles.bold24Primary.copyWith(
                            color: !viewModel.isRadioSelected
                                ? AppColors.blackColor
                                : AppColors.whiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.height * 0.03),

            Expanded(
              child: ListView.separated(
                itemCount: currentList.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: context.height * 0.02),
                itemBuilder: (context, index) {
                  return RadioCardItem(
                    item: currentList[index],
                    onPlayPressed: () =>
                        viewModel.togglePlay(
                            currentList[index], (fn) => setState(fn)),
                    onMutePressed: () =>
                        viewModel.toggleMute(
                            currentList[index], (fn) => setState(fn)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioCardItem extends StatelessWidget {
  final RadioItemModel item;
  final VoidCallback onPlayPressed;
  final VoidCallback onMutePressed;

  const RadioCardItem({
    super.key,
    required this.item,
    required this.onPlayPressed,
    required this.onMutePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
            item.isPlaying
                ? 'assets/images/soundWave 1.png'
                : 'assets/images/Mosque-02.png',
          ),
          fit: item.isPlaying ? BoxFit.fitWidth : BoxFit.cover,
          opacity: item.isPlaying ? 0.85 : 0.25,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.title,
            style: AppStyles.bold24Primary.copyWith(
              color: AppColors.blackColor,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onPlayPressed,
                icon: Icon(
                  item.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 38,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(width: 25),
              IconButton(
                onPressed: onMutePressed,
                icon: Icon(
                  item.isMuted ? Icons.volume_off : Icons.volume_up,
                  size: 30,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}