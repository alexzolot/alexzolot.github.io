#! /usr/bin/Rscript
# Project  : demo_HLP
# File     : demo_HLP/demo_RWJ.r
# no #=== headers
###############################################################################

if(init<- 1) { #### Init ===
	rm(list=ls(envir = .GlobalEnv), envir = .GlobalEnv)
	
	options(help='html', digits=4, width=3999, scipen=5, repos = c(CRAN= "http://cran.rstudio.com")
			, error= NULL) # options(error= recover) options(error=dump)  #or options(error=NULL) getOption('width')
	
	if(demo <- 1){
		# devtools::install_github('alexzolot/RWorkJournal', ref='rel.0.2')
		# replace the line 20 to full path to the file, as
		
		# theFile= 'm:/50_HLP/out/demo_HLP/demo_RWJ.r'
		# theFile= 'M:/00_tmp/1/demo_RWJ.r'
		
		theFile= '/edit/full/path/to/the/file/demo_RWJ.r'
		
		if(!file.exists(theFile)) stop(sprintf('File  %s  does not exists. Edit line 20 !', theFile))
		
		proot= dirname(theFile)
	}else{
		library(HaLaP)
		if(fromSrc <- 1) source('m:/50_HLP/out/packages/HaLaP/inst/rcode/HLP.r') # T:/work/UseR-2013/lib/zBase0.r
		#if(fromSrc <- 1) source('m:/50_HLP/out/packages/WorkJournal/inst/rcode/WorkJournal.r') # T:/work/UseR-2013/lib/zCode.r
		if(fromSrc <- 1) source('m:/50_HLP/out/packages/WorkJournal/inst/rcode/RWJ.r') # T:/work/UseR-2013/lib/zCode.r
		#source('T:/work/UseR-2013/lib/zBase1.r')  
		root= 'm:/50_HLP/out'
		proot= fp(root, 'demo_HLP')  # project root
		theFile= fp(proot, 'demo_RWJ2.r')
	}
	
	library(RWorkJournal)
	
	
	options(theFile= theFile)
	
	palette('default')
	palette(adjustcolor(palette(), alpha.f = .8))  ##ex: plot(1:19, pch=16, col=1:19, cex=3) palette()
	
	
	sw(fp(proot, 'out'))
	
	
	# catf('\ndetach("%s",  character.only = TRUE)', grep('^pac', search(), v=T))
	# gff('saved', theFile)
	# rmDF(); loo(); lo(); lsDF();
} #--
##########################################################

##   demo_HLP  ==

'
		## Usage of Markdown
		
		###  md - numbered list
		1. aaa
		1. bbb
		'

x= 1:9 # TODO: change it
y= 2   # xxx:  change it too
"
		###  Creation of a Project
		
		_(header 2)_
		
		This file `demo_HLP/demo_HLP.r` was _initially_ created as result of
		
		CreateNewProj(newProj.name= 'demo_HLP', Templ.dir= 'm:/50_HLP/out/packages/newProjTemplName', root='m:/50_HLP/out')
		"
z= 3
'		
		####  Shell script inserts
		_(header 3)_
		cd /cygdrive/m/50_HLP/bbwiki/wiki  ; cp ../../out/book/md/*.md .
		rm toc.md
		touch toc.md
		for f in *.md ;{ echo "[$f]($f:gs/ /_/)\n" >> toc.md}
		<toc.md
		
		
		#####  Links:
		
		* $@href{http://www.forkosh.com/mimetextutorial.html}{ @LaTeX @ link: @ try  @  mathTeX  @  tutorial} @quad @href{http://www.codecogs.com/latex/eqneditor.php}{@LaTeX}$ 
		* <a href="http://www.edii.uclm.es/~useR-2013/"> UseR! - 2013</a>, 
		* [UseR! - 2014](http://user2014.stat.ucla.edu/)
		* [mathTeX tutorial](http://www.forkosh.com/mimetextutorial.html)
		
		Pic: ![R logo](http://cran.r-project.org/Rlogo.jpg)	
		
		
		###  Usage of  $@LaTeX$  and quoted multiline text. 
		
		Any text can be between quotes or backticks, but if we need 
		to use $@LaTeX$ formulae, we should use symbol "@" instead of "\\", to prevent _"unrecognised escape sequence"_ error during the `R` code execution,
		including _inline_  ($y= 5 @sqrt{x_4^11}$ , $@exp(-@infty) = 0$  - **no** *whitespace* adjacent to 
		the $ delimiters -
		see [Equations in R Markdown](http://www.rstudio.com/ide/docs/authoring/using_markdown_equations) 
		) as well as _stand along_ equations: 
		
		@begin{aligned}
		@nabla @times @vec{@mathbf{B}} - @, @frac1c@, @frac{@partial@vec{@mathbf{E}}}{@partial t} & = @frac{4@pi}{c}@vec{@mathbf{j}} @@   @nabla @cdot @vec{@mathbf{E}} & = 4 @pi @rho @@
		@nabla @times @vec{@mathbf{E}}@, + @, @frac1c@, @frac{@partial@vec{@mathbf{B}}}{@partial t} & = @vec{@mathbf{0}} @@
		@nabla @cdot @vec{@mathbf{B}} & = 0 @end{aligned}
		
		$$  g@frac{d^2u}{dx^2} + L@sin u = 0 ; @quad  @sum_{n=1}^@infty {1@over n^2} = {@pi^2@over 6}  $$
		or
		@[
		@int@limits_{x^2 + y^2 @leq R^2} f(x,y)@,dx @,dy
		= @int@limits_{@theta=0}^{2@pi}@ @int@limits_{r=0}^R f(r@cos@theta,r@sin@theta) r@,dr@,d@theta  
		@]
		or with scale tag:
		<div style="font-size: 130%;">
		$$
		@int@limits_{x^3 + y^2 @leq R^2} f(x,y)@,dx @,dy
		= @int@limits_{@theta=0}^{2@pi}@ @int@limits_{r=0}^R f(r@cos@theta,r@sin@theta) r@,dr@,d@theta  
		$$
		</div>
		or with change of color:
		<div style="color:blue;">
		$$ y = @sum{x_i^2}  $$ 
		</div>
		'			
#	Behind comments  "#" we can use single  "\"  
#	in  $\LaTeX$  expressions, including inline  $y= 5 \sqrt{x_4^3}$ as well as stand alone equations. 


#'	The same behind roxygen "#'" comments: 
#'			
#'			$$  g\frac{d^2u}{dx^2} + L\sin u = 0 ; \quad  \sum_{n=1}^\infty {1\over n^2} = {\pi^2\over 6}  $$
#'			or
#'		$$	\int\limits_{x^2 + y^2 \leq R^2} f(x,y)\,dx\,dy  = \int\limits_{\theta=0}^{2\pi}\ \int\limits_{r=0}^R f(r\cos\theta,r\sin\theta) r\,dr\,d\theta   $$


###  Test plots

ww(); symbols(x, x, cir=x, fg=x, bg=x, inc=3.9, ma='test sg I')
sg('test sg I')
# Fig_1. test sg I

ww(); symbols(x, sin(x), sq=x, fg=x, bg=x, inc=3.9, ma='test sg sin')
sg('test sg sin')
# Fig_2. Test sg sin

ww(); symbols(x, exp(-x), star= matrix(rbeta(30, 1,2), le(x)), fg=x, bg=x, inc=.9, ma='test sg exp')
ww(); symbols(x, exp(-x), cir=x, fg=x, bg=x, inc=3.9, ma='test sg exp')
sg('test sg exp')
# Fig_3. Test sg exp
# Fig_1.  Test sg I - again
# xFig_6. test sg

####  ggplot	
library(ggplot2)
#qplot(x, cos(x^2), col= sample(2:4, 9, re=T), main=expression('Smoothed ~ ' %+% plain(cos)(x^2)'), geom=cn('point smooth'))
ww(); qplot(x, cos(x^2), col= sample(2:4, 9, re=T), main=expression(paste('Smoothed ', plain(cos)(x^2))), geom=cn('point smooth'))
sg('ggplot: Smoothed $ @cos(x^2) $ ', gg=T)
# Fig_4. ggplot: Smoothed $@cos{x^2}$ 


####  d3 plots
library(d3Network)
d3SimpleNetwork(df(source=sample(1:9, 9, re=T),  target=sample(1:9, 9, re=T)
				, fontsize = 15, linkColour = '#FF0000'
				, nodeColour = sample(cn('#0000FF #FF0000 #00FF00'), 9, re=T)), file='.htm')
expl('.htm')
sgd3()
# jFig_1. Interactive D3.js plot of Simple Network

####  4 stars plots	
for(i in 3:5) {ww(); 
	symbols(x, exp(-x), star= matrix(rbeta(i*10, 1, 2), le(x)), fg=x, bg=x, inc=.9
			, ma=sf('test %s sg exp', i))
	sg(sf('test %s sg exp', i))
}
# Fig_5. test 2 sg exp
# Fig_6. test 3 sg exp
# Fig_7. test 4 sg exp

message('\nNow call rwj()')

if(0){   ####  Misc   (cache, parking lot)
	theFile= 'm:/50_HLP/out/demo_HLP/demo_RWJ.r'
	rwj()
	rwj('m:/50_HLP/out/demo_HLP/demo_RWJ.r')
	gff('saved', theFile)
	gff('sa\\(|===', theFile)
	
	ReleaseOut(vers='.rwj0', exec=T)
	
	u= gregexpr(patt<- '<.?pre>', ss<- readLines('m:/50_HLP/out/demo_HLP/demo_HLP.r.htm'))
	prr(ss[laply(u, `[`, 1) > 0])
	i= which(laply(u, `[`, 1) > 0)
	u[[179]]
	u[[180]]
	prr(ss[179:180])
	s= laply(grege('<.?pre>', ss), `%+%`)
	
	grege('<.?pre>', ss)[i]
} #--

