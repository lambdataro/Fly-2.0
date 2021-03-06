(*==================================================*
 * stdlib.ml - Fly 2.1
 * 2017/04/17 @lambdataro
 *==================================================*)

let stdlib_string = {code|
(* 数値演算子 *)
!__op_neg = __prim_neg;
!__op_add = __prim_add;
!__op_sub = __prim_sub;
!__op_mul = __prim_mul;
!__op_div = __prim_div;
!floor = __prim_floor;

(* bool演算 *)
!true = 1;
!false = 0;
!not = {IF: !x = $$; {?x; $IF: -> false}; true};

(* 比較演算子 *)
!__op_eq = __prim_eq;
!__op_ne = { !x = $$; !y = $$; not (x = y) };
!__op_lt = __prim_lt;
!__op_gt = { !x = $$; !y = $$; y < x };
!__op_le = { !x = $$; !y = $$; not (y < x) };
!__op_ge = { !x = $$; !y = $$; not (x < y) };

(* コンス演算子 *)
!__op_cons = __prim_cons;

(* 不動点演算子 *)
!__op_fix = { !f = $$; { !x = $$; f { !y = $$; (x x) y }}
                       { !x = $$; f { !y = $$; (x x) y }} };

(* 文字列化 *)
!to_str = __prim_to_str;

(* 入出力 *)
!write = __prim_write;
!writeln = { write $$; write "\n" };
!print = { write (to_str $$) };
!println = { writeln (to_str $$) };

(* 型判定 *)
!is_list = __prim_is_list;
!is_num = __prim_is_num;
|code};
