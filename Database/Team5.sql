/*
Navicat SQL Server Data Transfer

Source Server         : localhost sqlserver
Source Server Version : 110000
Source Host           : localhost,1433:1433
Source Database       : Team5
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 110000
File Encoding         : 65001

Date: 2015-10-21 07:17:49
*/


-- ----------------------------
-- Table structure for Admin
-- ----------------------------
DROP TABLE [dbo].[Admin]
GO
CREATE TABLE [dbo].[Admin] (
[AdminID] int NOT NULL IDENTITY(1,1) ,
[Username] varchar(30) NULL ,
[Password] varchar(30) NULL 
)


GO

-- ----------------------------
-- Records of Admin
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Admin] ON
GO
INSERT INTO [dbo].[Admin] ([AdminID], [Username], [Password]) VALUES (N'1', N'Admin', N'123')
GO
GO
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO

-- ----------------------------
-- Table structure for Category
-- ----------------------------
DROP TABLE [dbo].[Category]
GO
CREATE TABLE [dbo].[Category] (
[CategoryID] int NOT NULL IDENTITY(1,1) ,
[CategoryName] nvarchar(100) NULL ,
[CategoryDescription] nvarchar(400) NULL ,
[Status] bit NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Category]', RESEED, 1005)
GO

-- ----------------------------
-- Records of Category
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Category] ON
GO
INSERT INTO [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (N'1', N'Game Chiến Thuật', N'Tổng hợp game chiến thuật cực hay', N'1')
GO
GO
INSERT INTO [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (N'2', N'Game Hành Động', N'Kho game hành động mới nhất, cập nhật liên tục', N'1')
GO
GO
INSERT INTO [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (N'3', N'Game Đánh Bài', N'Tổng hợp game đánh bài hay', N'1')
GO
GO
INSERT INTO [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (N'1003', N'Game Đua Xe', N'Tổng hợp game đua xe hay', N'1')
GO
GO
INSERT INTO [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (N'1004', N'Game Nhập Vai', N'Tổng Hợp Game Nhập Vai Hay', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO

-- ----------------------------
-- Table structure for Comment
-- ----------------------------
DROP TABLE [dbo].[Comment]
GO
CREATE TABLE [dbo].[Comment] (
[CommentID] int NOT NULL IDENTITY(1,1) ,
[CommentDetail] ntext NULL ,
[GameID] int NULL ,
[MemberID] int NULL ,
[CommentStatus] bit NULL ,
[CommentTime] datetime NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Comment]', RESEED, 11)
GO

-- ----------------------------
-- Records of Comment
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Comment] ON
GO
INSERT INTO [dbo].[Comment] ([CommentID], [CommentDetail], [GameID], [MemberID], [CommentStatus], [CommentTime]) VALUES (N'1', N'Game này chơi hay lắm', N'6', N'1', N'1', N'2015-10-19 06:58:53.000')
GO
GO
INSERT INTO [dbo].[Comment] ([CommentID], [CommentDetail], [GameID], [MemberID], [CommentStatus], [CommentTime]) VALUES (N'3', N'Game này chơi hay lắm', N'6', N'1007', N'1', N'2015-10-19 06:58:53.000')
GO
GO
INSERT INTO [dbo].[Comment] ([CommentID], [CommentDetail], [GameID], [MemberID], [CommentStatus], [CommentTime]) VALUES (N'4', N'Xin chào mọi người', N'6', N'1', N'1', N'2015-10-19 07:11:05.297')
GO
GO
INSERT INTO [dbo].[Comment] ([CommentID], [CommentDetail], [GameID], [MemberID], [CommentStatus], [CommentTime]) VALUES (N'5', N'Đây là bình luận của tôi', N'6', N'1', N'1', N'2015-10-19 07:11:14.870')
GO
GO
INSERT INTO [dbo].[Comment] ([CommentID], [CommentDetail], [GameID], [MemberID], [CommentStatus], [CommentTime]) VALUES (N'7', N'Game này chơi cũng được', N'7', N'1', null, N'2015-10-19 07:21:26.287')
GO
GO
INSERT INTO [dbo].[Comment] ([CommentID], [CommentDetail], [GameID], [MemberID], [CommentStatus], [CommentTime]) VALUES (N'8', N'Game này có Ship tận nhà không bạn ơi', N'8', N'1007', null, N'2015-10-19 08:55:01.260')
GO
GO
INSERT INTO [dbo].[Comment] ([CommentID], [CommentDetail], [GameID], [MemberID], [CommentStatus], [CommentTime]) VALUES (N'9', N'Game công thành chiến này mắc ghê', N'2', N'1007', null, N'2015-10-19 08:55:29.753')
GO
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO

-- ----------------------------
-- Table structure for Feedback
-- ----------------------------
DROP TABLE [dbo].[Feedback]
GO
CREATE TABLE [dbo].[Feedback] (
[FeedbackID] int NOT NULL IDENTITY(1,1) ,
[FeedbackDetail] ntext NULL ,
[MemberID] int NULL ,
[FeedbackTitle] nvarchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Feedback]', RESEED, 8)
GO

-- ----------------------------
-- Records of Feedback
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Feedback] ON
GO
INSERT INTO [dbo].[Feedback] ([FeedbackID], [FeedbackDetail], [MemberID], [FeedbackTitle]) VALUES (N'1', N'Xin chào Admin, tôi đã gửi Feedback cho bạn', N'1', N'Xin chào')
GO
GO
INSERT INTO [dbo].[Feedback] ([FeedbackID], [FeedbackDetail], [MemberID], [FeedbackTitle]) VALUES (N'3', N'Tôi muốn đặt số lượng hàng lớn, nếu bạn có mong muốn hợp tác. Vui lòng liên hệ với tôi : 0991225547', N'1', N'Đơn yêu cầu đặt hàng')
GO
GO
INSERT INTO [dbo].[Feedback] ([FeedbackID], [FeedbackDetail], [MemberID], [FeedbackTitle]) VALUES (N'4', N'Trang web của bạn thật đẹp', N'1009', N'Xin chào')
GO
GO
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO

-- ----------------------------
-- Table structure for Game
-- ----------------------------
DROP TABLE [dbo].[Game]
GO
CREATE TABLE [dbo].[Game] (
[GameID] int NOT NULL IDENTITY(1,1) ,
[GameTitle] nvarchar(200) NULL ,
[GameDetail] ntext NULL ,
[GamePrice] money NULL ,
[GameImage] varchar(200) NULL ,
[CategoryID] int NULL ,
[Status] bit NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Game]', RESEED, 1008)
GO

-- ----------------------------
-- Records of Game
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Game] ON
GO
INSERT INTO [dbo].[Game] ([GameID], [GameTitle], [GameDetail], [GamePrice], [GameImage], [CategoryID], [Status]) VALUES (N'1', N'Game đua xe mô tô', N'Game đua xe mô tô', N'125000.0000', N'1.png', N'1003', N'1')
GO
GO
INSERT INTO [dbo].[Game] ([GameID], [GameTitle], [GameDetail], [GamePrice], [GameImage], [CategoryID], [Status]) VALUES (N'2', N'Game công thành chiến', N'Game công thành chiến', N'125000.0000', N'9.png', N'1', N'1')
GO
GO
INSERT INTO [dbo].[Game] ([GameID], [GameTitle], [GameDetail], [GamePrice], [GameImage], [CategoryID], [Status]) VALUES (N'3', N'Game robo đại chiến', N'Game robo đại chiến', N'100000.0000', N'3.jpg', N'2', N'1')
GO
GO
INSERT INTO [dbo].[Game] ([GameID], [GameTitle], [GameDetail], [GamePrice], [GameImage], [CategoryID], [Status]) VALUES (N'4', N'Game powling', N'Game powling', N'170000.0000', N'4.jpg', N'2', N'1')
GO
GO
INSERT INTO [dbo].[Game] ([GameID], [GameTitle], [GameDetail], [GamePrice], [GameImage], [CategoryID], [Status]) VALUES (N'5', N'Game bắn vịt', N'Game bắn vịt', N'100000.0000', N'5.jpg', N'1', N'1')
GO
GO
INSERT INTO [dbo].[Game] ([GameID], [GameTitle], [GameDetail], [GamePrice], [GameImage], [CategoryID], [Status]) VALUES (N'6', N'Game Dacing', N'Game Dacing', N'90000.0000', N'6.jpg', N'1004', N'1')
GO
GO
INSERT INTO [dbo].[Game] ([GameID], [GameTitle], [GameDetail], [GamePrice], [GameImage], [CategoryID], [Status]) VALUES (N'7', N'Game đua xe', N'Game đua xe', N'70000.0000', N'7.jpg', N'1003', N'1')
GO
GO
INSERT INTO [dbo].[Game] ([GameID], [GameTitle], [GameDetail], [GamePrice], [GameImage], [CategoryID], [Status]) VALUES (N'8', N'Game bạo phong', N'Game bạo phong', N'50000.0000', N'8.png', N'1004', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[Game] OFF
GO

-- ----------------------------
-- Table structure for Member
-- ----------------------------
DROP TABLE [dbo].[Member]
GO
CREATE TABLE [dbo].[Member] (
[MemberID] int NOT NULL IDENTITY(1,1) ,
[Username] varchar(30) NULL ,
[Password] varchar(30) NULL ,
[MemberName] nvarchar(50) NULL ,
[MemberAddress] nvarchar(300) NULL ,
[MemberMobile] varchar(11) NULL ,
[MemberEmail] varchar(60) NULL ,
[Status] tinyint NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Member]', RESEED, 1011)
GO

-- ----------------------------
-- Records of Member
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Member] ON
GO
INSERT INTO [dbo].[Member] ([MemberID], [Username], [Password], [MemberName], [MemberAddress], [MemberMobile], [MemberEmail], [Status]) VALUES (N'1', N'DucAnh', N'1234567', N'Lê Đức Anh', N'Thành phố Hồ Chí Minh', N'01685000113', N'DucAnh@gmail.com', N'1')
GO
GO
INSERT INTO [dbo].[Member] ([MemberID], [Username], [Password], [MemberName], [MemberAddress], [MemberMobile], [MemberEmail], [Status]) VALUES (N'1007', N'ThanhHuy', N'123456', N'Nguyễn Võ Thanh Huy', N'Thành phố Hồ Chí Minh', N'01685000113', N'ThanhHuy@gmail.com', N'1')
GO
GO
INSERT INTO [dbo].[Member] ([MemberID], [Username], [Password], [MemberName], [MemberAddress], [MemberMobile], [MemberEmail], [Status]) VALUES (N'1008', N'MinhKhanh', N'123456', N'Lâm Minh Khanh', N'Thành phố Hồ Chí Minh', N'01685000113', N'MinhKhanh@gmail.com', N'1')
GO
GO
INSERT INTO [dbo].[Member] ([MemberID], [Username], [Password], [MemberName], [MemberAddress], [MemberMobile], [MemberEmail], [Status]) VALUES (N'1009', N'NgocThien', N'123456', N'Trần Ngọc Thiện', N'Thành phố Hồ Chí Minh', N'01685000113', N'NgocThien@gmail.com', N'1')
GO
GO
INSERT INTO [dbo].[Member] ([MemberID], [Username], [Password], [MemberName], [MemberAddress], [MemberMobile], [MemberEmail], [Status]) VALUES (N'1010', N'TienThai', N'123456', N'TienThai', N'TienThai', N'01685000113', N'TienThai@gmail.com', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[Member] OFF
GO

-- ----------------------------
-- Table structure for News
-- ----------------------------
DROP TABLE [dbo].[News]
GO
CREATE TABLE [dbo].[News] (
[NewsID] int NOT NULL IDENTITY(1,1) ,
[NewsTitle] nvarchar(200) NULL ,
[NewsDetail] ntext NULL ,
[NewsDate] datetime NULL ,
[NewsImage] varchar(100) NULL ,
[NewsDescription] varchar(300) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[News]', RESEED, 9)
GO

-- ----------------------------
-- Records of News
-- ----------------------------
SET IDENTITY_INSERT [dbo].[News] ON
GO
INSERT INTO [dbo].[News] ([NewsID], [NewsTitle], [NewsDetail], [NewsDate], [NewsImage], [NewsDescription]) VALUES (N'5', N'Trải nghiệm Contra Online - Game mới ra mắt tại Việt Nam', N'<h2>Contra Online l&agrave; tựa game bắn s&uacute;ng g&oacute;c nh&igrave;n thứ 3 c&oacute; sự kết hợp kh&aacute; độc đ&aacute;o giữa 3 thể loại đang rất được ưa chuộng tr&ecirc;n thị trường l&agrave; nhập vai, bắn s&uacute;ng v&agrave; h&agrave;nh động.</h2>

<ul>
</ul>

<p>V&agrave;o 10h s&aacute;ng ng&agrave;y 15/10,&nbsp;<a href="http://gamek.vn/gmo.htm" target="_blank">gMO</a>&nbsp;<strong><a href="http://gamek.vn/contra-online.htm" target="_blank">Contra Online</a></strong>&nbsp;đ&atilde; ch&iacute;nh thức được NPH VNG mở Close beta kh&ocirc;ng reset nh&acirc;n vật đ&oacute;n&nbsp;<a href="http://gamek.vn/game-thu-viet.htm" target="_blank">game thủ Việt</a>&nbsp;v&agrave;o trải nghiệm. Hiện tại, người chơi c&oacute; thể dễ d&agrave;ng theo d&otilde;i th&ocirc;ng tin cũng như tải game về ngay tại trang chủ&nbsp;<a href="http://contra.360game.vn/" target="_blank">http://contra.360game.vn/</a></p>

<p style="text-align:center;"><img alt="Trải nghiệm Contra Online - Game mới ra mắt tại Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/1-1445170403699/trai-nghiem-contra-online-game-moi-ra-mat-tai-viet-nam.png" /></p>

<p><strong><a href="http://gamek.vn/mobile-social/cung-soi-contra-online-ngay-dau-ra-mat-tai-viet-nam-20151015135501778.chn" target="_blank">Contra Online</a></strong>&nbsp;l&agrave; tựa&nbsp;<a href="http://gamek.vn/game-ban-sung.htm" target="_blank">game bắn s&uacute;ng</a>&nbsp;g&oacute;c nh&igrave;n thứ 3 c&oacute; sự kết hợp kh&aacute; độc đ&aacute;o giữa 3 thể loại đang rất được ưa chuộng tr&ecirc;n thị trường l&agrave; nhập vai, bắn s&uacute;ng v&agrave; h&agrave;nh động. Bối cảnh trong game xoay quanh cuộc phi&ecirc;u lưu của c&aacute;c nh&agrave; th&aacute;m hiểm đi khắp thế giới t&igrave;m kiếm kho b&aacute;u được canh giữ bởi nhưng con qu&aacute;i vật v&ocirc; c&ugrave;ng gh&ecirc; sợ.</p>

<p style="text-align:center;"><img alt="Trải nghiệm Contra Online - Game mới ra mắt tại Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/2-1445170403839/trai-nghiem-contra-online-game-moi-ra-mat-tai-viet-nam.png" /></p>

<p><strong>Contra Online</strong>&nbsp;mang phong c&aacute;ch thiết kế hoạt họa phương T&acirc;y, m&agrave;u sắc được phối hợp tươi s&aacute;ng v&agrave; bắt mắt, hiệu ứng đổ b&oacute;ng tương đối xuất sắc. Ở trong c&aacute;c phụ bản th&igrave; camera sẽ được kh&oacute;a ở g&oacute;c 2.5D. Với đề t&agrave;i th&aacute;m hiểm thế giới n&ecirc;n tr&ograve; chơi đ&atilde; x&acirc;y dựng rất nhiều khu di t&iacute;ch dựa theo lịch sử nh&acirc;n loại. Người chơi sẽ được kh&aacute;m ph&aacute; những phụ bản được x&acirc;y dựng chi tiết với bối cảnh lăng mộ Tần Thủy Ho&agrave;ng, Cổ Trường Th&agrave;nh hay Kim Tự Th&aacute;p của Ai Cập&hellip;</p>

<p style="text-align:center;"><img alt="Trải nghiệm Contra Online - Game mới ra mắt tại Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/3-1445170403742/trai-nghiem-contra-online-game-moi-ra-mat-tai-viet-nam.png" /></p>

<p>Lối chơi của&nbsp;<strong>Contra Online</strong>&nbsp;kh&aacute; đơn giản người chơi sẽ điều khiển nh&acirc;n vật của m&igrave;nh di chuyển, tr&aacute;nh n&eacute; đ&ograve;n tấn c&ocirc;ng của qu&aacute;i vật xung quanh c&ograve;n việc ngắm v&agrave; bắn l&agrave; ho&agrave;n to&agrave;n tự động. Nhiệm vụ của người chơi sẽ l&agrave; vượt qua c&aacute;c phụ bản với cấp độ tăng dần, ti&ecirc;u diệt hết qu&aacute;i vật v&agrave; thu lượm v&agrave;ng rơi tr&ecirc;n mặt đất. Ngo&agrave;i c&aacute;ch bắn th&ocirc;ng thường như những tựa game bắn s&uacute;ng kh&aacute;c, Contra mang đến cho game thủ 4 kỹ năng ch&iacute;nh v&agrave; một kỹ năng đặc biết c&oacute; khả năng c&ocirc;ng ph&aacute; lớn v&agrave; ti&ecirc;u diệt nhiều qu&aacute;i vật c&ugrave;ng l&uacute;c v&agrave; cũng cần c&oacute; thời gian hồi phục lượng mana ti&ecirc;u hao.</p>

<p style="text-align:center;"><img alt="Trải nghiệm Contra Online - Game mới ra mắt tại Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/4-1445170404031/trai-nghiem-contra-online-game-moi-ra-mat-tai-viet-nam.png" /></p>

<p>Cơ chế điều khiển trong game cũng rất quen thuộc th&ocirc;ng qua c&aacute;c ph&iacute;m ảo tr&ecirc;n m&agrave;n h&igrave;nh gi&uacute;p cho người chơi c&oacute; thể thao t&aacute;c dễ d&agrave;ng.</p>

<p style="text-align:center;"><img alt="Trải nghiệm Contra Online - Game mới ra mắt tại Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/5-1445170403786/trai-nghiem-contra-online-game-moi-ra-mat-tai-viet-nam.png" /></p>

<p>B&ecirc;n cạnh đ&oacute;,<strong>Contra Online&nbsp;</strong>vẫn mang đầy đủ t&iacute;nh năng cơ bản của tựa game bắn s&uacute;ng như thăng cấp nh&acirc;n vật, thắng sao, n&acirc;ng cấp kỹ năng, cường h&oacute;a nhằm gia tăng lực chiến cho nh&acirc;n vật. Tr&ograve; chơi cũng c&oacute; hệ thống đấu trường theo bảng xếp hạng với một số t&iacute;nh năng thường thấy ở game thẻ b&agrave;i thế hế mới.</p>', N'2015-10-19 11:28:29.447', N'contra.jpg', N'Contra Online là t?a game b?n súng góc nhìn th? 3 có s? k?t h?p khá d?c dáo gi?a 3 th? lo?i dang r?t du?c ua chu?ng trên th? tru?ng là nh?p vai, b?n súng và hành d?ng.')
GO
GO
INSERT INTO [dbo].[News] ([NewsID], [NewsTitle], [NewsDetail], [NewsDate], [NewsImage], [NewsDescription]) VALUES (N'6', N'Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam', N'<p>Theo th&ocirc;ng tin mới nhận được,&nbsp;<a href="http://gamek.vn/game-online.htm" target="_blank">game online</a>&nbsp;Ma Thần Chiến Kỷ 3D - Crystal Saga 3D sẽ được ph&aacute;t h&agrave;nh tại Việt Nam trong thời gian tới dưới t&ecirc;n ch&iacute;nh thức l&agrave;&nbsp;<strong><a href="http://gamek.vn/luc-dia-hoan-my.htm" target="_blank">Lục Địa Ho&agrave;n Mỹ</a></strong>. Đ&acirc;y l&agrave; game online với đồ họa dạng chibi c&ugrave;ng nền tảng 3D kh&aacute; tươi s&aacute;ng hợp với thị hiếu game thủ nước nh&agrave;.</p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/1-1445227729481/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.jpg" /></p>

<p><strong>Lục Địa Ho&agrave;n Mỹ</strong>&nbsp;sở hữu hệ thống bay lượn v&agrave; PK tr&ecirc;n kh&ocirc;ng v&ocirc; c&ugrave;ng độc đ&aacute;o. Với hệ thống c&aacute;nh đa dạng, lộng lẫy, game mang đến cho người chơi một trải nghiệm v&ocirc; c&ugrave;ng th&uacute; vị. Khi tham gia chơi<a href="http://gamek.vn/">game</a>, game thủ c&oacute; thể một bước bay v&uacute;t l&ecirc;n trời, vượt qua khe n&uacute;i để ho&agrave;n th&agrave;nh những nhiệm vụ &ldquo;kh&oacute; xơi&rdquo; nhất. B&ecirc;n cạnh đ&oacute;, tr&igrave;nh độ PK sẽ được thể hiện r&otilde; r&agrave;ng khi c&aacute;c dũng sĩ nh&agrave;o lộn tr&ecirc;n kh&ocirc;ng để n&eacute; đ&ograve;n của đối thủ.</p>

<p>&nbsp;</p>

<p>Trailer Lục Địa Ho&agrave;n Mỹ 3D.</p>

<p><strong>Lục Địa Ho&agrave;n Mỹ</strong>&nbsp;c&oacute; hệ thống 12 nữ thần như Athena, Aphrodite, Artemis, Hestia&hellip; trong đ&oacute; 6 thần đem lại năng lực chiến đấu mạnh mẽ v&agrave; 6 thần gia tăng ph&ograve;ng thủ v&agrave; kh&aacute;ng đỡ, game cho người chơi lựa chọn nữ thần y&ecirc;u th&iacute;ch của m&igrave;nh m&agrave; c&oacute; thể t&ugrave;y &yacute; x&acirc;y dựng c&aacute;c skill kh&aacute;c nhau, thể hiện đẳng cấp PK trong chiến trường.</p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/3-1445227729496/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.jpg" /></p>

<p>T&iacute;nh năng l&atilde;nh địa chiến l&agrave; 1 t&iacute;nh năng quen thuộc trong c&aacute;c webgame hiện nay nhưng hầu hết t&iacute;nh năng n&agrave;y chỉ hoạt động trong 1 server. Đến với&nbsp;<strong>Lục Địa Ho&agrave;n Mỹ</strong>, người chơi sẽ c&oacute; một trải nghiệm mới mẻ v&agrave; th&uacute; vị hơn khi được gặp gỡ v&agrave; so t&agrave;i với nhiều đối thủ ở c&aacute;c server kh&aacute;c nhau, c&ugrave;ng li&ecirc;n minh để chống lại c&aacute;c thế lực mạnh mẽ hơn.</p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/9-1445227729586/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.jpg" /></p>

<p>Hiện tại, Lục Địa Ho&agrave;n Mỹ 3D đ&atilde; ra mắt teaser c&ugrave;ng fanpage tiếng Việt, nhiều h&igrave;nh ảnh Việt h&oacute;a của tr&ograve; chơi cũng được h&eacute; lộ sớm. Dự kiến tr&ograve; chơi ch&iacute;nh thức ph&aacute;t h&agrave;nh trong th&aacute;ng 10 n&agrave;y.</p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/12-1445227729588/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.jpg" /></p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/14-1445227729591/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.jpg" /></p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/5-1445227729618/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.png" /></p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/8-1445227729585/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.jpg" /></p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/6-1445227729622/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.png" /></p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/4-1445227729609/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.png" /></p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/2-1445227729494/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.jpg" /></p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/11-1445227729587/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.jpg" /></p>

<p style="text-align:center"><img alt="Game online 3D Lục Địa Hoàn Mỹ cập bến Việt Nam" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/13-1445227729589/game-online-3d-luc-dia-hoan-my-cap-ben-viet-nam.jpg" /></p>

<p>Trang chủ:&nbsp;<a href="http://lucdiahoanmy.vn/teaser" target="_blank">http://lucdiahoanmy.vn/teaser</a></p>

<p>Fanpage:&nbsp;<a href="https://www.facebook.com/lucdiahoanmy3d" target="_blank">https://www.facebook.com/lucdiahoanmy3d</a></p>', N'2015-10-19 11:36:15.920', N'a-1445227706844.jpg', N'Tên g?c c?a L?c Ð?a Hoàn M? 3D là Ma Th?n Chi?n K? 3D - Crystal Saga 3D do hãng PalmJoys phát tri?n, v?i d? h?a d?ng chibi cùng n?n t?ng 3D khá tuoi sáng h?p v?i th? hi?u game th? nu?c nhà.')
GO
GO
INSERT INTO [dbo].[News] ([NewsID], [NewsTitle], [NewsDetail], [NewsDate], [NewsImage], [NewsDescription]) VALUES (N'7', N'Islet Online - Tựa game có ''vòng sinh thái'' vô cùng lạ đời', N'<p><strong><a href="http://gamek.vn/islet-online.htm" target="_blank">Islet Online</a></strong>&nbsp;l&agrave; một&nbsp;<a href="http://gamek.vn/game-online.htm" target="_blank">game online</a>&nbsp;thế giới mở mới toanh do một nh&oacute;m ph&aacute;t triển c&oacute; t&ecirc;n Morenori sản xuất với kinh ph&iacute; thấp. Tuy nhi&ecirc;n tr&ograve; chơi thực sự tạo được ấn tượng tốt với game thủ nhờ v&agrave;o c&aacute;c t&iacute;nh năng hết sức mới lạ.</p>

<p>Theo đ&oacute;, Islet Online c&oacute; phong c&aacute;ch đồ hoạ &#39;cục gạch&#39; rất giống với MineCraft v&agrave; tất nhi&ecirc;n l&agrave; c&aacute;ch chơi cũng rất giống, bạn cũng sẽ phải đ&agrave;o đ&agrave;o đ&agrave;o để t&igrave;m kho&aacute;ng sản, x&acirc;y nh&agrave; cửa theo &yacute; m&igrave;nh. Tr&ograve; chơi cũng cho ph&eacute;p ch&uacute;ng ta chơi với bạn b&egrave; hoặc chơi một m&igrave;nh.</p>

<p style="text-align:center;"><img alt="Islet Online - Tựa game có ''vòng sinh thái'' vô cùng lạ đời" src="http://genknews.vcmedia.vn/k:2015/2-1445228580221/islet-online-tua-game-co-vong-sinh-thai-vo-cung-la-doi.jpg" /></p>

<p>Kh&ocirc;ng chỉ c&oacute; việc x&acirc;y nh&agrave; cửa, c&ocirc;ng tr&igrave;nh, game thủ sẽ phải t&igrave;m c&aacute;ch chế tạo đồ đạc, vũ kh&iacute; để sử dụng, đồng thời lu&ocirc;n lu&ocirc;n cảnh gi&aacute;c trước sự tấn c&ocirc;ng của kẻ kh&aacute;c, tức l&agrave; tham gia v&agrave;o c&aacute;c trận PvP kh&ocirc;ng dứt nếu như bị địch thủ ph&aacute;t hiện.</p>

<p>&nbsp;</p>

<p>Islet Online GamePlay PvP.</p>

<p>Sẽ l&agrave; thiếu s&oacute;t lớn nếu bỏ qua t&iacute;nh năng &#39;v&ograve;ng sinh th&aacute;i&#39; đặc biệt của Islet Online. Cụ thể, tr&ograve; chơi tồn tại một hệ sinh th&aacute;i như ngo&agrave;i đời, v&iacute; dụ như lo&agrave;i s&oacute;i cần phải ăn thịt thỏ để sống, nếu như bạn bắt hết thỏ th&igrave; s&oacute;i cũng sẽ dần dần chết dần v&igrave; thiếu thức ăn trầm trọng... Điều n&agrave;y c&oacute; nghĩa rằng game thủ c&oacute; thể tạo ảnh hưởng lớn cho cả m&ocirc;i trường xung quanh lẫn c&aacute;c lo&agrave;i động thực vật qua h&agrave;nh động của m&igrave;nh.</p>

<p style="text-align:center;"><img alt="Islet Online - Tựa game có ''vòng sinh thái'' vô cùng lạ đời" src="http://genknews.vcmedia.vn/k:2015/3-1445228588437/islet-online-tua-game-co-vong-sinh-thai-vo-cung-la-doi.jpg" /></p>

<p>Ngo&agrave;i ra Islet Online cũng c&oacute; c&aacute;c NPC rất th&uacute; vị, họ sẽ tự sống cuộc đời của m&igrave;nh, l&agrave;m việc chăm chỉ, cưới vợ đẻ con, thậm ch&iacute; l&agrave; qua đời khi tuổi gi&agrave;.</p>

<p>Dự kiến game sẽ ra mắt v&agrave;o qu&yacute; I năm 2016 tới, những người quan t&acirc;m c&oacute; thể tham khảo th&ecirc;m tại trang steam:<a href="http://steamcommunity.com/sharedfiles/filedetails/?id=532060402" target="_blank">http://steamcommunity.com/sharedfiles/filedetails/?id=532060402</a>.</p>

<p style="text-align:center;"><img alt="Islet Online - Tựa game có ''vòng sinh thái'' vô cùng lạ đời" src="http://genknews.vcmedia.vn/k:2015/20151016055807a0e87f32ir2s6whr-1445228608148/islet-online-tua-game-co-vong-sinh-thai-vo-cung-la-doi.jpg" /></p>', N'2015-10-19 11:39:31.200', N'20151016055807a0e87f32ir2s6whr-1445228608148-crop-1445228649694.jpg', N'Islet Online là m?t game online th? gi?i m? m?i toanh do m?t nhóm phát tri?n có tên Morenori s?n xu?t v?i kinh phí th?p.')
GO
GO
INSERT INTO [dbo].[News] ([NewsID], [NewsTitle], [NewsDetail], [NewsDate], [NewsImage], [NewsDescription]) VALUES (N'8', N'ADrift: Trải nghiệm cảm giác tuyệt vọng trong vũ trụ', N'<p><a href="http://gamek.vn/adrift.htm" target="_blank">Adrift</a>&nbsp;l&agrave; một tựa game g&oacute;c nh&igrave;n người thứ nhất được h&atilde;ng ph&aacute;t triển Three One Zero m&ocirc; tả bằng t&ecirc;n gọi &quot;FPX&quot; - viết tắt của First Person Experience, tức trải nghiệm g&oacute;c nh&igrave;n người thứ nhất thay v&igrave; bắn s&uacute;ng như ch&uacute;ng ta thường gọi. L&yacute; do cũng rất đơn giản: Trong tựa&nbsp;<a href="http://gamek.vn/">game</a>&nbsp;n&agrave;y bạn sẽ kh&ocirc;ng phải bắn giết bất cứ mục ti&ecirc;u n&agrave;o m&agrave; chỉ di chuyển, quan s&aacute;t v&agrave; t&igrave;m hiểu cốt truyện m&agrave; th&ocirc;i.</p>

<p>Bạn v&agrave;o vai một phi h&agrave;nh gia duy nhất c&ograve;n sống s&oacute;t thuộc trạm vũ trụ hiện đại Vocalist, nơi v&igrave; một nguy&ecirc;n nh&acirc;n n&agrave;o đ&oacute; đ&atilde; gặp phải tai nạn kinh ho&agrave;ng dẫn đến nhiều khu vực bị g&atilde;y rời, những mảnh vụn v&agrave; đồ đạc tr&ocirc;i nổi khắp nơi trong kh&ocirc;ng gian. Bạn c&ugrave;ng lượng oxy dữ trữ c&oacute; hạn trong bộ quần &aacute;o đặc dụng phải di chuyển từ nơi n&agrave;y sang nơi kh&aacute;c, t&igrave;m kiếm c&aacute;c đoạn đối thoại m&agrave; phi h&agrave;nh đo&agrave;n để lại rải r&aacute;c khắp nơi tr&ecirc;n Vocalist nhằm t&igrave;m hiểu điều g&igrave; đ&atilde; xảy đến với họ.</p>

<p style="text-align:center"><img alt="ADrift: Trải nghiệm cảm giác tuyệt vọng trong vũ trụ" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/ad-03-1445187859455/adrift-trai-nghiem-cam-giac-tuyet-vong-trong-vu-tru.jpg" /></p>

<p>Kẻ th&ugrave; duy nhất của người chơi trong Adrift l&agrave; thời gian c&ugrave;ng lượng oxy &iacute;t ỏi chỉ đủ cung cấp cho nh&acirc;n vật ch&iacute;nh trong khoảng v&agrave;i ph&uacute;t. Dọc đường đi, bạn cần phải để mắt tới những b&igrave;nh oxy tr&ocirc;i nổi trong mớ đồ vật hỗn độn, hoặc ghi nhớ c&aacute;c điểm &quot;sạc&quot; dưỡng kh&iacute; b&ecirc;n trong trạm vũ trụ để t&iacute;nh to&aacute;n đường đi cho hợp l&yacute;, bằng kh&ocirc;ng phi h&agrave;nh gia sẽ bị ngạt thở giữa chừng. Đơn độc giữa vũ trụ bao la, phần lớn thời gian &acirc;m thanh duy nhất m&agrave; game thủ nghe được chỉ l&agrave; tiếng thở nặng nhọc ph&aacute;t ra từ ch&iacute;nh cơ thể m&igrave;nh đang điều khiển, điều n&agrave;y phần n&agrave;o khiến cho Adrift d&ugrave; kh&ocirc;ng sở hữu cảnh bắn giết n&agrave;o cũng tỏ ra căng thẳng theo một phong c&aacute;ch ri&ecirc;ng biệt.</p>

<p style="text-align:center"><img alt="ADrift: Trải nghiệm cảm giác tuyệt vọng trong vũ trụ" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/ad-05-1445188005646/adrift-trai-nghiem-cam-giac-tuyet-vong-trong-vu-tru.jpg" /></p>

<p>L&agrave; một tựa game nặng về kh&aacute;m ph&aacute;, kh&iacute;a cạnh đồ họa của Adrift được nh&agrave; ph&aacute;t triển chăm ch&uacute;t rất cẩn thận. Game sử dụng hai t&ocirc;ng m&agrave;u chủ đạo l&agrave; trắng v&agrave; xanh l&aacute; c&acirc;y, vừa tạo ra cảm gi&aacute;c sạch sẽ v&agrave; hiện đại ở một trạm nghi&ecirc;n cứu tr&ecirc;n vũ trụ, vừa thể hiện vẻ &ecirc;m dịu của tự nhi&ecirc;n với m&agrave;u xanh đến từ nhiều loại thực vật được trồng nh&acirc;n tạo tr&ecirc;n Vocalist. Nếu như kh&ocirc;ng phải v&igrave; lượng oxy c&oacute; hạn, chắc chắn bất cứ game thủ n&agrave;o cũng muốn ngừng lại một ch&uacute;t ở những trường đoạn lơ lửng ngo&agrave;i kh&ocirc;ng gian để ngắm nh&igrave;n h&agrave;nh tinh mẹ Tr&aacute;i Đất hiện l&ecirc;n với một vẻ g&igrave; đ&oacute; vừa h&ugrave;ng vĩ vừa th&acirc;n thương.</p>

<p style="text-align:center"><img alt="ADrift: Trải nghiệm cảm giác tuyệt vọng trong vũ trụ" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/ad-05-1445187945484/adrift-trai-nghiem-cam-giac-tuyet-vong-trong-vu-tru.jpg" /></p>

<p>Với trải nghiệm đặc biệt của m&igrave;nh, h&atilde;ng Three One Zero k&igrave; vọng Adrift sẽ đặt nền m&oacute;ng ph&aacute;t triển cho một thể loại game g&oacute;c nh&igrave;n người thứ nhất ho&agrave;n to&agrave;n mới hướng đến kh&aacute;m ph&aacute; thay v&igrave; phong c&aacute;ch chạy v&agrave; bắn đ&atilde; tr&agrave;n ngập thị trường hiện nay. Một điểm th&uacute; vị về Adrift đ&oacute; l&agrave; &yacute; tưởng của tr&ograve; chơi được s&aacute;ng tạo bởi Adam Orth - cựu nh&acirc;n vi&ecirc;n Microsoft từng khiến cộng đồng game thủ thế giới phẫn nộ v&agrave;o năm 2013 v&igrave; những ph&aacute;t biểu trịch thượng về vấn đề Xbox One y&ecirc;u cầu kết nối internet 24/24 để hoạt động.</p>

<p style="text-align:center"><img alt="ADrift: Trải nghiệm cảm giác tuyệt vọng trong vũ trụ" src="http://genknews.vcmedia.vn/k:thumb_w/640/2015/ad-01-1445187859452/adrift-trai-nghiem-cam-giac-tuyet-vong-trong-vu-tru.jpg" /></p>

<p>Cảm gi&aacute;c đơn độc khi bị cả thế giới chống lại đ&atilde; truyền cảm hứng cho Orth về một tựa game trong đ&oacute; nh&acirc;n vật ho&agrave;n to&agrave;n kh&ocirc;ng hề c&oacute; sự trợ gi&uacute;p v&agrave; buộc phải tự m&igrave;nh xoay sở trong vụ trũ lạnh lẽo. Bị buộc th&ocirc;i việc ở Microsoft, Adam Orth t&igrave;m đến những người bạn cũ l&agrave;m việc trong ng&agrave;nh game v&agrave; Adrift từ đ&oacute; ra đời. Trong c&aacute;i rủi cũng c&oacute; c&aacute;i may đấy chứ?</p>

<p>Adrift dự t&iacute;nh sẽ ph&aacute;t h&agrave;nh v&agrave;o qu&yacute; I năm 2016 d&agrave;nh cho c&aacute;c hệ m&aacute;y PS4, Xbox One v&agrave; PC. Game được ph&aacute;t triển để hỗ trợ đầy đủ c&aacute;c loại k&iacute;nh thực tế ảo hiện đại nhằm mang đến trải nghiệm kh&aacute;m ph&aacute; vũ trụ l&yacute; th&uacute; nhất cho game thủ.</p>', N'2015-10-19 11:42:57.387', N'ad-05-1445188005646-crop-1445188015913.jpg', N'Ðó cung chính là ngu?n c?m h?ng ngoài d?i th?c thôi thúc tác gi? c?a game - Adam Orth sáng t?o nên Adrift.')
GO
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO

-- ----------------------------
-- Table structure for sysdiagrams
-- ----------------------------
DROP TABLE [dbo].[sysdiagrams]
GO
CREATE TABLE [dbo].[sysdiagrams] (
[name] sysname NOT NULL ,
[principal_id] int NOT NULL ,
[diagram_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[definition] varbinary(MAX) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[sysdiagrams]', RESEED, 1001)
GO

-- ----------------------------
-- Records of sysdiagrams
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sysdiagrams] ON
GO
INSERT INTO [dbo].[sysdiagrams] ([name], [principal_id], [diagram_id], [version], [definition]) VALUES (N'Diagram_0', N'1', N'2', N'1', 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000000200000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF11000000FEFFFFFF04000000050000001B0000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F00000010000000FEFFFFFFFEFFFFFF130000001400000015000000160000001700000018000000190000001A000000FEFFFFFF1C000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF0200000000000000000000000000000000000000000000000000000000000000F0979CE44B00D1010300000000090000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000000000000BE040000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000006000000F814000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000130000005F000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F000000100000001100000012000000FEFFFFFF14000000FEFFFFFFFEFFFFFF1700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000430000A1E100C050000800F0000000F00FFFF0F000000007D000008660000CB440000918600002A5F000024FAFFFF371D0000DE805B10F195D011B0A000AA00BDCB5C0000080030000000000200000300000038002B00000009000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002C0043200000000000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002C0043200000000000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C0F000000C8030000008F010000003000A509000007000080010000009C02000000800000050000805363684772696400F84300009222000041646D696E69640000003000A50900000700008002000000A20200000080000008000080536368477269640000000000844E000043617465676F727900003000A50900000700008003000000A002000000800000070000805363684772696479EA240000A0410000436F6D6D656E747900003000A50900000700008004000000A2020000008000000800008053636847726964000000000092220000466565646261636B00002C00A509000007000080050000009A02000000800000040000805363684772696400000000006432000047616D6500006800A5090000070000800600000052000000018000003D000080436F6E74726F6C6BE30B0000C342000052656C6174696F6E73686970202750726F647563745F43617465676F727927206265747765656E202743617465676F72792720616E64202747616D652700000000002800B50100000700008007000000310000005300000002800000436F6E74726F6C00290E00005849000000006400A5090000070000800800000062000000018000003B000080436F6E74726F6C005D1A00002D3A000052656C6174696F6E736869702027436F6D6D656E745F50726F6475637427206265747765656E202747616D652720616E642027436F6D6D656E74276500002800B50100000700008009000000310000005100000002800000436F6E74726F6C00082400003F3E000000003000A5090000070000800A0000009E02000000800000060000805363684772696479EA240000922200004D656D626572647900006800A5090000070000800B00000052000000018000003E000080436F6E74726F6C00CD3000004535000052656C6174696F6E736869702027436F6D6D656E745F437573746F6D657227206265747765656E20274D656D6265722720616E642027436F6D6D656E7427000000002800B5010000070000800C000000310000005300000002800000436F6E74726F6C002A270000243C000000002C00A5090000070000800D0000009A02000000800000040000805363684772696400F84300000C3000004E65777300006C00A5090000070000800E000000520000000180000041000080436F6E74726F6C005D1A00002F29000052656C6174696F6E736869702027464B5F466565646261636B5F4D656D62657227206265747765656E20274D656D6265722720616E642027466565646261636B2700000000002800B5010000070000800F000000310000005700000002800000436F6E74726F6C6B691A0000C428000000000100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F573900000200B0A894E44B00D1010202000010484500000000000000000000000000000000007A0100004400610074006100200053006F0075007200630065003D004B00480041004E0048005400520049004E0048003B0049006E0069007400690061006C00200043006100740061006C002143341208000000891B0000280C0000785634120700000014010000410064006D0069006E000000770073005C004D006900630072006F0073006F00660074002E004E00650074005C0061007300730065006D0062006C0079005C004700410043005F004D00530049004C005C004D006900630072006F0073006F00660074002E00560069007300750061006C00530074007500640069006F002E005300680065006C006C002E0049006D006D0075007400610062006C0065002E00310030002E0030005C00760034002E0030005F00310030002E0030002E0030002E0030005F005F0062003000330066003500660037006600310031006400350030006100330061005C004D006900000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000000234000095150000000000002D010000070000000C000000070000001C010000880B00006C09000020040000340500009C0300003C060000D4070000B0040000D4070000F0090000CC0600000000000001000000891B0000280C000000000000030000000300000002000000020000001C010000740D000000000000010000003A180000F405000000000000010000000100000002000000020000001C010000880B000001000000000000003A180000B903000000000000000000000000000002000000020000001C010000880B000000000000000000002B3F0000FA22000000000000000000000D00000004000000040000001C010000880B0000A40D00005808000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000006000000410064006D0069006E0000002143341208000000891B0000280C0000785634120700000014010000430061007400650067006F0072007900000000008891BB10000000008891BB10E0ECA6080500000000000000030000000000000000000000000100000001000000000000645EBF722C8AC772EC25FC720000000000000000D0547361D05473610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000CC557361CC557361000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000000234000095150000000000002D010000070000000C000000070000001C010000880B00006C09000020040000340500009C0300003C060000D4070000B0040000D4070000F0090000CC0600000000000001000000891B0000280C000000000000030000000300000002000000020000001C010000740D000000000000010000003A180000F405000000000000010000000100000002000000020000001C010000880B000001000000000000003A180000B903000000000000000000000000000002000000020000001C010000880B000000000000000000002B3F0000FA22000000000000000000000D00000004000000040000001C010000880B0000A40D00005808000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000009000000430061007400650067006F007200790000002143341208000000891B00001A13000078563412070000001401000043006F006D006D0065006E00740000000C000000D0DEC21000000000D0DEC21020EEA6080800000000000000060000000000000000000000000100000001000000000000D45CBF72645EBF725C5DBF72486BC872645EBF720C5DBF72286BC872486BC872645EBF720C5DBF720C000000820D0000D70300001604000001000000030000000500000098FEFFFF820D0000200400003B04000001000000030000000500000098FEFFFF820D000020040000F004000000000000000000000600000098FEFFFF820D0000200400000D0500000E000000030000000500000094FEFFFF820D0000200400001E0500000200000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000002340000D0170000000000002D010000080000000C000000070000001C010000880B00006C09000020040000340500009C0300003C060000D4070000B0040000D4070000F0090000CC0600000000000001000000891B00001A13000000000000060000000600000002000000020000001C010000740D000000000000010000003A1800006B0A000000000000030000000300000002000000020000001C010000880B000001000000000000003A180000B903000000000000000000000000000002000000020000001C010000880B000000000000000000002B3F0000FA22000000000000000000000D00000004000000040000001C010000880B0000A40D00005808000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000800000043006F006D006D0065006E00740000002143341208000000891B0000780E000078563412070000001401000046006500650064006200610063006B0000000000D0DEC21000000000D0DEC210503FBA100A000000000000000C0000000000000000000000000100000001000000000000D45CBF72645EBF725C5DBF72486BC87254BEF402E0DFC772386BC872486BC87248A6C87254A6C872645EBF720C5DBF72D70300001604000001000000030000000500000098FEFFFF820D0000200400003B04000001000000030000000500000098FEFFFF820D000020040000F004000000000000000000000600000098FEFFFF820D0000200400000D0500000E000000030000000500000094FEFFFF820D0000200400001E0500000200000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000000234000095150000000000002D010000070000000C000000070000001C010000880B00006C09000020040000340500009C0300003C060000D4070000B0040000D4070000F0090000CC0600000000000001000000891B0000780E000000000000040000000400000002000000020000001C010000740D000000000000010000003A180000F405000000000000010000000100000002000000020000001C010000880B000001000000000000003A180000B903000000000000000000000000000002000000020000001C010000880B000000000000000000002B3F0000FA22000000000000000000000D00000004000000040000001C010000880B0000A40D00005808000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000046006500650064006200610063006B0000002143341208000000891B00001A130000785634120700000014010000470061006D0065000000A60820EEA6080600000030DEC2100000000030DEC210D083BA10090000000000000006000000000000000000000000010000000100000000000090E7F402E0DFC772386BC872645EBF722C8AC772EC25FC72F80300000200000003000000050000000C000000820D0000D70300001604000001000000030000000500000098FEFFFF820D0000200400003B04000001000000030000000500000098FEFFFF820D000020040000F004000000000000000000000600000098FEFFFF820D0000200400000D0500000E000000030000000500000094FEFFFF820D0000200400001E0500000200000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000002340000D0170000000000002D010000080000000C000000070000001C010000880B00006C09000020040000340500009C0300003C060000D4070000B0040000D4070000F0090000CC0600000000000001000000891B00001A13000000000000060000000600000002000000020000001C010000740D000000000000010000003A1800003008000000000000020000000200000002000000020000001C010000880B000001000000000000003A180000B903000000000000000000000000000002000000020000001C010000880B000000000000000000002B3F0000FA22000000000000000000000D00000004000000040000001C010000880B0000A40D00005808000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000005000000470061006D006500000002000B007A0D0000844E00007A0D00007E4500000000000002000000F0F0F00000000000000000000000000000000000010000000700000000000000290E0000584900001A09000053010000320000000100000200001A090000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D611000500072006F0064007500630074005F00430061007400650067006F007200790004000B00891B0000C43B000059230000C43B000059230000004B0000EA240000004B00000000000002000000F0F0F00000000000000000000000000000000000010000000900000000000000082400003F3E00007709000053010000320000000100000200007709000053010000020000000000FFFFFF0008000080010000001500010000009001B0300100065461686F6D610F0043006F006D006D0065006E0074005F00500072006F0064007500630074002143341208000000891B00006A1500007856341207000000140100004D0065006D0062006500720000003A005C00500072006F006700720061006D002000460069006C00650073002000280078003800360029005C004D006900630072006F0073006F00660074002000530051004C0020005300650072007600650072005C003100310030005C0054006F006F006C0073005C00420069006E006E005C004D0061006E006100670065006D0065006E007400530074007500640069006F005C0054006F006F006C0073005C005600440054005C004400610074006100440065007300690067006E006500720073002E0064006C006C005C0032000000820D0000200400001E0500000200000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000023400000C1A0000000000002D010000090000000C000000070000001C010000880B00006C09000020040000340500009C0300003C060000D4070000B0040000D4070000F0090000CC0600000000000001000000891B00006A15000000000000070000000700000002000000020000001C010000740D000000000000010000003A180000F405000000000000010000000100000002000000020000001C010000880B000001000000000000003A180000B903000000000000000000000000000002000000020000001C010000880B000000000000000000002B3F0000FA22000000000000000000000D00000004000000040000001C010000880B0000A40D00005808000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000070000004D0065006D00620065007200000002000B0064320000FC37000064320000A04100000000000002000000F0F0F00000000000000000000000000000000000010000000C000000000000002A270000243C00008B0A000053010000320000000100000200008B0A000053010000020000000000FFFFFF0008000080010000001500010000009001B0300100065461686F6D61100043006F006D006D0065006E0074005F0043007500730074006F006D00650072002143341208000000891B00001A1300007856341207000000140100004E006500770073000000A608A0EDA6080600000030DEC2100000000030DEC210D083BA100900000000000000060000000000000000000000000100000001000000000000F8E9F402E0DFC772386BC872645EBF722C8AC772EC25FC72F80300000200000003000000050000000C000000820D0000D70300001604000001000000030000000500000098FEFFFF820D0000200400003B04000001000000030000000500000098FEFFFF820D000020040000F004000000000000000000000600000098FEFFFF820D0000200400000D0500000E000000030000000500000094FEFFFF820D0000200400001E0500000200000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000002340000D0170000000000002D010000080000000C000000070000001C010000880B00006C09000020040000340500009C0300003C060000D4070000B0040000D4070000F0090000CC0600000000000001000000891B00001A13000000000000060000000600000002000000020000001C010000740D000000000000010000003A180000F405000000000000010000000100000002000000020000001C010000880B000001000000000000003A180000B903000000000000000000000000000002000000020000001C010000880B000000000000000000002B3F0000FA22000000000000000000000D00000004000000040000001C010000880B0000A40D00005808000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000050000004E00650077007300000002000B00EA240000C62A0000891B0000C62A00000000000002000000F0F0F00000000000000000000000000000000000010000000F00000000000000691A0000C4280000A00B00005301000032000000010000020000A00B000053010000020000000000FFFFFF0008000080010000001500010000009001B0300100065461686F6D61120046004B005F0046006500650064006200610063006B005F004D0065006D006200650072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000012000000101100000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000150000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000016000000240300000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000002300000012000000000000000C00000024FAFFFF371D00000100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003900350032002C0031002C0032003400310032002C0035002C0031003500390036000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0033003400340034000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003900350032002C00310032002C0033003400390032002C00310031002C0032003100330036000000020000000200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003900350032002C0031002C0032003400310032002C0035002C0031003500390036000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0033003400340034000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003900350032002C00310032002C0033003400390032002C00310031002C0032003100330036000000030000000300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003900350032002C0031002C0032003400310032002C0035002C0031003500390036000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0033003400340034000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003900350032002C00310032002C0033003400390032002C00310031002C0032003100330036000000040000000400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003900350032002C0031002C0032003400310032002C0035002C0031003500390036000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0033003400340034000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003900350032002C00310032002C0033003400390032002C00310031002C0032003100330036000000050000000500000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003900350032002C0031002C0032003400310032002C0035002C0031003500390036000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0033003400340034000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003900350032002C00310032002C0033003400390032002C00310031002C0032003100330036000000060000000600000000000000320000000100000001000000640062006F000000500072006F0064007500630074005F00430061007400650067006F007200790000000000000000000000C40200000000070000000700000006000000080000000199BB10C899BB100000000000000000AD0F0000010000080000000800000000000000300000000100000001000000640062006F00000043006F006D006D0065006E0074005F00500072006F00640075006300740000000000000000000000C40200000000090000000900000008000000080000000199BB108899BB100000000000000000AD0F00000100000A0000000A00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003900350032002C0031002C0032003400310032002C0035002C0031003500390036000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0033003400340034000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003900350032002C00310032002C0033003400390032002C00310031002C00320031003300360000000B0000000B00000000000000320000000100000001000000640062006F00000043006F006D006D0065006E0074005F0043007500730074006F006D006500720000000000000000000000C402000000000C0000000C0000000B00000008000000019CBB10489CBB100000000000000000AD0F00000100000D0000000D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003900350032002C0031002C0032003400310032002C0035002C0031003500390036000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0033003400340034000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900350032000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003900350032002C00310032002C0033003400390032002C00310031002C00320031003300360000000E0000000E0000000000000036000000019BD11001000000640062006F00000046004B005F0046006500650064006200610063006B005F004D0065006D0062006500720000000000000000000000C402000000000F0000000F0000000E00000008000000019CD110E09CD1100000000000000000AD0F0000010000140000000600000002000000050000002C0000002D0000000800000005000000030000007B0000007A0000000E0000000A0000000400000076000000770000000B0000000A000000030000002D0000002C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006F0067003D005400650061006D0035003B005000650072007300690073007400200053006500630075007200690074007900200049006E0066006F003D0054007200750065003B0055007300650072002000490044003D00730061003B004D0075006C007400690070006C00650041006300740069007600650052006500730075006C00740053006500740073003D00460061006C00730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F002200000000800500140000004400690061006700720061006D005F0030000000000226000C000000410064006D0069006E00000008000000640062006F0000000002260012000000430061007400650067006F0072007900000008000000640062006F000000000226001000000043006F006D006D0065006E007400000008000000640062006F000000000226001200000046006500650064006200610063006B00000008000000640062006F000000000226000A000000470061006D006500000008000000640062006F000000000226000E0000004D0065006D00620065007200000008000000640062006F000000000224000A0000004E00650077007300000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00310036003300340043004400440037002D0030003800380038002D0034003200450033002D0039004600410032002D004200360044003300320035003600330042003900310044007D00000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)
GO
GO
SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
GO

-- ----------------------------
-- Indexes structure for table Admin
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Admin
-- ----------------------------
ALTER TABLE [dbo].[Admin] ADD PRIMARY KEY ([AdminID])
GO

-- ----------------------------
-- Indexes structure for table Category
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Category
-- ----------------------------
ALTER TABLE [dbo].[Category] ADD PRIMARY KEY ([CategoryID])
GO

-- ----------------------------
-- Indexes structure for table Comment
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Comment
-- ----------------------------
ALTER TABLE [dbo].[Comment] ADD PRIMARY KEY ([CommentID])
GO

-- ----------------------------
-- Indexes structure for table Feedback
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Feedback
-- ----------------------------
ALTER TABLE [dbo].[Feedback] ADD PRIMARY KEY ([FeedbackID])
GO

-- ----------------------------
-- Indexes structure for table Game
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Game
-- ----------------------------
ALTER TABLE [dbo].[Game] ADD PRIMARY KEY ([GameID])
GO

-- ----------------------------
-- Indexes structure for table Member
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Member
-- ----------------------------
ALTER TABLE [dbo].[Member] ADD PRIMARY KEY ([MemberID])
GO

-- ----------------------------
-- Indexes structure for table News
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table News
-- ----------------------------
ALTER TABLE [dbo].[News] ADD PRIMARY KEY ([NewsID])
GO

-- ----------------------------
-- Indexes structure for table sysdiagrams
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sysdiagrams
-- ----------------------------
ALTER TABLE [dbo].[sysdiagrams] ADD PRIMARY KEY ([diagram_id])
GO

-- ----------------------------
-- Uniques structure for table sysdiagrams
-- ----------------------------
ALTER TABLE [dbo].[sysdiagrams] ADD UNIQUE ([principal_id] ASC, [name] ASC)
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Comment]
-- ----------------------------
ALTER TABLE [dbo].[Comment] ADD FOREIGN KEY ([MemberID]) REFERENCES [dbo].[Member] ([MemberID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[Comment] ADD FOREIGN KEY ([GameID]) REFERENCES [dbo].[Game] ([GameID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Feedback]
-- ----------------------------
ALTER TABLE [dbo].[Feedback] ADD FOREIGN KEY ([MemberID]) REFERENCES [dbo].[Member] ([MemberID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Game]
-- ----------------------------
ALTER TABLE [dbo].[Game] ADD FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Category] ([CategoryID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
