classdef my_calculator_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure          matlab.ui.Figure
        GridLayout        matlab.ui.container.GridLayout
        SubtructButton    matlab.ui.control.Button
        baEditField       matlab.ui.control.NumericEditField
        baEditFieldLabel  matlab.ui.control.Label
        aplusbEditField   matlab.ui.control.NumericEditField
        abEditFieldLabel  matlab.ui.control.Label
        bEditField        matlab.ui.control.NumericEditField
        bEditFieldLabel   matlab.ui.control.Label
        aEditField        matlab.ui.control.NumericEditField
        aEditFieldLabel   matlab.ui.control.Label
        AddButton         matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
        end

        % Button pushed function: AddButton
        function AddButtonPushed(app, event)
            app.aplusbEditField.Value  = app.aEditField.Value + app.bEditField.Value; 
        end

        % Button pushed function: SubtructButton
        function SubtructButtonPushed(app, event)
            app.aplusbEditField.Value  = app.bEditField.Value - app.aEditField.Value; 
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 312 336];
            app.UIFigure.Name = 'MATLAB App';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1x', 43, '3.64x', '2.49x', '1x'};
            app.GridLayout.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};

            % Create AddButton
            app.AddButton = uibutton(app.GridLayout, 'push');
            app.AddButton.ButtonPushedFcn = createCallbackFcn(app, @AddButtonPushed, true);
            app.AddButton.Layout.Row = 5;
            app.AddButton.Layout.Column = 4;
            app.AddButton.Text = 'Add';

            % Create aEditFieldLabel
            app.aEditFieldLabel = uilabel(app.GridLayout);
            app.aEditFieldLabel.HorizontalAlignment = 'right';
            app.aEditFieldLabel.Layout.Row = 2;
            app.aEditFieldLabel.Layout.Column = 2;
            app.aEditFieldLabel.Text = 'a =';

            % Create aEditField
            app.aEditField = uieditfield(app.GridLayout, 'numeric');
            app.aEditField.Layout.Row = 2;
            app.aEditField.Layout.Column = 3;

            % Create bEditFieldLabel
            app.bEditFieldLabel = uilabel(app.GridLayout);
            app.bEditFieldLabel.HorizontalAlignment = 'right';
            app.bEditFieldLabel.Layout.Row = 3;
            app.bEditFieldLabel.Layout.Column = 2;
            app.bEditFieldLabel.Text = 'b =';

            % Create bEditField
            app.bEditField = uieditfield(app.GridLayout, 'numeric');
            app.bEditField.Layout.Row = 3;
            app.bEditField.Layout.Column = 3;

            % Create abEditFieldLabel
            app.abEditFieldLabel = uilabel(app.GridLayout);
            app.abEditFieldLabel.HorizontalAlignment = 'right';
            app.abEditFieldLabel.Layout.Row = 5;
            app.abEditFieldLabel.Layout.Column = 2;
            app.abEditFieldLabel.Text = 'a + b =';

            % Create aplusbEditField
            app.aplusbEditField = uieditfield(app.GridLayout, 'numeric');
            app.aplusbEditField.Layout.Row = 5;
            app.aplusbEditField.Layout.Column = 3;

            % Create baEditFieldLabel
            app.baEditFieldLabel = uilabel(app.GridLayout);
            app.baEditFieldLabel.HorizontalAlignment = 'right';
            app.baEditFieldLabel.Layout.Row = 6;
            app.baEditFieldLabel.Layout.Column = 2;
            app.baEditFieldLabel.Text = 'b - a =';

            % Create baEditField
            app.baEditField = uieditfield(app.GridLayout, 'numeric');
            app.baEditField.Layout.Row = 6;
            app.baEditField.Layout.Column = 3;

            % Create SubtructButton
            app.SubtructButton = uibutton(app.GridLayout, 'push');
            app.SubtructButton.ButtonPushedFcn = createCallbackFcn(app, @SubtructButtonPushed, true);
            app.SubtructButton.Layout.Row = 6;
            app.SubtructButton.Layout.Column = 4;
            app.SubtructButton.Text = 'Subtruct';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = my_calculator_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end