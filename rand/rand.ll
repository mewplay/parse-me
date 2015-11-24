; ModuleID = 'rand.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@seed = global i32 1234, align 4

; Function Attrs: nounwind readnone uwtable
define i32 @abs(i32 %x) #0 {
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
define i32 @rand() #1 {
  %1 = load i32, i32* @seed, align 4
  %2 = mul nsw i32 22695477, %1
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* @seed, align 4
  %4 = load i32, i32* @seed, align 4
  %5 = call i32 @abs(i32 %4) #2
  ret i32 %5
}

attributes #0 = { nounwind readnone uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (tags/RELEASE_370/final)"}
