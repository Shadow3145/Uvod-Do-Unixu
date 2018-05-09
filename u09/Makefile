Pictures=$(wildcard *.jpg)
Results=$(Sources:.jpg=.thumb.jpg)

all:$(Results)

%.thumb.jpg:%.jpg
	@convert $< -resize 100x100 $@
	@./makeHTML

clean:
	@rm -f index.html $(Results)


