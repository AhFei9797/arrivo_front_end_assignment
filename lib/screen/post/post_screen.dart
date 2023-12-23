import 'package:arrivo_frond_end_assignment/configure/dimens.dart';
import 'package:arrivo_frond_end_assignment/configure/styles.dart';
import 'package:arrivo_frond_end_assignment/model/response/response_get_post.dart';
import 'package:arrivo_frond_end_assignment/screen/post/bloc/post_bloc.dart';
import 'package:arrivo_frond_end_assignment/screen/post/bloc/post_event.dart';
import 'package:arrivo_frond_end_assignment/screen/post/bloc/post_state.dart';
import 'package:arrivo_frond_end_assignment/widget/theme_button.dart';
import 'package:arrivo_frond_end_assignment/widget/theme_dialog.dart';
import 'package:arrivo_frond_end_assignment/widget/theme_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as WYSIWYG;
import 'package:pluto_grid/pluto_grid.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostScreenBloc>(
      create: ((_) {
        return PostScreenBloc()..add(OnGetPostListAction());
      }),
      child: BlocBuilder<PostScreenBloc, PostScreenState>(
        builder: (context, state) {
          if (state is PostScreenGetPostListSuccess) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(DimenConfig.horizontal_margin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Post List',
                        style: TextStyleConfig.mediumTextStyle(fontSize: DimenConfig.textSize_24),
                      ),
                      ThemeButton(
                        text: 'Add Post',
                        onPressed: () {
                          _addEditPostAction(post: ResponseOnGetPostList(), isEdit: false);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PlutoGrid(
                    configuration: PlutoGridConfiguration(
                        columnFilterConfig: PlutoGridColumnFilterConfig(
                      filters: const [
                        ...FilterHelper.defaultFilters,
                        // custom filter
                        ClassYouImplemented(),
                      ],
                      resolveDefaultColumnFilter: (column, resolver) {
                        if (column.field == 'text') {
                          return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
                        } else if (column.field == 'number') {
                          return resolver<PlutoFilterTypeGreaterThan>() as PlutoFilterType;
                        } else if (column.field == 'date') {
                          return resolver<PlutoFilterTypeLessThan>() as PlutoFilterType;
                        } else if (column.field == 'select') {
                          return resolver<ClassYouImplemented>() as PlutoFilterType;
                        }

                        return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
                      },
                    )),
                    columns: [
                      PlutoColumn(title: 'Id', field: 'id', type: PlutoColumnType.text(), readOnly: true),
                      PlutoColumn(title: 'Title', field: 'title', type: PlutoColumnType.text(), readOnly: true),
                      PlutoColumn(
                        title: 'Body',
                        field: 'body',
                        type: PlutoColumnType.text(),
                        readOnly: true,
                        width: DimenConfig.getSize(600),
                      ),
                    ],
                    rows: state.response
                        .map(
                          (e) => PlutoRow(
                            cells: {
                              'id': PlutoCell(value: e.id),
                              'title': PlutoCell(value: e.title),
                              'body': PlutoCell(value: e.body),
                            },
                          ),
                        )
                        .toList(),
                    onLoaded: (PlutoGridOnLoadedEvent event) {
                      event.stateManager.setShowColumnFilter(true);
                    },
                    onChanged: (PlutoGridOnChangedEvent event) {
                      print(event);
                    },
                    onSelected: (event) {
                      print(event);
                    },
                    onRowChecked: (event) {
                      print(event);
                    },
                    onRowDoubleTap: (event) async {
                      _addEditPostAction(post: state.response[event.row!.sortIdx!], isEdit: true);
                    },
                  ),
                )
              ],
            );
          } else if (state is SidebarMenuError) {
            return const Center(
              child: Text(
                "An error has occurred. Please try again later.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  _addEditPostAction({required ResponseOnGetPostList post, bool isEdit = false}) {
    TextEditingController _titleController = TextEditingController(text: post.title);
    WYSIWYG.QuillController _controller = WYSIWYG.QuillController.basic();

    if (isEdit) {
      _titleController.text = post.title ?? '';
      _controller.document = WYSIWYG.Document()..insert(0, post.body);
    }

    ThemeDialog.show(
        context: context,
        contentWidget: Container(
          width: DimenConfig.getScreenWidth(percent: 40),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(bottom: DimenConfig.size_24),
                      child: Text(
                        isEdit ? 'Edit Post Information' : 'Add Post Information',
                        style: TextStyleConfig.mediumTextStyle(fontSize: DimenConfig.textSize_24),
                      ),
                    ),
                    Container(alignment: Alignment.centerLeft, padding: EdgeInsets.only(bottom: DimenConfig.size_8), child: Text('Title')),
                    ThemeTextFieldWidget(
                      textEditingController: _titleController,
                    ),
                    SizedBox(
                      height: DimenConfig.horizontal_margin,
                    ),
                    Container(alignment: Alignment.centerLeft, padding: EdgeInsets.only(bottom: DimenConfig.size_8), child: Text('Body')),
                    WYSIWYG.QuillToolbar.basic(
                      controller: _controller,
                      showDividers: true,
                      multiRowsDisplay: false,
                    ),
                    Container(
                      height: DimenConfig.getSize(300),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(
                            DimenConfig.size_4,
                          ))),
                      child: WYSIWYG.QuillEditor.basic(
                        controller: _controller,
                        readOnly: false,
                      ),
                    )
                  ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ThemeButton(
                    text: 'Save',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: DimenConfig.size_24,
                  ),
                  ThemeButton(
                    color: Colors.white,
                    textStyle: TextStyleConfig.mediumTextStyle(color: Colors.black),
                    borderColor: Colors.grey,
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class ClassYouImplemented implements PlutoFilterType {
  @override
  String get title => 'Custom contains';

  @override
  get compare => ({
        required String? base,
        required String? search,
        required PlutoColumn? column,
      }) {
        var keys = search!.split(',').map((e) => e.toUpperCase()).toList();

        return keys.contains(base!.toUpperCase());
      };

  const ClassYouImplemented();
}
