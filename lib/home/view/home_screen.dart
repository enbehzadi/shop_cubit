import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/home/cubit/post_cubit.dart';
import 'package:shop_cubit/home/cubit/post_state.dart';
import 'package:shop_cubit/home/model/model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostCubit>(context).fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BloC Cubit'),
        ),
        body: BlocBuilder<PostCubit, PostState>(builder: (context, state) {
          if (state is PostInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {

            final post = (state as PostLoaded).post;
            return SingleChildScrollView(
             /* child: Column(

                children: post.map((e) => buildGridProduct(e, context)).toList(),
              ),*/
              child: Container(
                color: Colors.grey,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount:post.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,

                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) =>
                      buildGridProduct(post[index], context),

                ),
              ),
            );

          }
          else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 8.0,
                backgroundColor: Colors.green,
              ),
            );
          }
        }));
  }

  Widget _cardWidget(ProductModel post, BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.all(15.0),
      shape:
      Border.all(color: Colors.black, width: 1, style: BorderStyle.solid),
      shadowColor: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${post.id} : ${post.description}',
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildGridProduct(ProductModel productModel, context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    productModel.image,
                  ),
                  fit: BoxFit.contain,
                  height: 200,
                  width: double.infinity,
                ),


              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$${productModel.price}',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      overflow: TextOverflow.fade,
                    ),


                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: CircleAvatar(
                        radius: 20,

                        child: Icon(
                          Icons.favorite
                        ),
                      ),
                      onPressed: () {
                        /*AppCubit.get(context)
                            .changeFavoritesData(productModel.id);*/
                      },
                    ),
                  ],
                ),
                Row(
                  children: [



                  
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: CircleAvatar(
                        radius: 20,

                        child: Icon(
                            Icons.shopping_basket
                        ),
                      ),
                      onPressed: () {
                        /*AppCubit.get(context)
                            .changeFavoritesData(productModel.id);*/
                      },
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

}