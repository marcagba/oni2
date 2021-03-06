open Oni_Core;

[@deriving show]
type msg;

type model;

let initial:
  (~menus: list(MenuBar.Schema.menu), ~groups: list(MenuBar.Schema.group)) =>
  model;

type outmsg =
  | Nothing
  | ExecuteCommand({command: string});

let update:
  (
    ~contextKeys: WhenExpr.ContextKeys.t,
    ~commands: Command.Lookup.t(_),
    msg,
    model
  ) =>
  (model, outmsg);

module Global = Global;

module View: {
  let make:
    (
      ~isWindowFocused: bool,
      ~theme: ColorTheme.Colors.t,
      ~font: UiFont.t,
      ~config: Config.resolver,
      ~context: WhenExpr.ContextKeys.t,
      ~input: Feature_Input.model,
      ~model: model,
      ~dispatch: msg => unit,
      unit
    ) =>
    Revery.UI.element;
};
