import 'package:flutter/material.dart';
import 'package:movieapp/shared/components/constants.dart';
import '../model/movie.dart';

class MovieViewItem extends StatelessWidget {
final Movie movie;

MovieViewItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8,),
      margin: EdgeInsets.symmetric(horizontal:16,),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: const Offset(0,0),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(baseImagePath+movie.posterPath!,height: 100,),
          ),
        const  SizedBox(width: 16,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.title!,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black87),overflow: TextOverflow.ellipsis,),
              SizedBox(height: 16,),
              Expanded(child: Text(movie.overview!,style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black12),overflow: TextOverflow.ellipsis,maxLines: 4,)),

            ],
          ),),
        ],
      ),
    );
  }
}
