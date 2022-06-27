文件夹说明
faces：MIT数据集内的灰度人脸图片
nonfaces：MIT数据集内的非人脸灰度图片
trainset：彩色人脸图片和彩色非人脸图片
faces_test：用于测试的含有人脸的图片
Result：部分测试结果
代码文件说明
GetRgbNet：获得基于肤色特征的BP网络函数
GetSigma：获得图片积分图的函数
GetEigenvalue：获得单张图片Haar特征值的函数
BatchGetEigenvalue：批量化获得图片Haar特征值的函数
GetAllNet：获得两个BP网络的代码文件
Recognition：对特定图片进行识别的代码文件（在此文件中写好图片名（faces_test文件夹内）可直接运行查看结果）

数据文件说明
facenet：训练好的基于Haar特征的BP网络
rgbnet：训练好的基于肤色特征的BP网络

使用的MATLAB版本：2016a
所有文件请放在英文目录下
作者：南京理工大学 机械工程学院 陆世豪