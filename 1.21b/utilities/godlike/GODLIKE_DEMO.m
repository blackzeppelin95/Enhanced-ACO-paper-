function GODLIKE_DEMO
% GODLIKE_DEMO      
%
% type 'GODLIKE_DEMO' to run a demonstration of the 
% GODLIKE algorithm. 

    % initialize
    clc
    
    % first, demonstrate single-objective opzimiation. 
    % Show what we're gonna do
    fprintf(1, ['The first demonstration will show the algorithm\n',...
        'optmizing the 2-D Himmelblau test-function, defined as\n\n',...        ' 
        '      f(x1, x2) = (x1^2 + x2 - 11)^2 + (x1 + x2^2 - 7)^2\n\n', ...
        ' which has four minima where the function value is zero.\n\n',...
        ' This optimization is called by issuing the commands\n\n',...
        ' himmel = @(x) (x(:, 1).^2 + x(:, 2) - 11).^2 + ...\n',...
        '               (x(:, 1) + x(:, 2).^2 - 7).^2;\n',...
        ' [sol,fval] = GODLIKE(himmel, 250, [-5, -5], [5, 5])\n\n',...        
        'Press any key to start a demonstration of GODLIKE \n',...
        'with this single-objective optimization...\n\n'])    
    pause
       
    % do it (without display)
    clc
    himmel = @(x) (x(:, 1).^2 + x(:, 2) - 11).^2 + (x(:, 1) + x(:, 2).^2 - 7).^2;
    [sol,fval] = GODLIKE(himmel, 250, [-5, -5], [5, 5]) %#ok
    pause(1)
    
    % do it (with display)
    fprintf(1, ['Voila: The global optimum has been found.\n\n',...        
        'With the ''display'' setting set to ''plot'', the\n',...
        'optimization is rather slow, but provides a much better\n',...
        'insight in how each algorithm behaves. Now we issue the \n',...
        'same commands, but then with the display option set to\n',...
        '''plot'':\n\n',...
        ' [sol,fval] = GODLIKE(himmel, 250, [-5, -5], [5, 5],...\n',...
        '                      [], ''display'', ''plot'')\n\n',...        
        'Press any key to start this demonstration...\n\n']) 
    pause, clc, clf
    [sol,fval] = GODLIKE(himmel, 250, [-5, -5], [5, 5], [], 'display', 'plot') %#ok
    pause(1)
    
    
    
    
    % multi-objective optimization
    fprintf(1, ['Now a demonstration of multi-objective optimization.\n',...
        'For multi-objective optimization, we''ll optimize the\n',...
        '2-objective KUR-problem, defined as \n\n',...
        ' fun1 = sum( -10*(exp(-0.2*sqrt(x_i^2 + x_(i+1)^2))) )\n',...
        ' fun2 = sum( abs(x_i)^0.8 + 5*sin(x_i^3), 2 )\n\n',...
        'summed over all x_i. This problem has a discontinuous \n',...
        'Pareto front, which makes it somewhat of a challenge to \n',...
        'locate. However, with GODLIKE, this is no problem. For\n',...
        'this demonstration, we issue the commands\n\n',...
        '  fun1 = @(x) sum( -10*(exp(-0.2*sqrt(x(:, 1:end-1).^2 +...\n',...
        '                    x(:, 2:end).^2))), 2);\n',...
        '  fun2 = @(x) sum( abs(x).^0.8 + 5*sin(x.^3), 2);\n',...
        '  [sol,fvals] = GODLIKE({fun1,fun2}, 500, [-5, -5, -5],...\n',...
        '                        [5,5,5], {''DE'';''GA'';''ASA''},...\n',...
        '                        ''display'', ''plot'')\n\n',...
        'Press any key to start this demonstration...\n\n']) 
    pause, clc
    
    % do it    
    fun1 = @(x) sum( -10*(exp(-0.2*sqrt(x(:, 1:end-1).^2 + x(:, 2:end).^2))), 2);
    fun2 = @(x) sum( abs(x).^0.8 + 5*sin(x.^3), 2);
    [sol,fvals] = GODLIKE({fun1,fun2},500,[-5,-5,-5],[5,5,5],{'DE';'GA';'ASA'},'display','plot')%#ok
    pause(1)
    
    % do it (with print display)
    fprintf(1, ['Note that alternatively, the display setting may be \n',...
        'set to just ''on''. In that case, GODLIKE will just\n',...
        'print relevant information on the screen about the \n',...
        'current progress of the optimization. To show what \n',...
        'that looks like, we''ll re-run the previous optimization\n',...
        'with the display setting set to ''on''.\n\n',...
        'Press any key to start this demonstration...\n\n']) 
    pause, clc, clf
    [sol,fvals] = GODLIKE({fun1,fun2},500,[-5,-5,-5],[5,5,5],{'DE';'GA';'ASA'},'display','on')%#ok
    pause(1)
    
    % do it (in full)
    fprintf(1, ['As an example of the most extended usage possible \n',...
        'with GODLIKE, the same multi-objective optimization \n',...
        'will now be run, by issuing the commands\n\n',...
        '  [sol,fvals,Paretos,ParetoFuns,exitflag,output] = ...\n',...
        '  GODLIKE({fun1,fun2}, 500, [-5, -5, -5],[5,5,5],...\n',...
        '  {''DE'';''GA'';''DE'';''GA'';''ASA''},...\n',...
        '  ''display'', ''plot'', ''MaxIters'', 2, ...\n',...
        '  ''MinIters'', 2)\n\n',...
        'Press any key to start this demonstration...\n\n']) 
    pause, clc
    
    % do it (in full)
    [sol,fvals,Paretos,ParetoFuns,exitflag,output] = ...
        GODLIKE({fun1,fun2},500,[-5,-5,-5],[5,5,5],...
        {'DE';'GA';'DE';'GA';'ASA'},'display','plot')%#ok
    
    % concluding remarks
    fprintf(1, ['This concludes the simple demonstration. Take a look in \n',...
        'the manual.pdf and background.pdf files in the documentation\n',...
        'directory to get a better idea about the extensive options \n',...
        'GODLIKE offers. Or just experiment with how GODLIKE works\n',...
        'on your own functions.\n'])
    
end
