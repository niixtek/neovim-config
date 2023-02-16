### README 


for i in init.lua lua; do \
	ln -sf $(pwd)/$i $HOME/.config/nvim/$i;
done;
