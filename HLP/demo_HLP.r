#! /usr/bin/Rscript --vanilla --slave
# Project  : demo_HLP
# File     : demo_HLP/demo_HLP.r
# Author   : Alex Zolotoviski, azolotovitski@medio.com
# Created  : 2014-04-25 12:10:35
# License  : GPL-2
# from D:\z\work\71_UseR-2013-Tutorial\UseR-2013-Tutorial-2\work\UseR-2013\97_tutorial-demo\97_tutorial-demo.r
###############################################################################

if(init<- 1) { #== init ===
	rm(list=ls(envir = .GlobalEnv), envir = .GlobalEnv)
	
	options(help='html', digits=4, width=3999, scipen=5, repos = c(CRAN= "http://cran.rstudio.com")
			, error= NULL) # options(error= recover) options(error=dump)  #or options(error=NULL) getOption('width')

	onWin= Sys.getenv('R_PLATFORM')==''
	if(onWin){root= 'm:/50_HLP/out'; 	memory.limit(size=9000)}  else root= '/home/azolotovitski/work'   # memory.limit()
	
	library(HaLaP)
	library(RWorkJournal)
	if(fromSrc <- 0) source('m:/50_HLP/out/packages/HaLaP/inst/HLP.r') # T:/work/UseR-2013/lib/zBase0.r
	if(fromSrc <- 0) source('m:/50_HLP/out/packages/RWorkJournal/inst/RWorkJournal.r') # T:/work/UseR-2013/lib/zCode.r

#	source('T:/work/UseR-2013/lib/zBase1.r')  
#	source('T:/work/UseR-2013/lib/zCode.r')  
#	source('T:/work/UseR-2013/lib/zStats.r')  
	source('m:/50_HLP/out/demo_HLP/demo_HLP.fun.r')  
	
	#install.packages('plyr')
	libra(plyr) 
	libra(ggplot2) 

	libra(data.table); dtt= data.table; ad= as.IDate; taa= tables	# vignette("datatable-faq")
	
	
	libra(RColorBrewer)  # display.brewer.all()
	palette(c(adjustcolor(cn('grey50 green3 red2'), alpha.f = .6), brewer.pal(8,"Dark2")))  ##ex: plot(1:19, pch=16, col=1:19, cex=3)
	

	proot= fp(root, 'demo_HLP')  # project root
	sw(fp(proot, 'out'))
	
	#libra(Cairo);  
		
	theFile= fp(proot, 'demo_HLP.r')
	options(theFile= theFile)
	# [1] "m:/50_HLP/out/demo_HLP/demo_HLP.r"

	
	HHp.bak= HHp #; HHp=dummy; # HHp= HHp.bak   # to rerun w/o change images
	sa.bak= sa   #; sa=dummy ; # sa= sa.bak   # to rerun w/o change images

	
	# catf('\ndetach("%s",  character.only = TRUE)', grep('^pac', search(), v=T))
	# gff('saved', theFile)
	# rmDF(); loo(); lo(); lsDF();
} #--
##########################################################

##   demo_HLP  

	
	if(0){ #### from init old 
		
		if(fromSrc <- 1){
			#source(file.path(root, 'lib/zBase0.r'))  
			source('T:/work/UseR-2013/lib/zBase0.r')  # xxx: hard coded path to zBase.r
			source('T:/work/UseR-2013/lib/zCode.r')  
			#source('T:/work/UseR-2013/lib/zBase1.r')  
			#source('T:/work/UseR-2013/lib/zStats.r')  
		} else {
			library(zBase0)
			libra(zCode)
			'%+%' = function(x, y) paste(x, y, sep= "")
		}
		
	
		if(toSavePicsAndOutFiles <- 1){
			sg= sg.bak      
			sgj= sgj.bak    
			sa= sa.bak      
		}
	} #--
	##########################################################
	
	
	
	if(0){
		#'  ===  Key points and helpers  ===
		
		#'  == Create Project       #  Wrapper for     
		CreateProject()      #  Create new Project
		libra()              #  install.packages + library()
		theFile              #  global variable - current R code
		
		#'  == Remind objects:         
		DT()                 #  strftime(Sys.time()) - current Date and Time
		st({})               #  system.time + play sound - for long executed blocks
		hee()                #  nrow + head
		sg()                 #  dev.print  -  save graphics to .png file
		srm()                #  save & remove
		# ^RV                #  copy output from console to the code
		
		#'  == Save state:             
		sa()                 #  save.image
		Code2HTML()          #  R code theFile to html R Work Journal
		MakeRWJournals()     #     - the same for many R files to create
		createRWJalbum()     #  	 albums of galleries	
		ReleaseOut()         #  move all output to a DateTime-version folder before new data
		#'       ///                #  exit location -  mark place in the file 
		
		#'  == Restore  state:
		rmall()              #  rm all
		rmDF()               #  rm datafames and lists
		init                 #  initialise environment
		loo(); gff('saved:') #  find saved data
		lo()                 #  load saved data
		lsDF()               #  ls  data frames
		
		#'     Convenience, aliases #  Wrapper for    
		tocsv()              #  write.csv 
		totsv()              #  write.table
		suss()               #  subset + grep
		gre2()               #  grep
		df()			     #  data.frame
		aaa()                # cat('\a') - to play sound in the end of long run.
		
		#'  == Code in top and bottom of the R file.  - "cache", "parking lot"
	}
	
	
'   
####  rwj() = Code2HTML() Features: 
  1. Transforms .R file into  self-documented  .html file, containing all R code with output pics, headers and table of contents.
  2. The titles in body and contents are clickable to navigate from contents to body and back.
  3. The pics are clickable to resize.
  4. The html file has partly R syntax highlighted.  It is possible to do the full R syntax highlighting in resulting html, but the result file becomes almost twice heavier.
  5. Parts of the result html file could be folded.
  6. If you in browser fold TOC, select all, copy and paste to a text editor,  you should get the pure original R file.
  7. If you in browser select all, copy and paste to a MS Word, pics are resizable.
	
	
####  [Eclipse](http://download.eclipse.org/eclipse/downloads) + StatET vs RStudio
Pro:
 -	Full screen view on click
 -	Multi-win, monitors
 -	Copy from console to edit Ctrl+R,V
 -  Rectangular selection Alt-Shift+A
 -	Powerful Find and Search  Ctrl+H
 -	Also py, java, html, pig, hive, svn, git, shell, ... editors - hundreds plugins (menu Help-Marketplace...)

Con:
 - [installation and configuration](http://www.splusbook.com/RIntro/R_Eclipse_StatET.pdf) takes about 20 min.

   To get barebone Eclipse, go to [the link](http://download.eclipse.org/eclipse/downloads) an then download the latest "Platform Runtime Binery"
'
	
	
	
	{ ###  Block Header 2  === 2013-07-03 12:18:09
		
		
		{ ####    Block Header 3  ==  DT()  2013-06-24 13:46
			st({  ##### looong calculation
						for(i in 1e2 ){   # 1:5e4
							x= 1:1000 / 100
							y= x^2 + rnorm(le(x),, 9)
						}
			}) #   5.05
			
			# to data.table:
			xy= dtt(x, y)
			
			hee(xy)
			# 1000  rows
			#      x       y
			# 1 0.01  11.169
			# 2 0.02   6.532
			# 3 0.03  13.510
			# 4 0.04   2.896
			# 5 0.05  -9.863
			# 6 0.06 -15.041
			# 7 0.07   6.389
			# 8 0.08  17.035
			# 9 0.09  19.776
			# # he(suss(,, df(x, y), , sel= cn("x y")), 5)
		'
		save result of long calculations, print reminder to load:'
		saa(xy)
		# 2014-07-06 00:48:51::  xy  saved: lo('m:/50_HLP/out/demo_HLP/out/xy.RData'); sw('m:/50_HLP/out/demo_HLP/out')


			
			'
			#### standard plot:'
			
			ww()  # open plot window
			plot(x, y, ma= expression(Noisy ~ x^2  ~', ' ~ sigma ~ '= 9'))
			lines(lowess(y ~ x), lty=3, lwd=4, col=3)
			# save graph and print reminder - caption:
			sg('Noisy x^2')
			# Fig_1. Noisy x^2
			
			
			# xFig_3. Noisy x^2   # redundant fig -  mark with break pattern '# Fig_'
			
			#####  "roxigen" type comments and TODO,  Header 4  =
			#' Some commenting text after "roxigen" type comments
			#' can be here
			#' xxx: We need To Do something - include funcs from zBase.r; wrong borders of block 3
			#' TODO: something else - demo for hee(), sa(), lo(), lsDF()
		} #--
		
		
		plot2= function(){ ####    Block Header 3 - 2 - inside function definition  ================
			group <<- sample(cn('A B'), le(x), re=T)
			y2 <<- - x^2 + 20 * (group == 'B') + rnorm(le(x),, 5)
			y3 <<- x^2 * cos(x) + 10 * (group == 'B') + rnorm(le(x),, 5)
			
			ww()
			#plot(x, y2, ma='Noisy -x^2', col= 1+ nuf(group), pch=20)
			plot(x, y3, ma='Noisy x^2 * cos(x)', col= 1+ nuf(group), pch=20)
			lines(lowess(y2 ~ x), lty=2, lwd=4, col=6)
			lines(lowess(y3 ~ x), lty=2, lwd=4, col=7)
		} #--
		plot2()
		
		sg('Noisy  $ -x^2 $ ',, F)
		# Fig_2. Noisy  $ -x^2 $ 
		
		
		{ ####  ggplot,   Block Header 3 ==
			ww()
			str(x)
			str(y2)
			str(group)
			qplot(x, y2, col= fa(group), main='Noisy -x^2', geom=cn('point smooth'))
			#  ggplot(df(x, y2), aes(x = x, y = y2)) +	geom_point()
			sg('ggplot: Noisy  $ x^2 $ ', gg=T)
			# Fig_3. qqplot: Noisy  $ - x^2 $ 
			
			# xFig_2. qqplot: Noisy - x^2
		} #--
		
		sa()
		# 2013-07-09 17:21:31:: Image saved: lo('T:/work/UseR-2013/97_tutorial-demo/out/.RData'); sw('T:/work/UseR-2013/97_tutorial-demo/out')  # rmDF(); lsDF(); dir(); expl()
		
		cc()	
		
		#  now we can leave the project ----
		
		
		xyy= df(x, y1= y, y2, group)
		hee(xyy)
		# 1000  rows
		#      x       y1     y2 group
		# 1 0.01 -11.4887 18.773     B
		# 2 0.02   5.1757 14.175     B
		# 3 0.03  16.3396 -1.341     A
		# 4 0.04  -0.5679 15.992     B
		# # he(suss(,, xyy, , sel= cn("x y1 y2 group")), 5)
		
		
		
		hee(suss('y',, xyy, y1 > 5, sel= cn("x y1 y2 group")), 5)
		# 789  rows
		#        y1     y2
		# 2   5.176 14.175
		# 3  16.340 -1.341
		# 5  11.656 18.788
		# 7   9.583  6.824
		# 11  5.882 19.659
		# # he(suss(,, suss("y", , xyy, y1 > 5, sel = cn("x y1 y2 group")), , sel= cn("y1 y2")), 5)
		
		
		ww()
		plot(xyy, col= 1+nu(xyy$group))
		mtext('Pairs',,3)
		sg('Pairs xyy')
		# Fig_4. Pairs xyy
		
		
		sa('.with_xyy')  #  xyy is large and rare used
		# 2013-07-09 17:31:02:: Image saved: lo('T:/work/UseR-2013/97_tutorial-demo/out/.with_xyy.RData'); sw('T:/work/UseR-2013/97_tutorial-demo/out')  # rmDF(); lsDF(); dir(); expl()
		
		
		if (0) { #==  Examples  ==
			
			ca= cars
			co= CO2
			ir= iris
			ba= plyr::baseball
			
			lsDF(0)
			
			#'     Convenience, aliases  #  Wrapper for    
			tocsv(ca)               #  write.csv 
			totsv(co)               #  write.table
			na(ir)                  #  names
			nc(ir)                  #  paste names
			suss('^S', 'W', ir, Sepal.Length >5) #  subset + grep(names())
			hee(srt(suss('^S', 'W', ir, Sepal.Length >5), ~- Sepal.Length))#  head + order + suss
			
			na(ba)                  #  names
			hee(ba)
			# 21699  rows
			#            id year stint team lg  g  ab  r  h X2b X3b hr rbi sb cs bb so ibb hbp sh sf gidp
			# 4   ansonca01 1871     1  RC1    25 120 29 39  11   3  0  16  6  2  2  1  NA  NA NA NA   NA
			# 44  forceda01 1871     1  WS3    32 162 45 45   9   4  0  29  8  0  4  0  NA  NA NA NA   NA
			# 68  mathebo01 1871     1  FW1    19  89 15 24   3   1  0  10  2  1  2  0  NA  NA NA NA   NA
			# # he(suss(,, ba, , sel= cn("id year stint team lg g ab r h X2b X3b hr rbi sb cs bb so ibb hbp sh sf gidp")), 5)
			
			xx= ncc('id|g|b$', 'X', ba)  # paste + gre + colnames 
			# [1] "id lg g ab sb bb ibb gidp"
			
			cn(xx)                       # strsplit 
			# [1] "id"   "lg"   "g"    "ab"   "sb"   "bb"   "ibb"  "gidp"
			
			
			
			hee(srt(suss('id|g|b$', 'X', ba, g >160), ~id))  #  head + order + suss
			# 220  rows
			#              id lg   g  ab sb bb ibb gidp
			# 43076 aaronha01 NL 161 631 31 78  18   11
			# 43826 allendi01 NL 162 632  3 67  13    8
			# 44582 allendi01 NL 161 619 15 74   6   13
			# 68530 alomaro01 AL 161 637 53 57   3    5
			# 48170 alomasa01 AL 162 672 35 49   2    7
			# 49084 alomasa01 AL 162 689 39 41   4    7
			# 47712  alouma01 NL 162 698 22 42   9    5
			# 69623 baergca01 AL 161 657 10 35  10   15
			# 70191 bagweje01 NL 162 586 10 84  13   17
			# # he(suss(,, srt(suss("id|g|b$", "X", ba, g > 160), ~id), , sel= cn("id lg g ab sb bb ibb gidp")), 5)
			
			gre2()                #  grep
			
		}
		
		if(0){ ####  rCharts   ==
'
nice demo: [http://rpubs.com/Abresler/rCharts_Test](http://rpubs.com/Abresler/rCharts_Test)
'
			##### Installation of rCharts ==
			libra(devtools)
			install_github('ramnathv/rCharts')  # nOK
			
			# libra(RJSONIO)
			# libra(yaml)
			#  C:\>z\eclipse\R-2.14.2\bin\x64\R.exe  --vanilla CMD INSTALL C:\Users\azolotovitski\Downloads\rCharts-master\rCharts-master
			
			
			require(rCharts)
			p1 <- hPlot(y2 ~ x,  size="x", group="group", data=xyy, type = "line", dom='zzz', title = "rChart", subtitle = "xyy, by group")  # http://www.polychartjs.com/demo?bubble_chart
			p1$chart(zoomType = "xy")
			p1$show()
			
			# save js-HTML graph and print reminder - caption:
			sgj(, "rCharts xyy, by group")
			# jFig_1. rCharts xyy, by group
	

			libra(googleVis)
			mmap <- gvisMap(df(name='Medio/HERE', lalo='47.611446:-122.332749', alt=15)
					, locationvar="lalo", tipvar ="name", 
					, options=list(dataMode="markers", useMapTypeControl=T, region='us_metro', zoomLevel=9, showTip=T))
			
			# plotting results into html file
			plot(mmap)
			cat(mmap$html$chart, file="../img/jFig_2.htm")
			# sgj(, "gvisMap, Medio") - nOK
			# jFig_2. gvisMap, Medio

			
		}
		
		cc()
		expl("file://T:/work/UseR-2013/97_tutorial-demo/97_tutorial-demo.r.htm")
		
		
		
	} #--
	
	
	
	
	
	if(0){   #== Misc   (cache, parking lot)
		theFile= 'T:/work/UseR-2013/97_tutorial-demo/97_tutorial-demo.r'
		gff('saved', theFile)
		gff('sa\\(|===', theFile)
		
		theFile= fp(proot, 'demo_HLP.r')
		
		CreateNewProj(newProj.name= '96_Alba'
				, Templ.dir= 'T:/work/UseR-2013/lib/newProjTemplName'
				, root='T:/work/UseR-2013')
		
		CreateNewProj(newProj.name= '95_test_R2wd'
				, Templ.dir= 'T:/work/UseR-2013/lib/newProjTemplName'
				, root='T:/work/UseR-2013', R2wd=T)
		
		CreateNewProj(newProj.name= '71_5min_R_Work_Journal'
				, Templ.dir= 'T:/work/UseR-2013/lib/newProjTemplName'
				, root='M:')
		
		cc()
		ReleaseOut(vers='.b', exec= T)
		ReleaseOut(vers='Alb', exec= T)
		
		source(theFile)
	} #--

	