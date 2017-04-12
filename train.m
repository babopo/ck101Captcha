%读取训练集
rawX2 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\2\train.xls','A1:P41');
rawY2 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\2\train.xls','Q1:U41');

rawX3 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\3\train.xls','A1:P56');
rawY3 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\3\train.xls','Q1:U56');

rawX4 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\4\train.xls','A1:P38');
rawY4 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\4\train.xls','Q1:U38');

rawX6 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\6\train.xls','A1:P62');
rawY6 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\6\train.xls','Q1:U62');

rawX7 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\7\train.xls','A1:P48');
rawY7 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\7\train.xls','Q1:U48');

rawX8 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\8\train.xls','A1:P56');
rawY8 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\8\train.xls','Q1:U56');

rawX9 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\9\train.xls','A1:P55');
rawY9 = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\9\train.xls','Q1:U55');

rawXB = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\B\train.xls','A1:P44');
rawYB = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\B\train.xls','Q1:U44');

rawXC = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\C\train.xls','A1:P155');
rawYC = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\C\train.xls','Q1:U155');

rawXE = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\E\train.xls','A1:P121');
rawYE = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\E\train.xls','Q1:U121');

rawXF = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\F\train.xls','A1:P42');
rawYF = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\F\train.xls','Q1:U42');

rawXG = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\G\train.xls','A1:P44');
rawYG = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\G\train.xls','Q1:U44');

rawXH = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\H\train.xls','A1:P40');
rawYH = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\H\train.xls','Q1:U40');

rawXJ = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\J\train.xls','A1:P52');
rawYJ = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\J\train.xls','Q1:U52');

rawXK = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\K\train.xls','A1:P49');
rawYK = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\K\train.xls','Q1:U49');

rawXM = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\M\train.xls','A1:P47');
rawYM = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\M\train.xls','Q1:U47');

rawXP = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\P\train.xls','A1:P41');
rawYP = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\P\train.xls','Q1:U41');

rawXQ = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\Q\train.xls','A1:P52');
rawYQ = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\Q\train.xls','Q1:U52');

rawXR = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\R\train.xls','A1:P42');
rawYR = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\R\train.xls','Q1:U42');

rawXT = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\T\train.xls','A1:P46');
rawYT = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\T\train.xls','Q1:U46');

rawXV = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\V\train.xls','A1:P43');
rawYV = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\V\train.xls','Q1:U43');

rawXW = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\W\train.xls','A1:P41');
rawYW = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\W\train.xls','Q1:U41');

rawXX = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\X\train.xls','A1:P53');
rawYX = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\X\train.xls','Q1:U53');

rawXY = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\Y\train.xls','A1:P51');
rawYY = xlsread('C:\Users\Limbo\Desktop\毕设\验证码\卡提诺\CharactorSrc\Y\train.xls','Q1:U51');

%汇集所有数据并转置
xdata = [rawX2',rawX3',rawX4',rawX6',rawX7',rawX8',rawX9',rawXB',rawXC',rawXE',rawXF',rawXG',rawXH',rawXJ',rawXK',rawXM',rawXP',rawXQ',rawXR',rawXT',rawXV',rawXW',rawXX',rawXY'];

%labels
ydata = [rawY2',rawY3',rawY4',rawY6',rawY7',rawY8',rawY9',rawYB',rawYC',rawYE',rawYF',rawYG',rawYH',rawYJ',rawYK',rawYM',rawYP',rawYQ',rawYR',rawYT',rawYV',rawYW',rawYX',rawYY'];