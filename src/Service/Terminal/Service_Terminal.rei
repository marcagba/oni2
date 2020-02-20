open Oni_Core;
open Oni_Extensions;

module Msg: {
  type t =
    | Resized(unit)
    | Updated(unit);
};

module Sub: {
  let terminal:
    (
      ~id: int,
      ~cmd: string,
      ~columns: int,
      ~rows: int,
      ~workspaceUri: Uri.t,
      ~extHostClient: ExtHostClient.t
    ) =>
    Isolinear.Sub.t(Msg.t);
};

module Effect: {
  let input:
    (~id: int, ~input: string, ExtHostClient.t) => Isolinear.Effect.t(Msg.t);
};

let handleExtensionMessage: ExtHostClient.Terminal.msg => unit;