import 'package:closeby/components/searchbar/search_input.dart';
import 'package:closeby/controller/searchbar_controller.dart';
import 'package:closeby/model/searchbar_model.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final SearchbarController controller = SearchbarController();

  SearchbarModel model = SearchbarModel();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => const SearchInput().launch(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 10, bottom: 0, top: 0),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColor.lightGrey),
            borderRadius: BorderRadius.circular(16),
            boxShadow: AppShadow.lightShadow,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    model.selectedGood == 'Anything'
                        ? 'What are you looking for?'
                        : model.selectedGood,
                    style: AppFonts.figtree(),
                  ),
                  Text(
                    '${model.selectedPlace} · ${model.selectedDate}',
                    style: AppFonts.figtree(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColor.secondaryBlack),
                  )
                ],
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.darkGrey, width: 1),
                ),
                child: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
