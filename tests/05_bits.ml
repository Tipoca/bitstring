(* Extract bits.
 * $Id: 05_bits.ml,v 1.1 2008-03-31 22:52:17 rjones Exp $
 *)

open Printf

let bits = Bitmatch.make_bitstring 24 '\x5a' (* makes the string 0x5a5a5a *)

let () =
  bitmatch bits with
  | b0  : 1; b1  : 1; b2  : 1; b3  : 1; b4  : 1; b5  : 1; b6  : 1; b7  : 1;
    b8  : 1; b9  : 1; b10 : 1; b11 : 1; b12 : 1; b13 : 1; b14 : 1; b15 : 1;
    b16 : 1; b17 : 1; b18 : 1; b19 : 1; b20 : 1; b21 : 1; b22 : 1; b23 : 1;
    rest : -1 : bitstring ->
      assert (not b0 && b1 && not b2 && b3 && b4 && not b5 && b6 && not b7);
      assert (not b8 && b9 && not b10 && b11 && b12 && not b13 && b14 && not b15);
      assert (not b16 && b17 && not b18 && b19 && b20 && not b21 && b22 && not b23);
      let _, off, len = rest in
      assert (off = 24 && len = 0)

  | _ ->
      failwith "error: did not match\n"