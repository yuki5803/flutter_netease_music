import 'package:flutter_screenutil/flutter_screenutil.dart';

rw(int width) {
  return ScreenUtil().setWidth(width);
}

rh(int height) {
  return ScreenUtil().setHeight(height);
}

sp(int size) {
  return ScreenUtil().setSp(size);
}
// height: MediaQuery.of(context).size.height,
