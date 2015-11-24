; ModuleID = 'rand.ll'

@seed = global i32 1234, align 4

; Function Attrs: nounwind readnone uwtable
define i32 @abs(i32 %x) {
  %1 = icmp slt i32 %x, 0
  br i1 %1, label %2, label %4

; <label>:2                                       ; preds = %0
  %3 = sub nsw i32 0, %x
  br label %5

; <label>:4                                       ; preds = %0
  br label %5

; <label>:5                                       ; preds = %4, %2
  %.0 = phi i32 [ %3, %2 ], [ %x, %4 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @rand() {
  %1 = load i32, i32* @seed, align 4
  %2 = mul nsw i32 22695477, %1
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* @seed, align 4
  %4 = load i32, i32* @seed, align 4
  %5 = call i32 @abs(i32 %4)
  ret i32 %5
}
