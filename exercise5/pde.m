function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
pdetool('snapon','on');
set(ax,'DataAspectRatio',[1 1.0397540643771905 1.8279450769300949]);
set(ax,'PlotBoxAspectRatio',[1 1 1]);
set(ax,'XLim',[-0.054816399286987422 1.0393083778966132]);
set(ax,'YLim',[-0.075298338757674665 1.0623223452547621]);
set(ax,'XTickMode','auto');
set(ax,'YTick',[ -0.5,...
 0,...
 0.5,...
 1,...
 1.5,...
]);
pdetool('gridon','on');

% Geometry description:
pdepoly([ 0,...
 0,...
 1,...
 1,...
 0.5,...
 0.5,...
],...
[ 0,...
 1,...
 1,...
 0.5,...
 0.5,...
 0,...
],...
 'P1');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','P1')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(6,...
'dir',...
1,...
'1',...
'1')
pdesetbd(5,...
'neu',...
1,...
'0',...
'0')
pdesetbd(4,...
'neu',...
1,...
'0',...
'0')
pdesetbd(3,...
'dir',...
1,...
'1',...
'0')
pdesetbd(2,...
'neu',...
1,...
'0',...
'0')
pdesetbd(1,...
'neu',...
1,...
'0',...
'0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
setappdata(pde_fig,'MesherVersion','preR2013a');
pdetool('initmesh')

% PDE coefficients:
pdeseteq(1,...
'1',...
'0',...
'0',...
'1.0',...
'0:10',...
'0.0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['1  ';...
'0  ';...
'0  ';...
'1.0'])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
char('1','8814','10','pdeadworst',...
'0.5','longest','0','1e-4','','fixed','inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 2 1 1 2 1 1 1 0 0 0 1 1 1 0 1 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');

% Solve PDE:
pdetool('solve')
