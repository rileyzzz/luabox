; ModuleID = 'lvm.o'
source_filename = "lvm.c"
target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-f128:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32-unknown-emscripten"

%struct.TValue = type { %union.Value, i8 }
%union.Value = type { i64 }
%union.StackValue = type { %struct.TValue }
%struct.Upvaldesc = type { ptr, i8, i8, i8 }

@.str = private unnamed_addr constant [6 x i8] c"index\00", align 1
@.str.1 = private unnamed_addr constant [40 x i8] c"'__index' chain too long; possible loop\00", align 1
@.str.2 = private unnamed_addr constant [43 x i8] c"'__newindex' chain too long; possible loop\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"string length overflow\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"get length of\00", align 1
@.str.5 = private unnamed_addr constant [26 x i8] c"attempt to divide by zero\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"attempt to perform 'n%%0'\00", align 1
@luaV_execute.disptab = internal unnamed_addr constant [83 x ptr] [ptr blockaddress(@luaV_execute, %52), ptr blockaddress(@luaV_execute, %77), ptr blockaddress(@luaV_execute, %94), ptr blockaddress(@luaV_execute, %111), ptr blockaddress(@luaV_execute, %130), ptr blockaddress(@luaV_execute, %151), ptr blockaddress(@luaV_execute, %164), ptr blockaddress(@luaV_execute, %178), ptr blockaddress(@luaV_execute, %191), ptr blockaddress(@luaV_execute, %214), ptr blockaddress(@luaV_execute, %237), ptr blockaddress(@luaV_execute, %275), ptr blockaddress(@luaV_execute, %317), ptr blockaddress(@luaV_execute, %386), ptr blockaddress(@luaV_execute, %437), ptr blockaddress(@luaV_execute, %476), ptr blockaddress(@luaV_execute, %537), ptr blockaddress(@luaV_execute, %625), ptr blockaddress(@luaV_execute, %695), ptr blockaddress(@luaV_execute, %753), ptr blockaddress(@luaV_execute, %798), ptr blockaddress(@luaV_execute, %845), ptr blockaddress(@luaV_execute, %880), ptr blockaddress(@luaV_execute, %933), ptr blockaddress(@luaV_execute, %986), ptr blockaddress(@luaV_execute, %1039), ptr blockaddress(@luaV_execute, %1117), ptr blockaddress(@luaV_execute, %1161), ptr blockaddress(@luaV_execute, %1202), ptr blockaddress(@luaV_execute, %1277), ptr blockaddress(@luaV_execute, %1317), ptr blockaddress(@luaV_execute, %1357), ptr blockaddress(@luaV_execute, %1397), ptr blockaddress(@luaV_execute, %1448), ptr blockaddress(@luaV_execute, %1499), ptr blockaddress(@luaV_execute, %1552), ptr blockaddress(@luaV_execute, %1605), ptr blockaddress(@luaV_execute, %1658), ptr blockaddress(@luaV_execute, %1736), ptr blockaddress(@luaV_execute, %1780), ptr blockaddress(@luaV_execute, %1821), ptr blockaddress(@luaV_execute, %1896), ptr blockaddress(@luaV_execute, %1951), ptr blockaddress(@luaV_execute, %2006), ptr blockaddress(@luaV_execute, %2127), ptr blockaddress(@luaV_execute, %2061), ptr blockaddress(@luaV_execute, %2193), ptr blockaddress(@luaV_execute, %2217), ptr blockaddress(@luaV_execute, %2244), ptr blockaddress(@luaV_execute, %2270), ptr blockaddress(@luaV_execute, %2301), ptr blockaddress(@luaV_execute, %2340), ptr blockaddress(@luaV_execute, %2362), ptr blockaddress(@luaV_execute, %2380), ptr blockaddress(@luaV_execute, %2405), ptr blockaddress(@luaV_execute, %2421), ptr blockaddress(@luaV_execute, %2435), ptr blockaddress(@luaV_execute, %2449), ptr blockaddress(@luaV_execute, %2482), ptr blockaddress(@luaV_execute, %2603), ptr blockaddress(@luaV_execute, %2725), ptr blockaddress(@luaV_execute, %2756), ptr blockaddress(@luaV_execute, %2801), ptr blockaddress(@luaV_execute, %2851), ptr blockaddress(@luaV_execute, %2901), ptr blockaddress(@luaV_execute, %2951), ptr blockaddress(@luaV_execute, %3001), ptr blockaddress(@luaV_execute, %3033), ptr blockaddress(@luaV_execute, %3071), ptr blockaddress(@luaV_execute, %3096), ptr blockaddress(@luaV_execute, %3132), ptr blockaddress(@luaV_execute, %3178), ptr blockaddress(@luaV_execute, %3201), ptr blockaddress(@luaV_execute, %3255), ptr blockaddress(@luaV_execute, %3304), ptr blockaddress(@luaV_execute, %3582), ptr blockaddress(@luaV_execute, %3592), ptr blockaddress(@luaV_execute, %3610), ptr blockaddress(@luaV_execute, %3641), ptr blockaddress(@luaV_execute, %3719), ptr blockaddress(@luaV_execute, %3790), ptr blockaddress(@luaV_execute, %3807), ptr blockaddress(@luaV_execute, %3820)], align 16
@.str.7 = private unnamed_addr constant [19 x i8] c"'for' step is zero\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"limit\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"step\00", align 1
@.str.10 = private unnamed_addr constant [14 x i8] c"initial value\00", align 1

; Function Attrs: nounwind
define hidden range(i32 0, 2) i32 @luaV_tonumber_(ptr nocapture noundef readonly %0, ptr nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = alloca %struct.TValue, align 8
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #12
  %4 = getelementptr inbounds i8, ptr %0, i32 8
  %5 = load i8, ptr %4, align 8, !tbaa !2
  %6 = icmp eq i8 %5, 3
  br i1 %6, label %7, label %10

7:                                                ; preds = %2
  %8 = load i64, ptr %0, align 8, !tbaa !6
  %9 = sitofp i64 %8 to double
  br label %37

10:                                               ; preds = %2
  %11 = and i8 %5, 15
  %12 = icmp eq i8 %11, 4
  br i1 %12, label %13, label %39

13:                                               ; preds = %10
  %14 = load ptr, ptr %0, align 8, !tbaa !6
  %15 = getelementptr inbounds i8, ptr %14, i32 16
  %16 = call i32 @luaO_str2num(ptr noundef nonnull %15, ptr noundef nonnull %3) #12
  %17 = getelementptr inbounds i8, ptr %14, i32 7
  %18 = load i8, ptr %17, align 1, !tbaa !7
  %19 = icmp eq i8 %18, -1
  br i1 %19, label %22, label %20

20:                                               ; preds = %13
  %21 = zext i8 %18 to i32
  br label %25

22:                                               ; preds = %13
  %23 = getelementptr inbounds i8, ptr %14, i32 12
  %24 = load i32, ptr %23, align 4, !tbaa !6
  br label %25

25:                                               ; preds = %20, %22
  %26 = phi i32 [ %21, %20 ], [ %24, %22 ]
  %27 = add i32 %26, 1
  %28 = icmp eq i32 %16, %27
  br i1 %28, label %29, label %39

29:                                               ; preds = %25
  %30 = getelementptr inbounds i8, ptr %3, i32 8
  %31 = load i8, ptr %30, align 8, !tbaa !2
  %32 = icmp eq i8 %31, 3
  %33 = load i64, ptr %3, align 8
  %34 = sitofp i64 %33 to double
  %35 = bitcast i64 %33 to double
  %36 = select i1 %32, double %34, double %35
  br label %37

37:                                               ; preds = %7, %29
  %38 = phi double [ %36, %29 ], [ %9, %7 ]
  store double %38, ptr %1, align 8, !tbaa !11
  br label %39

39:                                               ; preds = %37, %10, %25
  %40 = phi i32 [ 0, %25 ], [ 0, %10 ], [ 1, %37 ]
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #12
  ret i32 %40
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define hidden range(i32 0, 2) i32 @luaV_flttointeger(double noundef %0, ptr nocapture noundef writeonly %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = tail call double @llvm.floor.f64(double %0)
  %5 = fcmp une double %4, %0
  br i1 %5, label %6, label %9

6:                                                ; preds = %3
  switch i32 %2, label %9 [
    i32 0, label %18
    i32 2, label %7
  ]

7:                                                ; preds = %6
  %8 = fadd double %4, 1.000000e+00
  br label %9

9:                                                ; preds = %6, %7, %3
  %10 = phi double [ %8, %7 ], [ %4, %3 ], [ %4, %6 ]
  %11 = fcmp oge double %10, 0xC3E0000000000000
  %12 = fcmp olt double %10, 0x43E0000000000000
  %13 = and i1 %11, %12
  br i1 %13, label %14, label %16

14:                                               ; preds = %9
  %15 = fptosi double %10 to i64
  store i64 %15, ptr %1, align 8, !tbaa !13
  br label %16

16:                                               ; preds = %14, %9
  %17 = zext i1 %13 to i32
  br label %18

18:                                               ; preds = %6, %16
  %19 = phi i32 [ %17, %16 ], [ %2, %6 ]
  ret i32 %19
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.floor.f64(double) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define hidden range(i32 0, 2) i32 @luaV_tointegerns(ptr nocapture noundef readonly %0, ptr nocapture noundef writeonly %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = getelementptr inbounds i8, ptr %0, i32 8
  %5 = load i8, ptr %4, align 8, !tbaa !2
  switch i8 %5, label %24 [
    i8 19, label %6
    i8 3, label %22
  ]

6:                                                ; preds = %3
  %7 = load double, ptr %0, align 8, !tbaa !6
  %8 = tail call double @llvm.floor.f64(double %7)
  %9 = fcmp une double %8, %7
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  switch i32 %2, label %13 [
    i32 0, label %24
    i32 2, label %11
  ]

11:                                               ; preds = %10
  %12 = fadd double %8, 1.000000e+00
  br label %13

13:                                               ; preds = %11, %10, %6
  %14 = phi double [ %12, %11 ], [ %8, %6 ], [ %8, %10 ]
  %15 = fcmp oge double %14, 0xC3E0000000000000
  %16 = fcmp olt double %14, 0x43E0000000000000
  %17 = and i1 %15, %16
  br i1 %17, label %18, label %20

18:                                               ; preds = %13
  %19 = fptosi double %14 to i64
  store i64 %19, ptr %1, align 8, !tbaa !13
  br label %20

20:                                               ; preds = %18, %13
  %21 = zext i1 %17 to i32
  br label %24

22:                                               ; preds = %3
  %23 = load i64, ptr %0, align 8, !tbaa !6
  store i64 %23, ptr %1, align 8, !tbaa !13
  br label %24

24:                                               ; preds = %20, %10, %3, %22
  %25 = phi i32 [ 1, %22 ], [ 0, %3 ], [ %21, %20 ], [ %2, %10 ]
  ret i32 %25
}

; Function Attrs: nounwind
define hidden range(i32 0, 2) i32 @luaV_tointeger(ptr nocapture noundef readonly %0, ptr nocapture noundef writeonly %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca %struct.TValue, align 8
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4) #12
  %5 = getelementptr inbounds i8, ptr %0, i32 8
  %6 = load i8, ptr %5, align 8, !tbaa !2
  %7 = and i8 %6, 15
  %8 = icmp eq i8 %7, 4
  br i1 %8, label %9, label %30

9:                                                ; preds = %3
  %10 = load ptr, ptr %0, align 8, !tbaa !6
  %11 = getelementptr inbounds i8, ptr %10, i32 16
  %12 = call i32 @luaO_str2num(ptr noundef nonnull %11, ptr noundef nonnull %4) #12
  %13 = getelementptr inbounds i8, ptr %10, i32 7
  %14 = load i8, ptr %13, align 1, !tbaa !7
  %15 = icmp eq i8 %14, -1
  br i1 %15, label %18, label %16

16:                                               ; preds = %9
  %17 = zext i8 %14 to i32
  br label %21

18:                                               ; preds = %9
  %19 = getelementptr inbounds i8, ptr %10, i32 12
  %20 = load i32, ptr %19, align 4, !tbaa !6
  br label %21

21:                                               ; preds = %16, %18
  %22 = phi i32 [ %17, %16 ], [ %20, %18 ]
  %23 = add i32 %22, 1
  %24 = icmp ne i32 %12, %23
  %25 = freeze i1 %24
  %26 = getelementptr inbounds i8, ptr %4, i32 8
  %27 = select i1 %25, ptr %0, ptr %4
  %28 = select i1 %25, ptr %5, ptr %26
  %29 = load i8, ptr %28, align 8, !tbaa !2
  br label %30

30:                                               ; preds = %21, %3
  %31 = phi i8 [ %29, %21 ], [ %6, %3 ]
  %32 = phi ptr [ %27, %21 ], [ %0, %3 ]
  switch i8 %31, label %51 [
    i8 19, label %33
    i8 3, label %49
  ]

33:                                               ; preds = %30
  %34 = load double, ptr %32, align 8, !tbaa !6
  %35 = call double @llvm.floor.f64(double %34)
  %36 = fcmp une double %35, %34
  br i1 %36, label %37, label %40

37:                                               ; preds = %33
  switch i32 %2, label %40 [
    i32 0, label %51
    i32 2, label %38
  ]

38:                                               ; preds = %37
  %39 = fadd double %35, 1.000000e+00
  br label %40

40:                                               ; preds = %38, %37, %33
  %41 = phi double [ %39, %38 ], [ %35, %33 ], [ %35, %37 ]
  %42 = fcmp oge double %41, 0xC3E0000000000000
  %43 = fcmp olt double %41, 0x43E0000000000000
  %44 = and i1 %42, %43
  br i1 %44, label %45, label %47

45:                                               ; preds = %40
  %46 = fptosi double %41 to i64
  store i64 %46, ptr %1, align 8, !tbaa !13
  br label %47

47:                                               ; preds = %45, %40
  %48 = zext i1 %44 to i32
  br label %51

49:                                               ; preds = %30
  %50 = load i64, ptr %32, align 8, !tbaa !6
  store i64 %50, ptr %1, align 8, !tbaa !13
  br label %51

51:                                               ; preds = %30, %37, %47, %49
  %52 = phi i32 [ 1, %49 ], [ 0, %30 ], [ %48, %47 ], [ %2, %37 ]
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #12
  ret i32 %52
}

; Function Attrs: nounwind
define hidden void @luaV_finishget(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef readnone %4) local_unnamed_addr #0 {
  %6 = getelementptr inbounds i8, ptr %0, i32 16
  br label %7

7:                                                ; preds = %5, %59
  %8 = phi ptr [ %1, %5 ], [ %42, %59 ]
  %9 = phi ptr [ %4, %5 ], [ %60, %59 ]
  %10 = phi i32 [ 0, %5 ], [ %61, %59 ]
  %11 = icmp eq ptr %9, null
  br i1 %11, label %12, label %19

12:                                               ; preds = %7
  %13 = tail call ptr @luaT_gettmbyobj(ptr noundef %0, ptr noundef %8, i32 noundef 0) #12
  %14 = getelementptr inbounds i8, ptr %13, i32 8
  %15 = load i8, ptr %14, align 8, !tbaa !2
  %16 = and i8 %15, 15
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %18, label %40, !prof !15

18:                                               ; preds = %12
  tail call void @luaG_typeerror(ptr noundef %0, ptr noundef %8, ptr noundef nonnull @.str) #13
  unreachable

19:                                               ; preds = %7
  %20 = load ptr, ptr %8, align 8, !tbaa !6
  %21 = getelementptr inbounds i8, ptr %20, i32 24
  %22 = load ptr, ptr %21, align 8, !tbaa !6
  %23 = icmp eq ptr %22, null
  br i1 %23, label %38, label %24

24:                                               ; preds = %19
  %25 = getelementptr inbounds i8, ptr %22, i32 6
  %26 = load i8, ptr %25, align 2, !tbaa !16
  %27 = and i8 %26, 1
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %29, label %38

29:                                               ; preds = %24
  %30 = load ptr, ptr %6, align 4, !tbaa !18
  %31 = getelementptr inbounds i8, ptr %30, i32 172
  %32 = load ptr, ptr %31, align 4, !tbaa !23
  %33 = tail call ptr @luaT_gettm(ptr noundef nonnull %22, i32 noundef 0, ptr noundef %32) #12
  %34 = icmp eq ptr %33, null
  br i1 %34, label %38, label %35

35:                                               ; preds = %29
  %36 = getelementptr inbounds i8, ptr %33, i32 8
  %37 = load i8, ptr %36, align 8, !tbaa !2
  br label %40

38:                                               ; preds = %24, %19, %29
  %39 = getelementptr inbounds i8, ptr %3, i32 8
  store i8 0, ptr %39, align 8, !tbaa !6
  br label %64

40:                                               ; preds = %35, %12
  %41 = phi i8 [ %15, %12 ], [ %37, %35 ]
  %42 = phi ptr [ %13, %12 ], [ %33, %35 ]
  %43 = and i8 %41, 15
  %44 = icmp eq i8 %43, 6
  br i1 %44, label %45, label %46

45:                                               ; preds = %40
  tail call void @luaT_callTMres(ptr noundef %0, ptr noundef nonnull %42, ptr noundef %8, ptr noundef %2, ptr noundef %3) #12
  br label %64

46:                                               ; preds = %40
  %47 = icmp eq i8 %41, 69
  br i1 %47, label %48, label %59

48:                                               ; preds = %46
  %49 = load ptr, ptr %42, align 8, !tbaa !6
  %50 = tail call ptr @luaH_get(ptr noundef %49, ptr noundef %2) #12
  %51 = getelementptr inbounds i8, ptr %50, i32 8
  %52 = load i8, ptr %51, align 8, !tbaa !2
  %53 = and i8 %52, 15
  %54 = icmp eq i8 %53, 0
  br i1 %54, label %59, label %55

55:                                               ; preds = %48
  %56 = load i64, ptr %50, align 8, !tbaa !6
  store i64 %56, ptr %3, align 8, !tbaa !6
  %57 = load i8, ptr %51, align 8, !tbaa !2
  %58 = getelementptr inbounds i8, ptr %3, i32 8
  store i8 %57, ptr %58, align 8, !tbaa !2
  br label %64

59:                                               ; preds = %46, %48
  %60 = phi ptr [ %50, %48 ], [ null, %46 ]
  %61 = add nuw nsw i32 %10, 1
  %62 = icmp eq i32 %61, 2000
  br i1 %62, label %63, label %7

63:                                               ; preds = %59
  tail call void (ptr, ptr, ...) @luaG_runerror(ptr noundef %0, ptr noundef nonnull @.str.1) #13
  unreachable

64:                                               ; preds = %55, %45, %38
  ret void
}

declare ptr @luaT_gettmbyobj(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: noreturn
declare void @luaG_typeerror(ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #6

declare ptr @luaT_gettm(ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #5

declare void @luaT_callTMres(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #5

declare ptr @luaH_get(ptr noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #7

; Function Attrs: noreturn
declare void @luaG_runerror(ptr noundef, ptr noundef, ...) local_unnamed_addr #6

; Function Attrs: nounwind
define hidden void @luaV_finishset(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) local_unnamed_addr #0 {
  %6 = getelementptr inbounds i8, ptr %0, i32 16
  br label %7

7:                                                ; preds = %5, %92
  %8 = phi ptr [ %1, %5 ], [ %60, %92 ]
  %9 = phi ptr [ %4, %5 ], [ %93, %92 ]
  %10 = phi i32 [ 0, %5 ], [ %94, %92 ]
  %11 = icmp eq ptr %9, null
  br i1 %11, label %51, label %12

12:                                               ; preds = %7
  %13 = load ptr, ptr %8, align 8, !tbaa !6
  %14 = getelementptr inbounds i8, ptr %13, i32 24
  %15 = load ptr, ptr %14, align 4, !tbaa !24
  %16 = icmp eq ptr %15, null
  br i1 %16, label %31, label %17

17:                                               ; preds = %12
  %18 = getelementptr inbounds i8, ptr %15, i32 6
  %19 = load i8, ptr %18, align 2, !tbaa !16
  %20 = and i8 %19, 2
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %22, label %31

22:                                               ; preds = %17
  %23 = load ptr, ptr %6, align 4, !tbaa !18
  %24 = getelementptr inbounds i8, ptr %23, i32 176
  %25 = load ptr, ptr %24, align 4, !tbaa !23
  %26 = tail call ptr @luaT_gettm(ptr noundef nonnull %15, i32 noundef 1, ptr noundef %25) #12
  %27 = icmp eq ptr %26, null
  br i1 %27, label %31, label %28

28:                                               ; preds = %22
  %29 = getelementptr inbounds i8, ptr %26, i32 8
  %30 = load i8, ptr %29, align 8, !tbaa !2
  br label %58

31:                                               ; preds = %17, %12, %22
  tail call void @luaH_finishset(ptr noundef %0, ptr noundef nonnull %13, ptr noundef %2, ptr noundef nonnull %9, ptr noundef %3) #12
  %32 = getelementptr inbounds i8, ptr %13, i32 6
  %33 = load i8, ptr %32, align 2, !tbaa !16
  %34 = and i8 %33, -64
  store i8 %34, ptr %32, align 2, !tbaa !16
  %35 = getelementptr inbounds i8, ptr %3, i32 8
  %36 = load i8, ptr %35, align 8, !tbaa !2
  %37 = and i8 %36, 64
  %38 = icmp eq i8 %37, 0
  br i1 %38, label %97, label %39

39:                                               ; preds = %31
  %40 = getelementptr inbounds i8, ptr %13, i32 5
  %41 = load i8, ptr %40, align 1, !tbaa !6
  %42 = and i8 %41, 32
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %97, label %44

44:                                               ; preds = %39
  %45 = load ptr, ptr %3, align 8, !tbaa !6
  %46 = getelementptr inbounds i8, ptr %45, i32 5
  %47 = load i8, ptr %46, align 1, !tbaa !25
  %48 = and i8 %47, 24
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %97, label %50

50:                                               ; preds = %44
  tail call void @luaC_barrierback_(ptr noundef %0, ptr noundef nonnull %13) #12
  br label %97

51:                                               ; preds = %7
  %52 = tail call ptr @luaT_gettmbyobj(ptr noundef %0, ptr noundef %8, i32 noundef 1) #12
  %53 = getelementptr inbounds i8, ptr %52, i32 8
  %54 = load i8, ptr %53, align 8, !tbaa !2
  %55 = and i8 %54, 15
  %56 = icmp eq i8 %55, 0
  br i1 %56, label %57, label %58, !prof !15

57:                                               ; preds = %51
  tail call void @luaG_typeerror(ptr noundef %0, ptr noundef %8, ptr noundef nonnull @.str) #13
  unreachable

58:                                               ; preds = %28, %51
  %59 = phi i8 [ %54, %51 ], [ %30, %28 ]
  %60 = phi ptr [ %52, %51 ], [ %26, %28 ]
  %61 = and i8 %59, 15
  %62 = icmp eq i8 %61, 6
  br i1 %62, label %63, label %64

63:                                               ; preds = %58
  tail call void @luaT_callTM(ptr noundef %0, ptr noundef nonnull %60, ptr noundef %8, ptr noundef %2, ptr noundef %3) #12
  br label %97

64:                                               ; preds = %58
  %65 = icmp eq i8 %59, 69
  br i1 %65, label %66, label %92

66:                                               ; preds = %64
  %67 = load ptr, ptr %60, align 8, !tbaa !6
  %68 = tail call ptr @luaH_get(ptr noundef %67, ptr noundef %2) #12
  %69 = getelementptr inbounds i8, ptr %68, i32 8
  %70 = load i8, ptr %69, align 8, !tbaa !2
  %71 = and i8 %70, 15
  %72 = icmp eq i8 %71, 0
  br i1 %72, label %92, label %73

73:                                               ; preds = %66
  %74 = load i64, ptr %3, align 8, !tbaa !6
  store i64 %74, ptr %68, align 8, !tbaa !6
  %75 = getelementptr inbounds i8, ptr %3, i32 8
  %76 = load i8, ptr %75, align 8, !tbaa !2
  store i8 %76, ptr %69, align 8, !tbaa !2
  %77 = and i8 %76, 64
  %78 = icmp eq i8 %77, 0
  br i1 %78, label %97, label %79

79:                                               ; preds = %73
  %80 = load ptr, ptr %60, align 8, !tbaa !6
  %81 = getelementptr inbounds i8, ptr %80, i32 5
  %82 = load i8, ptr %81, align 1, !tbaa !25
  %83 = and i8 %82, 32
  %84 = icmp eq i8 %83, 0
  br i1 %84, label %97, label %85

85:                                               ; preds = %79
  %86 = load ptr, ptr %3, align 8, !tbaa !6
  %87 = getelementptr inbounds i8, ptr %86, i32 5
  %88 = load i8, ptr %87, align 1, !tbaa !25
  %89 = and i8 %88, 24
  %90 = icmp eq i8 %89, 0
  br i1 %90, label %97, label %91

91:                                               ; preds = %85
  tail call void @luaC_barrierback_(ptr noundef %0, ptr noundef nonnull %80) #12
  br label %97

92:                                               ; preds = %64, %66
  %93 = phi ptr [ %68, %66 ], [ null, %64 ]
  %94 = add nuw nsw i32 %10, 1
  %95 = icmp eq i32 %94, 2000
  br i1 %95, label %96, label %7

96:                                               ; preds = %92
  tail call void (ptr, ptr, ...) @luaG_runerror(ptr noundef %0, ptr noundef nonnull @.str.2) #13
  unreachable

97:                                               ; preds = %63, %73, %91, %85, %79, %39, %44, %50, %31
  ret void
}

declare void @luaH_finishset(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #5

declare void @luaC_barrierback_(ptr noundef, ptr noundef) local_unnamed_addr #5

declare void @luaT_callTM(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: nounwind
define hidden i32 @luaV_lessthan(ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds i8, ptr %1, i32 8
  %5 = load i8, ptr %4, align 8, !tbaa !2
  %6 = and i8 %5, 15
  switch i8 %6, label %74 [
    i8 3, label %7
    i8 4, label %64
  ]

7:                                                ; preds = %3
  %8 = getelementptr inbounds i8, ptr %2, i32 8
  %9 = load i8, ptr %8, align 8, !tbaa !2
  %10 = and i8 %9, 15
  %11 = icmp eq i8 %10, 3
  br i1 %11, label %12, label %74

12:                                               ; preds = %7
  %13 = icmp eq i8 %5, 3
  br i1 %13, label %14, label %39

14:                                               ; preds = %12
  %15 = load i64, ptr %1, align 8, !tbaa !6
  %16 = icmp eq i8 %9, 3
  br i1 %16, label %17, label %20

17:                                               ; preds = %14
  %18 = load i64, ptr %2, align 8, !tbaa !6
  %19 = icmp slt i64 %15, %18
  br label %61

20:                                               ; preds = %14
  %21 = load double, ptr %2, align 8, !tbaa !6
  %22 = add i64 %15, 9007199254740992
  %23 = icmp ult i64 %22, 18014398509481985
  br i1 %23, label %24, label %27

24:                                               ; preds = %20
  %25 = sitofp i64 %15 to double
  %26 = fcmp ogt double %21, %25
  br label %61

27:                                               ; preds = %20
  %28 = tail call double @llvm.floor.f64(double %21)
  %29 = fcmp une double %28, %21
  %30 = fadd double %28, 1.000000e+00
  %31 = select i1 %29, double %30, double %28
  %32 = fcmp oge double %31, 0xC3E0000000000000
  %33 = fcmp olt double %31, 0x43E0000000000000
  %34 = and i1 %32, %33
  %35 = fptosi double %31 to i64
  %36 = icmp slt i64 %15, %35
  %37 = fcmp ogt double %21, 0.000000e+00
  %38 = select i1 %34, i1 %36, i1 %37
  br label %61

39:                                               ; preds = %12
  %40 = load double, ptr %1, align 8, !tbaa !6
  %41 = icmp eq i8 %9, 19
  br i1 %41, label %42, label %45

42:                                               ; preds = %39
  %43 = load double, ptr %2, align 8, !tbaa !6
  %44 = fcmp olt double %40, %43
  br label %61

45:                                               ; preds = %39
  %46 = load i64, ptr %2, align 8, !tbaa !6
  %47 = add i64 %46, 9007199254740992
  %48 = icmp ult i64 %47, 18014398509481985
  br i1 %48, label %49, label %52

49:                                               ; preds = %45
  %50 = sitofp i64 %46 to double
  %51 = fcmp olt double %40, %50
  br label %61

52:                                               ; preds = %45
  %53 = tail call double @llvm.floor.f64(double %40)
  %54 = fcmp oge double %53, 0xC3E0000000000000
  %55 = fcmp olt double %53, 0x43E0000000000000
  %56 = and i1 %54, %55
  %57 = fptosi double %53 to i64
  %58 = icmp sgt i64 %46, %57
  %59 = fcmp olt double %40, 0.000000e+00
  %60 = select i1 %56, i1 %58, i1 %59
  br label %61

61:                                               ; preds = %17, %24, %27, %42, %49, %52
  %62 = phi i1 [ %19, %17 ], [ %44, %42 ], [ %26, %24 ], [ %38, %27 ], [ %51, %49 ], [ %60, %52 ]
  %63 = zext i1 %62 to i32
  br label %76

64:                                               ; preds = %3
  %65 = getelementptr inbounds i8, ptr %2, i32 8
  %66 = load i8, ptr %65, align 8, !tbaa !2
  %67 = and i8 %66, 15
  %68 = icmp eq i8 %67, 4
  br i1 %68, label %69, label %74

69:                                               ; preds = %64
  %70 = load ptr, ptr %1, align 8, !tbaa !6
  %71 = load ptr, ptr %2, align 8, !tbaa !6
  %72 = tail call fastcc i32 @l_strcmp(ptr noundef %70, ptr noundef %71)
  %73 = lshr i32 %72, 31
  br label %76

74:                                               ; preds = %3, %7, %64
  %75 = tail call i32 @luaT_callorderTM(ptr noundef %0, ptr noundef nonnull %1, ptr noundef %2, i32 noundef 20) #12
  br label %76

76:                                               ; preds = %74, %69, %61
  %77 = phi i32 [ %63, %61 ], [ %73, %69 ], [ %75, %74 ]
  ret i32 %77
}

; Function Attrs: nounwind
define hidden i32 @luaV_lessequal(ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds i8, ptr %1, i32 8
  %5 = load i8, ptr %4, align 8, !tbaa !2
  %6 = and i8 %5, 15
  switch i8 %6, label %75 [
    i8 3, label %7
    i8 4, label %64
  ]

7:                                                ; preds = %3
  %8 = getelementptr inbounds i8, ptr %2, i32 8
  %9 = load i8, ptr %8, align 8, !tbaa !2
  %10 = and i8 %9, 15
  %11 = icmp eq i8 %10, 3
  br i1 %11, label %12, label %75

12:                                               ; preds = %7
  %13 = icmp eq i8 %5, 3
  br i1 %13, label %14, label %36

14:                                               ; preds = %12
  %15 = load i64, ptr %1, align 8, !tbaa !6
  %16 = icmp eq i8 %9, 3
  br i1 %16, label %17, label %20

17:                                               ; preds = %14
  %18 = load i64, ptr %2, align 8, !tbaa !6
  %19 = icmp sle i64 %15, %18
  br label %61

20:                                               ; preds = %14
  %21 = load double, ptr %2, align 8, !tbaa !6
  %22 = add i64 %15, 9007199254740992
  %23 = icmp ult i64 %22, 18014398509481985
  br i1 %23, label %24, label %27

24:                                               ; preds = %20
  %25 = sitofp i64 %15 to double
  %26 = fcmp oge double %21, %25
  br label %61

27:                                               ; preds = %20
  %28 = tail call double @llvm.floor.f64(double %21)
  %29 = fcmp ult double %28, 0xC3E0000000000000
  %30 = fcmp uge double %28, 0x43E0000000000000
  %31 = or i1 %29, %30
  %32 = fptosi double %28 to i64
  %33 = icmp sle i64 %15, %32
  %34 = fcmp ogt double %21, 0.000000e+00
  %35 = select i1 %31, i1 %34, i1 %33
  br label %61

36:                                               ; preds = %12
  %37 = load double, ptr %1, align 8, !tbaa !6
  %38 = icmp eq i8 %9, 19
  br i1 %38, label %39, label %42

39:                                               ; preds = %36
  %40 = load double, ptr %2, align 8, !tbaa !6
  %41 = fcmp ole double %37, %40
  br label %61

42:                                               ; preds = %36
  %43 = load i64, ptr %2, align 8, !tbaa !6
  %44 = add i64 %43, 9007199254740992
  %45 = icmp ult i64 %44, 18014398509481985
  br i1 %45, label %46, label %49

46:                                               ; preds = %42
  %47 = sitofp i64 %43 to double
  %48 = fcmp ole double %37, %47
  br label %61

49:                                               ; preds = %42
  %50 = tail call double @llvm.floor.f64(double %37)
  %51 = fcmp une double %50, %37
  %52 = fadd double %50, 1.000000e+00
  %53 = select i1 %51, double %52, double %50
  %54 = fcmp ult double %53, 0xC3E0000000000000
  %55 = fcmp uge double %53, 0x43E0000000000000
  %56 = or i1 %54, %55
  %57 = fptosi double %53 to i64
  %58 = icmp sge i64 %43, %57
  %59 = fcmp olt double %37, 0.000000e+00
  %60 = select i1 %56, i1 %59, i1 %58
  br label %61

61:                                               ; preds = %17, %24, %27, %39, %46, %49
  %62 = phi i1 [ %19, %17 ], [ %41, %39 ], [ %26, %24 ], [ %35, %27 ], [ %48, %46 ], [ %60, %49 ]
  %63 = zext i1 %62 to i32
  br label %77

64:                                               ; preds = %3
  %65 = getelementptr inbounds i8, ptr %2, i32 8
  %66 = load i8, ptr %65, align 8, !tbaa !2
  %67 = and i8 %66, 15
  %68 = icmp eq i8 %67, 4
  br i1 %68, label %69, label %75

69:                                               ; preds = %64
  %70 = load ptr, ptr %1, align 8, !tbaa !6
  %71 = load ptr, ptr %2, align 8, !tbaa !6
  %72 = tail call fastcc i32 @l_strcmp(ptr noundef %70, ptr noundef %71)
  %73 = icmp slt i32 %72, 1
  %74 = zext i1 %73 to i32
  br label %77

75:                                               ; preds = %3, %7, %64
  %76 = tail call i32 @luaT_callorderTM(ptr noundef %0, ptr noundef nonnull %1, ptr noundef %2, i32 noundef 21) #12
  br label %77

77:                                               ; preds = %75, %69, %61
  %78 = phi i32 [ %63, %61 ], [ %74, %69 ], [ %76, %75 ]
  ret i32 %78
}

; Function Attrs: nounwind
define hidden i32 @luaV_equalobj(ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds i8, ptr %1, i32 8
  %5 = load i8, ptr %4, align 8, !tbaa !2
  %6 = zext i8 %5 to i32
  %7 = and i32 %6, 63
  %8 = getelementptr inbounds i8, ptr %2, i32 8
  %9 = load i8, ptr %8, align 8, !tbaa !2
  %10 = zext i8 %9 to i32
  %11 = and i32 %10, 63
  %12 = icmp eq i32 %7, %11
  br i1 %12, label %50, label %13

13:                                               ; preds = %3
  %14 = and i32 %6, 15
  %15 = and i32 %10, 15
  %16 = icmp eq i32 %14, 3
  %17 = icmp eq i32 %15, 3
  %18 = and i1 %16, %17
  br i1 %18, label %19, label %173

19:                                               ; preds = %13
  switch i8 %5, label %173 [
    i8 19, label %20
    i8 3, label %28
  ]

20:                                               ; preds = %19
  %21 = load double, ptr %1, align 8, !tbaa !6
  %22 = tail call double @llvm.floor.f64(double %21)
  %23 = fcmp une double %22, %21
  br i1 %23, label %173, label %24

24:                                               ; preds = %20
  %25 = fcmp oge double %22, 0xC3E0000000000000
  %26 = fcmp olt double %22, 0x43E0000000000000
  %27 = and i1 %25, %26
  br i1 %27, label %30, label %173

28:                                               ; preds = %19
  %29 = load i64, ptr %1, align 8, !tbaa !6
  br label %32

30:                                               ; preds = %24
  %31 = fptosi double %22 to i64
  br label %32

32:                                               ; preds = %30, %28
  %33 = phi i64 [ %29, %28 ], [ %31, %30 ]
  switch i8 %9, label %173 [
    i8 19, label %34
    i8 3, label %42
  ]

34:                                               ; preds = %32
  %35 = load double, ptr %2, align 8, !tbaa !6
  %36 = tail call double @llvm.floor.f64(double %35)
  %37 = fcmp une double %36, %35
  br i1 %37, label %173, label %38

38:                                               ; preds = %34
  %39 = fcmp oge double %36, 0xC3E0000000000000
  %40 = fcmp olt double %36, 0x43E0000000000000
  %41 = and i1 %39, %40
  br i1 %41, label %44, label %173

42:                                               ; preds = %32
  %43 = load i64, ptr %2, align 8, !tbaa !6
  br label %46

44:                                               ; preds = %38
  %45 = fptosi double %36 to i64
  br label %46

46:                                               ; preds = %44, %42
  %47 = phi i64 [ %43, %42 ], [ %45, %44 ]
  %48 = icmp eq i64 %33, %47
  %49 = zext i1 %48 to i32
  br label %173

50:                                               ; preds = %3
  switch i32 %7, label %148 [
    i32 0, label %173
    i32 1, label %173
    i32 17, label %173
    i32 3, label %51
    i32 19, label %56
    i32 2, label %61
    i32 22, label %66
    i32 4, label %71
    i32 20, label %76
    i32 7, label %80
    i32 5, label %114
  ]

51:                                               ; preds = %50
  %52 = load i64, ptr %1, align 8, !tbaa !6
  %53 = load i64, ptr %2, align 8, !tbaa !6
  %54 = icmp eq i64 %52, %53
  %55 = zext i1 %54 to i32
  br label %173

56:                                               ; preds = %50
  %57 = load double, ptr %1, align 8, !tbaa !6
  %58 = load double, ptr %2, align 8, !tbaa !6
  %59 = fcmp oeq double %57, %58
  %60 = zext i1 %59 to i32
  br label %173

61:                                               ; preds = %50
  %62 = load ptr, ptr %1, align 8, !tbaa !6
  %63 = load ptr, ptr %2, align 8, !tbaa !6
  %64 = icmp eq ptr %62, %63
  %65 = zext i1 %64 to i32
  br label %173

66:                                               ; preds = %50
  %67 = load ptr, ptr %1, align 8, !tbaa !6
  %68 = load ptr, ptr %2, align 8, !tbaa !6
  %69 = icmp eq ptr %67, %68
  %70 = zext i1 %69 to i32
  br label %173

71:                                               ; preds = %50
  %72 = load ptr, ptr %1, align 8, !tbaa !6
  %73 = load ptr, ptr %2, align 8, !tbaa !6
  %74 = icmp eq ptr %72, %73
  %75 = zext i1 %74 to i32
  br label %173

76:                                               ; preds = %50
  %77 = load ptr, ptr %1, align 8, !tbaa !6
  %78 = load ptr, ptr %2, align 8, !tbaa !6
  %79 = tail call i32 @luaS_eqlngstr(ptr noundef %77, ptr noundef %78) #12
  br label %173

80:                                               ; preds = %50
  %81 = load ptr, ptr %1, align 8, !tbaa !6
  %82 = load ptr, ptr %2, align 8, !tbaa !6
  %83 = icmp eq ptr %81, %82
  br i1 %83, label %173, label %84

84:                                               ; preds = %80
  %85 = icmp eq ptr %0, null
  br i1 %85, label %173, label %86

86:                                               ; preds = %84
  %87 = getelementptr inbounds i8, ptr %81, i32 12
  %88 = load ptr, ptr %87, align 4, !tbaa !6
  %89 = icmp eq ptr %88, null
  br i1 %89, label %104, label %90

90:                                               ; preds = %86
  %91 = getelementptr inbounds i8, ptr %88, i32 6
  %92 = load i8, ptr %91, align 2, !tbaa !16
  %93 = and i8 %92, 32
  %94 = icmp eq i8 %93, 0
  br i1 %94, label %95, label %104

95:                                               ; preds = %90
  %96 = getelementptr inbounds i8, ptr %0, i32 16
  %97 = load ptr, ptr %96, align 4, !tbaa !18
  %98 = getelementptr inbounds i8, ptr %97, i32 192
  %99 = load ptr, ptr %98, align 4, !tbaa !23
  %100 = tail call ptr @luaT_gettm(ptr noundef nonnull %88, i32 noundef 5, ptr noundef %99) #12
  %101 = icmp eq ptr %100, null
  br i1 %101, label %102, label %161

102:                                              ; preds = %95
  %103 = load ptr, ptr %2, align 8, !tbaa !6
  br label %104

104:                                              ; preds = %102, %90, %86
  %105 = phi ptr [ %103, %102 ], [ %82, %90 ], [ %82, %86 ]
  %106 = getelementptr inbounds i8, ptr %105, i32 12
  %107 = load ptr, ptr %106, align 4, !tbaa !6
  %108 = icmp eq ptr %107, null
  br i1 %108, label %173, label %109

109:                                              ; preds = %104
  %110 = getelementptr inbounds i8, ptr %107, i32 6
  %111 = load i8, ptr %110, align 2, !tbaa !16
  %112 = and i8 %111, 32
  %113 = icmp eq i8 %112, 0
  br i1 %113, label %153, label %173

114:                                              ; preds = %50
  %115 = load ptr, ptr %1, align 8, !tbaa !6
  %116 = load ptr, ptr %2, align 8, !tbaa !6
  %117 = icmp eq ptr %115, %116
  br i1 %117, label %173, label %118

118:                                              ; preds = %114
  %119 = icmp eq ptr %0, null
  br i1 %119, label %173, label %120

120:                                              ; preds = %118
  %121 = getelementptr inbounds i8, ptr %115, i32 24
  %122 = load ptr, ptr %121, align 8, !tbaa !6
  %123 = icmp eq ptr %122, null
  br i1 %123, label %138, label %124

124:                                              ; preds = %120
  %125 = getelementptr inbounds i8, ptr %122, i32 6
  %126 = load i8, ptr %125, align 2, !tbaa !16
  %127 = and i8 %126, 32
  %128 = icmp eq i8 %127, 0
  br i1 %128, label %129, label %138

129:                                              ; preds = %124
  %130 = getelementptr inbounds i8, ptr %0, i32 16
  %131 = load ptr, ptr %130, align 4, !tbaa !18
  %132 = getelementptr inbounds i8, ptr %131, i32 192
  %133 = load ptr, ptr %132, align 4, !tbaa !23
  %134 = tail call ptr @luaT_gettm(ptr noundef nonnull %122, i32 noundef 5, ptr noundef %133) #12
  %135 = icmp eq ptr %134, null
  br i1 %135, label %136, label %161

136:                                              ; preds = %129
  %137 = load ptr, ptr %2, align 8, !tbaa !6
  br label %138

138:                                              ; preds = %136, %124, %120
  %139 = phi ptr [ %137, %136 ], [ %116, %124 ], [ %116, %120 ]
  %140 = getelementptr inbounds i8, ptr %139, i32 24
  %141 = load ptr, ptr %140, align 8, !tbaa !6
  %142 = icmp eq ptr %141, null
  br i1 %142, label %173, label %143

143:                                              ; preds = %138
  %144 = getelementptr inbounds i8, ptr %141, i32 6
  %145 = load i8, ptr %144, align 2, !tbaa !16
  %146 = and i8 %145, 32
  %147 = icmp eq i8 %146, 0
  br i1 %147, label %153, label %173

148:                                              ; preds = %50
  %149 = load ptr, ptr %1, align 8, !tbaa !6
  %150 = load ptr, ptr %2, align 8, !tbaa !6
  %151 = icmp eq ptr %149, %150
  %152 = zext i1 %151 to i32
  br label %173

153:                                              ; preds = %143, %109
  %154 = phi ptr [ %107, %109 ], [ %141, %143 ]
  %155 = getelementptr inbounds i8, ptr %0, i32 16
  %156 = load ptr, ptr %155, align 4, !tbaa !18
  %157 = getelementptr inbounds i8, ptr %156, i32 192
  %158 = load ptr, ptr %157, align 4, !tbaa !23
  %159 = tail call ptr @luaT_gettm(ptr noundef nonnull %154, i32 noundef 5, ptr noundef %158) #12
  %160 = icmp eq ptr %159, null
  br i1 %160, label %173, label %161

161:                                              ; preds = %95, %129, %153
  %162 = phi ptr [ %159, %153 ], [ %100, %95 ], [ %134, %129 ]
  %163 = getelementptr inbounds i8, ptr %0, i32 12
  %164 = load ptr, ptr %163, align 4, !tbaa !6
  tail call void @luaT_callTMres(ptr noundef nonnull %0, ptr noundef nonnull %162, ptr noundef nonnull %1, ptr noundef nonnull %2, ptr noundef %164) #12
  %165 = load ptr, ptr %163, align 4, !tbaa !6
  %166 = getelementptr inbounds i8, ptr %165, i32 8
  %167 = load i8, ptr %166, align 8, !tbaa !6
  %168 = icmp ne i8 %167, 1
  %169 = and i8 %167, 15
  %170 = icmp ne i8 %169, 0
  %171 = and i1 %168, %170
  %172 = zext i1 %171 to i32
  br label %173

173:                                              ; preds = %143, %138, %109, %104, %34, %32, %38, %20, %19, %24, %46, %153, %118, %114, %84, %80, %50, %50, %50, %13, %161, %148, %76, %71, %66, %61, %56, %51
  %174 = phi i32 [ %152, %148 ], [ %172, %161 ], [ %79, %76 ], [ %75, %71 ], [ %70, %66 ], [ %65, %61 ], [ %60, %56 ], [ %55, %51 ], [ 0, %13 ], [ 1, %50 ], [ 1, %50 ], [ 1, %50 ], [ 1, %80 ], [ 0, %84 ], [ 1, %114 ], [ 0, %118 ], [ 0, %153 ], [ %49, %46 ], [ 0, %24 ], [ 0, %19 ], [ 0, %20 ], [ 0, %38 ], [ 0, %32 ], [ 0, %34 ], [ 0, %104 ], [ 0, %109 ], [ 0, %138 ], [ 0, %143 ]
  ret i32 %174
}

declare i32 @luaS_eqlngstr(ptr noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: nounwind
define hidden void @luaV_concat(ptr noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca [40 x i8], align 16
  %4 = icmp eq i32 %1, 1
  br i1 %4, label %162, label %5

5:                                                ; preds = %2
  %6 = getelementptr inbounds i8, ptr %0, i32 12
  %7 = load ptr, ptr %6, align 4, !tbaa !6
  br label %8

8:                                                ; preds = %5, %154
  %9 = phi ptr [ %160, %154 ], [ %7, %5 ]
  %10 = phi i32 [ %157, %154 ], [ %1, %5 ]
  %11 = getelementptr inbounds i8, ptr %9, i32 -32
  %12 = getelementptr inbounds i8, ptr %9, i32 -24
  %13 = load i8, ptr %12, align 8, !tbaa !6
  %14 = and i8 %13, 15
  %15 = add nsw i8 %14, -3
  %16 = icmp ult i8 %15, 2
  br i1 %16, label %17, label %24

17:                                               ; preds = %8
  %18 = getelementptr inbounds i8, ptr %9, i32 -16
  %19 = getelementptr inbounds i8, ptr %9, i32 -8
  %20 = load i8, ptr %19, align 8, !tbaa !6
  %21 = and i8 %20, 15
  switch i8 %21, label %24 [
    i8 4, label %25
    i8 3, label %22
  ]

22:                                               ; preds = %17
  call void @luaO_tostring(ptr noundef nonnull %0, ptr noundef nonnull %18) #12
  %23 = load i8, ptr %19, align 8, !tbaa !6
  br label %25

24:                                               ; preds = %8, %17
  call void @luaT_tryconcatTM(ptr noundef nonnull %0) #12
  br label %154

25:                                               ; preds = %17, %22
  %26 = phi i8 [ %20, %17 ], [ %23, %22 ]
  %27 = icmp eq i8 %26, 68
  br i1 %27, label %30, label %28

28:                                               ; preds = %25
  %29 = load i8, ptr %12, align 8, !tbaa !6
  br label %40

30:                                               ; preds = %25
  %31 = load ptr, ptr %18, align 8, !tbaa !6
  %32 = getelementptr inbounds i8, ptr %31, i32 7
  %33 = load i8, ptr %32, align 1, !tbaa !6
  %34 = icmp eq i8 %33, 0
  %35 = load i8, ptr %12, align 8, !tbaa !6
  br i1 %34, label %36, label %40

36:                                               ; preds = %30
  %37 = and i8 %35, 15
  %38 = icmp eq i8 %37, 3
  br i1 %38, label %39, label %154

39:                                               ; preds = %36
  call void @luaO_tostring(ptr noundef nonnull %0, ptr noundef nonnull %11) #12
  br label %154

40:                                               ; preds = %28, %30
  %41 = phi i8 [ %29, %28 ], [ %35, %30 ]
  %42 = icmp eq i8 %41, 68
  br i1 %42, label %43, label %50

43:                                               ; preds = %40
  %44 = load ptr, ptr %11, align 8, !tbaa !6
  %45 = getelementptr inbounds i8, ptr %44, i32 7
  %46 = load i8, ptr %45, align 1, !tbaa !6
  %47 = icmp eq i8 %46, 0
  br i1 %47, label %48, label %50

48:                                               ; preds = %43
  %49 = load i64, ptr %18, align 8, !tbaa !6
  store i64 %49, ptr %11, align 8, !tbaa !6
  store i8 %26, ptr %12, align 8, !tbaa !2
  br label %154

50:                                               ; preds = %43, %40
  %51 = load ptr, ptr %18, align 8, !tbaa !6
  %52 = getelementptr inbounds i8, ptr %51, i32 7
  %53 = load i8, ptr %52, align 1, !tbaa !6
  %54 = icmp eq i8 %53, -1
  br i1 %54, label %57, label %55

55:                                               ; preds = %50
  %56 = zext i8 %53 to i32
  br label %60

57:                                               ; preds = %50
  %58 = getelementptr inbounds i8, ptr %51, i32 12
  %59 = load i32, ptr %58, align 4, !tbaa !6
  br label %60

60:                                               ; preds = %57, %55
  %61 = phi i32 [ %56, %55 ], [ %59, %57 ]
  %62 = icmp sgt i32 %10, 1
  br i1 %62, label %63, label %94

63:                                               ; preds = %60, %90
  %64 = phi i32 [ %92, %90 ], [ 1, %60 ]
  %65 = phi i32 [ %91, %90 ], [ %61, %60 ]
  %66 = sub nsw i32 0, %64
  %67 = getelementptr inbounds %union.StackValue, ptr %9, i32 %66
  %68 = getelementptr inbounds i8, ptr %67, i32 -16
  %69 = getelementptr inbounds i8, ptr %67, i32 -8
  %70 = load i8, ptr %69, align 8, !tbaa !6
  %71 = and i8 %70, 15
  switch i8 %71, label %94 [
    i8 4, label %73
    i8 3, label %72
  ]

72:                                               ; preds = %63
  call void @luaO_tostring(ptr noundef %0, ptr noundef nonnull %68) #12
  br label %73

73:                                               ; preds = %63, %72
  %74 = load ptr, ptr %68, align 8, !tbaa !6
  %75 = getelementptr inbounds i8, ptr %74, i32 7
  %76 = load i8, ptr %75, align 1, !tbaa !6
  %77 = icmp eq i8 %76, -1
  br i1 %77, label %80, label %78

78:                                               ; preds = %73
  %79 = zext i8 %76 to i32
  br label %83

80:                                               ; preds = %73
  %81 = getelementptr inbounds i8, ptr %74, i32 12
  %82 = load i32, ptr %81, align 4, !tbaa !6
  br label %83

83:                                               ; preds = %80, %78
  %84 = phi i32 [ %79, %78 ], [ %82, %80 ]
  %85 = sub i32 -21, %65
  %86 = icmp ult i32 %84, %85
  br i1 %86, label %90, label %87, !prof !27

87:                                               ; preds = %83
  %88 = sub nsw i32 0, %10
  %89 = getelementptr inbounds %union.StackValue, ptr %9, i32 %88
  store ptr %89, ptr %6, align 4, !tbaa !6
  call void (ptr, ptr, ...) @luaG_runerror(ptr noundef %0, ptr noundef nonnull @.str.3) #13
  unreachable

90:                                               ; preds = %83
  %91 = add i32 %84, %65
  %92 = add nuw nsw i32 %64, 1
  %93 = icmp eq i32 %92, %10
  br i1 %93, label %94, label %63

94:                                               ; preds = %90, %63, %60
  %95 = phi i32 [ %61, %60 ], [ %65, %63 ], [ %91, %90 ]
  %96 = phi i32 [ 1, %60 ], [ %64, %63 ], [ %10, %90 ]
  %97 = icmp ult i32 %95, 41
  br i1 %97, label %98, label %122

98:                                               ; preds = %94
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %3) #12
  br label %99

99:                                               ; preds = %113, %98
  %100 = phi i32 [ 0, %98 ], [ %117, %113 ]
  %101 = phi i32 [ %96, %98 ], [ %118, %113 ]
  %102 = sub i32 0, %101
  %103 = getelementptr inbounds %union.StackValue, ptr %9, i32 %102
  %104 = load ptr, ptr %103, align 8, !tbaa !6
  %105 = getelementptr inbounds i8, ptr %104, i32 7
  %106 = load i8, ptr %105, align 1, !tbaa !7
  %107 = icmp eq i8 %106, -1
  br i1 %107, label %110, label %108

108:                                              ; preds = %99
  %109 = zext i8 %106 to i32
  br label %113

110:                                              ; preds = %99
  %111 = getelementptr inbounds i8, ptr %104, i32 12
  %112 = load i32, ptr %111, align 4, !tbaa !6
  br label %113

113:                                              ; preds = %110, %108
  %114 = phi i32 [ %109, %108 ], [ %112, %110 ]
  %115 = getelementptr inbounds i8, ptr %3, i32 %100
  %116 = getelementptr inbounds i8, ptr %104, i32 16
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %115, ptr nonnull align 4 %116, i32 %114, i1 false)
  %117 = add i32 %114, %100
  %118 = add nsw i32 %101, -1
  %119 = icmp sgt i32 %101, 1
  br i1 %119, label %99, label %120

120:                                              ; preds = %113
  %121 = call ptr @luaS_newlstr(ptr noundef %0, ptr noundef nonnull %3, i32 noundef %95) #12
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %3) #12
  br label %146

122:                                              ; preds = %94
  %123 = call ptr @luaS_createlngstrobj(ptr noundef %0, i32 noundef %95) #12
  %124 = getelementptr inbounds i8, ptr %123, i32 16
  br label %125

125:                                              ; preds = %139, %122
  %126 = phi i32 [ 0, %122 ], [ %143, %139 ]
  %127 = phi i32 [ %96, %122 ], [ %144, %139 ]
  %128 = sub i32 0, %127
  %129 = getelementptr inbounds %union.StackValue, ptr %9, i32 %128
  %130 = load ptr, ptr %129, align 8, !tbaa !6
  %131 = getelementptr inbounds i8, ptr %130, i32 7
  %132 = load i8, ptr %131, align 1, !tbaa !7
  %133 = icmp eq i8 %132, -1
  br i1 %133, label %136, label %134

134:                                              ; preds = %125
  %135 = zext i8 %132 to i32
  br label %139

136:                                              ; preds = %125
  %137 = getelementptr inbounds i8, ptr %130, i32 12
  %138 = load i32, ptr %137, align 4, !tbaa !6
  br label %139

139:                                              ; preds = %136, %134
  %140 = phi i32 [ %135, %134 ], [ %138, %136 ]
  %141 = getelementptr inbounds i8, ptr %124, i32 %126
  %142 = getelementptr inbounds i8, ptr %130, i32 16
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %141, ptr nonnull align 4 %142, i32 %140, i1 false)
  %143 = add i32 %140, %126
  %144 = add nsw i32 %127, -1
  %145 = icmp sgt i32 %127, 1
  br i1 %145, label %125, label %146

146:                                              ; preds = %139, %120
  %147 = phi ptr [ %121, %120 ], [ %123, %139 ]
  %148 = sub nsw i32 0, %96
  %149 = getelementptr inbounds %union.StackValue, ptr %9, i32 %148
  store ptr %147, ptr %149, align 8, !tbaa !6
  %150 = getelementptr inbounds i8, ptr %147, i32 4
  %151 = load i8, ptr %150, align 4, !tbaa !28
  %152 = or i8 %151, 64
  %153 = getelementptr inbounds i8, ptr %149, i32 8
  store i8 %152, ptr %153, align 8, !tbaa !2
  br label %154

154:                                              ; preds = %36, %39, %146, %48, %24
  %155 = phi i32 [ 2, %48 ], [ %96, %146 ], [ 2, %24 ], [ 2, %36 ], [ 2, %39 ]
  %156 = add i32 %10, 1
  %157 = sub i32 %156, %155
  %158 = load ptr, ptr %6, align 4, !tbaa !6
  %159 = sub nsw i32 1, %155
  %160 = getelementptr inbounds %union.StackValue, ptr %158, i32 %159
  store ptr %160, ptr %6, align 4, !tbaa !6
  %161 = icmp sgt i32 %157, 1
  br i1 %161, label %8, label %162

162:                                              ; preds = %154, %2
  ret void
}

declare void @luaO_tostring(ptr noundef, ptr noundef) local_unnamed_addr #5

declare void @luaT_tryconcatTM(ptr noundef) local_unnamed_addr #5

declare ptr @luaS_newlstr(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

declare ptr @luaS_createlngstrobj(ptr noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: nounwind
define hidden void @luaV_objlen(ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds i8, ptr %2, i32 8
  %5 = load i8, ptr %4, align 8, !tbaa !2
  %6 = and i8 %5, 63
  switch i8 %6, label %39 [
    i8 5, label %7
    i8 4, label %27
    i8 20, label %33
  ]

7:                                                ; preds = %3
  %8 = load ptr, ptr %2, align 8, !tbaa !6
  %9 = getelementptr inbounds i8, ptr %8, i32 24
  %10 = load ptr, ptr %9, align 4, !tbaa !24
  %11 = icmp eq ptr %10, null
  br i1 %11, label %24, label %12

12:                                               ; preds = %7
  %13 = getelementptr inbounds i8, ptr %10, i32 6
  %14 = load i8, ptr %13, align 2, !tbaa !16
  %15 = and i8 %14, 16
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %17, label %24

17:                                               ; preds = %12
  %18 = getelementptr inbounds i8, ptr %0, i32 16
  %19 = load ptr, ptr %18, align 4, !tbaa !18
  %20 = getelementptr inbounds i8, ptr %19, i32 188
  %21 = load ptr, ptr %20, align 4, !tbaa !23
  %22 = tail call ptr @luaT_gettm(ptr noundef nonnull %10, i32 noundef 4, ptr noundef %21) #12
  %23 = icmp eq ptr %22, null
  br i1 %23, label %24, label %46

24:                                               ; preds = %12, %7, %17
  %25 = tail call i64 @luaH_getn(ptr noundef nonnull %8) #12
  store i64 %25, ptr %1, align 8, !tbaa !6
  %26 = getelementptr inbounds i8, ptr %1, i32 8
  store i8 3, ptr %26, align 8, !tbaa !2
  br label %48

27:                                               ; preds = %3
  %28 = load ptr, ptr %2, align 8, !tbaa !6
  %29 = getelementptr inbounds i8, ptr %28, i32 7
  %30 = load i8, ptr %29, align 1, !tbaa !6
  %31 = zext i8 %30 to i64
  store i64 %31, ptr %1, align 8, !tbaa !6
  %32 = getelementptr inbounds i8, ptr %1, i32 8
  store i8 3, ptr %32, align 8, !tbaa !2
  br label %48

33:                                               ; preds = %3
  %34 = load ptr, ptr %2, align 8, !tbaa !6
  %35 = getelementptr inbounds i8, ptr %34, i32 12
  %36 = load i32, ptr %35, align 4, !tbaa !6
  %37 = zext i32 %36 to i64
  store i64 %37, ptr %1, align 8, !tbaa !6
  %38 = getelementptr inbounds i8, ptr %1, i32 8
  store i8 3, ptr %38, align 8, !tbaa !2
  br label %48

39:                                               ; preds = %3
  %40 = tail call ptr @luaT_gettmbyobj(ptr noundef %0, ptr noundef nonnull %2, i32 noundef 4) #12
  %41 = getelementptr inbounds i8, ptr %40, i32 8
  %42 = load i8, ptr %41, align 8, !tbaa !2
  %43 = and i8 %42, 15
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %45, label %46, !prof !15

45:                                               ; preds = %39
  tail call void @luaG_typeerror(ptr noundef %0, ptr noundef nonnull %2, ptr noundef nonnull @.str.4) #13
  unreachable

46:                                               ; preds = %17, %39
  %47 = phi ptr [ %40, %39 ], [ %22, %17 ]
  tail call void @luaT_callTMres(ptr noundef %0, ptr noundef nonnull %47, ptr noundef nonnull %2, ptr noundef nonnull %2, ptr noundef %1) #12
  br label %48

48:                                               ; preds = %24, %46, %33, %27
  ret void
}

declare i64 @luaH_getn(ptr noundef) local_unnamed_addr #5

; Function Attrs: nounwind
define hidden i64 @luaV_idiv(ptr noundef %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = add i64 %2, 1
  %5 = icmp ult i64 %4, 2
  br i1 %5, label %6, label %11, !prof !15

6:                                                ; preds = %3
  %7 = icmp eq i64 %2, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %6
  tail call void (ptr, ptr, ...) @luaG_runerror(ptr noundef %0, ptr noundef nonnull @.str.5) #13
  unreachable

9:                                                ; preds = %6
  %10 = sub i64 0, %1
  br label %21

11:                                               ; preds = %3
  %12 = sdiv i64 %1, %2
  %13 = xor i64 %2, %1
  %14 = icmp slt i64 %13, 0
  br i1 %14, label %15, label %21

15:                                               ; preds = %11
  %16 = mul i64 %12, %2
  %17 = sub i64 %1, %16
  %18 = icmp ne i64 %17, 0
  %19 = sext i1 %18 to i64
  %20 = add nsw i64 %12, %19
  br label %21

21:                                               ; preds = %15, %11, %9
  %22 = phi i64 [ %10, %9 ], [ %12, %11 ], [ %20, %15 ]
  ret i64 %22
}

; Function Attrs: nounwind
define hidden i64 @luaV_mod(ptr noundef %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = add i64 %2, 1
  %5 = icmp ult i64 %4, 2
  br i1 %5, label %6, label %9, !prof !15

6:                                                ; preds = %3
  %7 = icmp eq i64 %2, 0
  br i1 %7, label %8, label %17

8:                                                ; preds = %6
  tail call void (ptr, ptr, ...) @luaG_runerror(ptr noundef %0, ptr noundef nonnull @.str.6) #13
  unreachable

9:                                                ; preds = %3
  %10 = srem i64 %1, %2
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %17, label %12

12:                                               ; preds = %9
  %13 = xor i64 %10, %2
  %14 = icmp slt i64 %13, 0
  %15 = select i1 %14, i64 %2, i64 0
  %16 = add nsw i64 %15, %10
  br label %17

17:                                               ; preds = %12, %9, %6
  %18 = phi i64 [ 0, %6 ], [ 0, %9 ], [ %16, %12 ]
  ret i64 %18
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef double @luaV_modf(ptr nocapture noundef readnone %0, double noundef %1, double noundef %2) local_unnamed_addr #8 {
  %4 = frem double %1, %2
  %5 = fcmp ogt double %4, 0.000000e+00
  br i1 %5, label %6, label %8

6:                                                ; preds = %3
  %7 = fcmp olt double %2, 0.000000e+00
  br i1 %7, label %12, label %14

8:                                                ; preds = %3
  %9 = fcmp olt double %4, 0.000000e+00
  %10 = fcmp ogt double %2, 0.000000e+00
  %11 = and i1 %10, %9
  br i1 %11, label %12, label %14

12:                                               ; preds = %8, %6
  %13 = fadd double %4, %2
  br label %14

14:                                               ; preds = %12, %8, %6
  %15 = phi double [ %13, %12 ], [ %4, %6 ], [ %4, %8 ]
  ret double %15
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden i64 @luaV_shiftl(i64 noundef %0, i64 noundef %1) local_unnamed_addr #8 {
  %3 = icmp slt i64 %1, 0
  br i1 %3, label %4, label %9

4:                                                ; preds = %2
  %5 = icmp ult i64 %1, -63
  br i1 %5, label %13, label %6

6:                                                ; preds = %4
  %7 = sub nsw i64 0, %1
  %8 = lshr i64 %0, %7
  br label %13

9:                                                ; preds = %2
  %10 = icmp ugt i64 %1, 63
  %11 = shl i64 %0, %1
  %12 = select i1 %10, i64 0, i64 %11
  br label %13

13:                                               ; preds = %9, %4, %6
  %14 = phi i64 [ %8, %6 ], [ 0, %4 ], [ %12, %9 ]
  ret i64 %14
}

; Function Attrs: nounwind
define hidden void @luaV_finishOp(ptr noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds i8, ptr %0, i32 20
  %3 = load ptr, ptr %2, align 4, !tbaa !29
  %4 = load ptr, ptr %3, align 4, !tbaa !6
  %5 = getelementptr inbounds i8, ptr %4, i32 16
  %6 = getelementptr inbounds i8, ptr %3, i32 16
  %7 = load ptr, ptr %6, align 4, !tbaa !6
  %8 = getelementptr inbounds i8, ptr %7, i32 -4
  %9 = load i32, ptr %8, align 4, !tbaa !30
  %10 = and i32 %9, 127
  switch i32 %10, label %79 [
    i32 46, label %11
    i32 47, label %11
    i32 48, label %11
    i32 49, label %24
    i32 50, label %24
    i32 52, label %24
    i32 11, label %24
    i32 12, label %24
    i32 13, label %24
    i32 14, label %24
    i32 20, label %24
    i32 58, label %35
    i32 59, label %35
    i32 62, label %35
    i32 63, label %35
    i32 64, label %35
    i32 65, label %35
    i32 57, label %35
    i32 53, label %51
    i32 54, label %68
    i32 70, label %69
  ]

11:                                               ; preds = %1, %1, %1
  %12 = getelementptr inbounds i8, ptr %7, i32 -8
  %13 = load i32, ptr %12, align 4, !tbaa !30
  %14 = lshr i32 %13, 7
  %15 = and i32 %14, 255
  %16 = getelementptr inbounds %union.StackValue, ptr %5, i32 %15
  %17 = getelementptr inbounds i8, ptr %0, i32 12
  %18 = load ptr, ptr %17, align 4, !tbaa !6
  %19 = getelementptr inbounds i8, ptr %18, i32 -16
  store ptr %19, ptr %17, align 4, !tbaa !6
  %20 = load i64, ptr %19, align 8, !tbaa !6
  store i64 %20, ptr %16, align 8, !tbaa !6
  %21 = getelementptr inbounds i8, ptr %18, i32 -8
  %22 = load i8, ptr %21, align 8, !tbaa !2
  %23 = getelementptr inbounds i8, ptr %16, i32 8
  store i8 %22, ptr %23, align 8, !tbaa !2
  br label %79

24:                                               ; preds = %1, %1, %1, %1, %1, %1, %1, %1
  %25 = lshr i32 %9, 7
  %26 = and i32 %25, 255
  %27 = getelementptr inbounds %union.StackValue, ptr %5, i32 %26
  %28 = getelementptr inbounds i8, ptr %0, i32 12
  %29 = load ptr, ptr %28, align 4, !tbaa !6
  %30 = getelementptr inbounds i8, ptr %29, i32 -16
  store ptr %30, ptr %28, align 4, !tbaa !6
  %31 = load i64, ptr %30, align 8, !tbaa !6
  store i64 %31, ptr %27, align 8, !tbaa !6
  %32 = getelementptr inbounds i8, ptr %29, i32 -8
  %33 = load i8, ptr %32, align 8, !tbaa !2
  %34 = getelementptr inbounds i8, ptr %27, i32 8
  store i8 %33, ptr %34, align 8, !tbaa !2
  br label %79

35:                                               ; preds = %1, %1, %1, %1, %1, %1, %1
  %36 = getelementptr inbounds i8, ptr %0, i32 12
  %37 = load ptr, ptr %36, align 4, !tbaa !6
  %38 = getelementptr inbounds i8, ptr %37, i32 -8
  %39 = load i8, ptr %38, align 8, !tbaa !6
  %40 = icmp ne i8 %39, 1
  %41 = and i8 %39, 15
  %42 = icmp ne i8 %41, 0
  %43 = and i1 %40, %42
  %44 = getelementptr inbounds i8, ptr %37, i32 -16
  store ptr %44, ptr %36, align 4, !tbaa !6
  %45 = and i32 %9, 32768
  %46 = icmp eq i32 %45, 0
  %47 = xor i1 %46, %43
  br i1 %47, label %79, label %48

48:                                               ; preds = %35
  %49 = load ptr, ptr %6, align 4, !tbaa !6
  %50 = getelementptr inbounds i8, ptr %49, i32 4
  store ptr %50, ptr %6, align 4, !tbaa !6
  br label %79

51:                                               ; preds = %1
  %52 = getelementptr inbounds i8, ptr %0, i32 12
  %53 = load ptr, ptr %52, align 4, !tbaa !6
  %54 = getelementptr inbounds i8, ptr %53, i32 -16
  %55 = lshr i32 %9, 7
  %56 = and i32 %55, 255
  %57 = getelementptr inbounds i8, ptr %53, i32 -32
  %58 = getelementptr inbounds %union.StackValue, ptr %5, i32 %56
  %59 = ptrtoint ptr %57 to i32
  %60 = ptrtoint ptr %58 to i32
  %61 = sub i32 %59, %60
  %62 = ashr exact i32 %61, 4
  %63 = getelementptr inbounds i8, ptr %53, i32 -48
  %64 = load i64, ptr %54, align 8, !tbaa !6
  store i64 %64, ptr %63, align 8, !tbaa !6
  %65 = getelementptr inbounds i8, ptr %53, i32 -8
  %66 = load i8, ptr %65, align 8, !tbaa !2
  %67 = getelementptr inbounds i8, ptr %53, i32 -40
  store i8 %66, ptr %67, align 8, !tbaa !2
  store ptr %57, ptr %52, align 4, !tbaa !6
  tail call void @luaV_concat(ptr noundef nonnull %0, i32 noundef %62)
  br label %79

68:                                               ; preds = %1
  store ptr %8, ptr %6, align 4, !tbaa !6
  br label %79

69:                                               ; preds = %1
  %70 = lshr i32 %9, 7
  %71 = and i32 %70, 255
  %72 = getelementptr inbounds %union.StackValue, ptr %5, i32 %71
  %73 = getelementptr inbounds i8, ptr %3, i32 28
  %74 = load i32, ptr %73, align 4, !tbaa !6
  %75 = getelementptr inbounds %union.StackValue, ptr %72, i32 %74
  %76 = getelementptr inbounds i8, ptr %0, i32 12
  store ptr %75, ptr %76, align 4, !tbaa !6
  %77 = load ptr, ptr %6, align 4, !tbaa !6
  %78 = getelementptr inbounds i8, ptr %77, i32 -4
  store ptr %78, ptr %6, align 4, !tbaa !6
  br label %79

79:                                               ; preds = %35, %48, %1, %69, %68, %51, %24, %11
  ret void
}

; Function Attrs: nounwind
define hidden void @luaV_execute(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.TValue, align 8
  %4 = alloca %struct.TValue, align 8
  %5 = alloca %struct.TValue, align 8
  %6 = alloca %struct.TValue, align 8
  %7 = alloca %struct.TValue, align 8
  %8 = alloca %struct.TValue, align 8
  %9 = alloca %struct.TValue, align 8
  %10 = getelementptr inbounds i8, ptr %0, i32 112
  %11 = getelementptr inbounds i8, ptr %0, i32 100
  %12 = getelementptr inbounds i8, ptr %0, i32 12
  %13 = getelementptr inbounds i8, ptr %0, i32 16
  %14 = getelementptr inbounds i8, ptr %5, i32 8
  %15 = getelementptr inbounds i8, ptr %4, i32 8
  %16 = getelementptr inbounds i8, ptr %3, i32 8
  %17 = getelementptr inbounds i8, ptr %7, i32 8
  %18 = getelementptr inbounds i8, ptr %6, i32 8
  %19 = getelementptr inbounds i8, ptr %9, i32 8
  %20 = getelementptr inbounds i8, ptr %8, i32 8
  %21 = getelementptr inbounds i8, ptr %0, i32 20
  br label %24

22:                                               ; preds = %3124, %3082
  %23 = phi ptr [ %3083, %3082 ], [ %29, %3124 ]
  br label %24

24:                                               ; preds = %22, %2
  %25 = phi ptr [ %1, %2 ], [ %23, %22 ]
  %26 = load volatile i32, ptr %10, align 4, !tbaa !31
  br label %27

27:                                               ; preds = %3252, %24
  %28 = phi i32 [ %26, %24 ], [ %3237, %3252 ]
  %29 = phi ptr [ %25, %24 ], [ %3254, %3252 ]
  %30 = load ptr, ptr %29, align 4, !tbaa !6
  %31 = load ptr, ptr %30, align 8, !tbaa !6
  %32 = getelementptr inbounds i8, ptr %31, i32 12
  %33 = load ptr, ptr %32, align 4, !tbaa !32
  %34 = getelementptr inbounds i8, ptr %33, i32 48
  %35 = load ptr, ptr %34, align 4, !tbaa !34
  %36 = getelementptr inbounds i8, ptr %29, i32 16
  %37 = load ptr, ptr %36, align 4, !tbaa !6
  %38 = icmp eq i32 %28, 0
  br i1 %38, label %44, label %39, !prof !27

39:                                               ; preds = %27
  %40 = call i32 @luaG_tracecall(ptr noundef nonnull %0) #12
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %44, label %42, !prof !36

42:                                               ; preds = %39
  %43 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef %37) #12
  br label %44

44:                                               ; preds = %27, %42, %39
  %45 = phi i32 [ %43, %42 ], [ 0, %39 ], [ 0, %27 ]
  %46 = load ptr, ptr %29, align 4, !tbaa !6
  %47 = getelementptr inbounds i8, ptr %46, i32 16
  %48 = getelementptr inbounds i8, ptr %37, i32 4
  %49 = getelementptr inbounds i8, ptr %29, i32 20
  %50 = getelementptr inbounds i8, ptr %29, i32 4
  %51 = getelementptr inbounds i8, ptr %31, i32 16
  br label %3243

52:                                               ; preds = %3243
  %53 = lshr i32 %3248, 7
  %54 = and i32 %53, 255
  %55 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %54
  %56 = lshr i32 %3248, 16
  %57 = and i32 %56, 255
  %58 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %57
  %59 = load i64, ptr %58, align 8, !tbaa !6
  store i64 %59, ptr %55, align 8, !tbaa !6
  %60 = getelementptr inbounds i8, ptr %58, i32 8
  %61 = load i8, ptr %60, align 8, !tbaa !2
  %62 = getelementptr inbounds i8, ptr %55, i32 8
  store i8 %61, ptr %62, align 8, !tbaa !2
  %63 = icmp eq i32 %3245, 0
  br i1 %63, label %68, label %64, !prof !27

64:                                               ; preds = %52
  %65 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %66 = load ptr, ptr %29, align 4, !tbaa !6
  %67 = getelementptr inbounds i8, ptr %66, i32 16
  br label %68

68:                                               ; preds = %64, %52
  %69 = phi i32 [ %65, %64 ], [ 0, %52 ]
  %70 = phi ptr [ %67, %64 ], [ %3247, %52 ]
  %71 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

72:                                               ; preds = %68, %90, %107, %126, %147, %160, %174, %187, %210, %233, %271, %313, %382, %433, %472, %533, %621, %691, %749, %794, %841, %876, %929, %982, %1035, %1113, %1157, %1198, %1273, %1313, %1353, %1393, %1444, %1495, %1548, %1601, %1654, %1732, %1776, %1817, %1892, %1947, %2002, %2057, %2123, %2189, %2213, %2240, %2266, %2297, %2336, %2358, %2376, %2401, %2417, %2431, %2445, %2478, %2599, %2721, %2752, %2797, %2847, %2897, %2947, %2997, %3029, %3067, %3092, %3300, %3578, %3637, %3715, %3786, %3803, %3815, %3826
  %73 = phi ptr [ %3246, %68 ], [ %3246, %90 ], [ %3246, %107 ], [ %3246, %126 ], [ %137, %147 ], [ %3246, %160 ], [ %168, %174 ], [ %3246, %187 ], [ %3246, %210 ], [ %3246, %233 ], [ %3246, %271 ], [ %3246, %313 ], [ %3246, %382 ], [ %3246, %433 ], [ %3246, %472 ], [ %3246, %533 ], [ %3246, %621 ], [ %3246, %691 ], [ %3246, %749 ], [ %773, %794 ], [ %3246, %841 ], [ %870, %876 ], [ %923, %929 ], [ %976, %982 ], [ %1029, %1035 ], [ %1107, %1113 ], [ %1151, %1157 ], [ %1192, %1198 ], [ %1267, %1273 ], [ %1307, %1313 ], [ %1347, %1353 ], [ %1387, %1393 ], [ %1438, %1444 ], [ %1489, %1495 ], [ %1542, %1548 ], [ %1595, %1601 ], [ %1648, %1654 ], [ %1726, %1732 ], [ %1770, %1776 ], [ %1811, %1817 ], [ %1886, %1892 ], [ %1941, %1947 ], [ %1996, %2002 ], [ %2051, %2057 ], [ %2117, %2123 ], [ %2183, %2189 ], [ %3246, %2213 ], [ %3246, %2240 ], [ %3246, %2266 ], [ %3246, %2297 ], [ %3246, %2336 ], [ %3246, %2358 ], [ %3246, %2376 ], [ %3246, %2401 ], [ %3246, %2417 ], [ %3246, %2431 ], [ %2438, %2445 ], [ %2472, %2478 ], [ %2593, %2599 ], [ %2715, %2721 ], [ %2746, %2752 ], [ %2791, %2797 ], [ %2841, %2847 ], [ %2891, %2897 ], [ %2941, %2947 ], [ %2991, %2997 ], [ %3023, %3029 ], [ %3061, %3067 ], [ %3246, %3092 ], [ %3293, %3300 ], [ %3572, %3578 ], [ %3631, %3637 ], [ %3672, %3715 ], [ %3246, %3786 ], [ %3246, %3803 ], [ %3246, %3815 ], [ %3246, %3826 ]
  %74 = phi i32 [ %69, %68 ], [ %91, %90 ], [ %108, %107 ], [ %127, %126 ], [ %148, %147 ], [ %161, %160 ], [ %175, %174 ], [ %188, %187 ], [ %211, %210 ], [ %234, %233 ], [ %272, %271 ], [ %314, %313 ], [ %383, %382 ], [ %434, %433 ], [ %473, %472 ], [ %534, %533 ], [ %622, %621 ], [ %692, %691 ], [ %750, %749 ], [ %795, %794 ], [ %842, %841 ], [ %877, %876 ], [ %930, %929 ], [ %983, %982 ], [ %1036, %1035 ], [ %1114, %1113 ], [ %1158, %1157 ], [ %1199, %1198 ], [ %1274, %1273 ], [ %1314, %1313 ], [ %1354, %1353 ], [ %1394, %1393 ], [ %1445, %1444 ], [ %1496, %1495 ], [ %1549, %1548 ], [ %1602, %1601 ], [ %1655, %1654 ], [ %1733, %1732 ], [ %1777, %1776 ], [ %1818, %1817 ], [ %1893, %1892 ], [ %1948, %1947 ], [ %2003, %2002 ], [ %2058, %2057 ], [ %2124, %2123 ], [ %2190, %2189 ], [ %2214, %2213 ], [ %2241, %2240 ], [ %2267, %2266 ], [ %2298, %2297 ], [ %2337, %2336 ], [ %2359, %2358 ], [ %2377, %2376 ], [ %2402, %2401 ], [ %2418, %2417 ], [ %2432, %2431 ], [ %2446, %2445 ], [ %2479, %2478 ], [ %2600, %2599 ], [ %2722, %2721 ], [ %2753, %2752 ], [ %2798, %2797 ], [ %2848, %2847 ], [ %2898, %2897 ], [ %2948, %2947 ], [ %2998, %2997 ], [ %3030, %3029 ], [ %3068, %3067 ], [ %3093, %3092 ], [ %3301, %3300 ], [ %3579, %3578 ], [ %3638, %3637 ], [ %3716, %3715 ], [ %3787, %3786 ], [ %3804, %3803 ], [ %3816, %3815 ], [ %3827, %3826 ]
  %75 = phi ptr [ %71, %68 ], [ %93, %90 ], [ %110, %107 ], [ %129, %126 ], [ %150, %147 ], [ %163, %160 ], [ %177, %174 ], [ %190, %187 ], [ %213, %210 ], [ %236, %233 ], [ %274, %271 ], [ %316, %313 ], [ %385, %382 ], [ %436, %433 ], [ %475, %472 ], [ %536, %533 ], [ %624, %621 ], [ %694, %691 ], [ %752, %749 ], [ %797, %794 ], [ %844, %841 ], [ %879, %876 ], [ %932, %929 ], [ %985, %982 ], [ %1038, %1035 ], [ %1116, %1113 ], [ %1160, %1157 ], [ %1201, %1198 ], [ %1276, %1273 ], [ %1316, %1313 ], [ %1356, %1353 ], [ %1396, %1393 ], [ %1447, %1444 ], [ %1498, %1495 ], [ %1551, %1548 ], [ %1604, %1601 ], [ %1657, %1654 ], [ %1735, %1732 ], [ %1779, %1776 ], [ %1820, %1817 ], [ %1895, %1892 ], [ %1950, %1947 ], [ %2005, %2002 ], [ %2060, %2057 ], [ %2126, %2123 ], [ %2192, %2189 ], [ %2216, %2213 ], [ %2243, %2240 ], [ %2269, %2266 ], [ %2300, %2297 ], [ %2339, %2336 ], [ %2361, %2358 ], [ %2379, %2376 ], [ %2404, %2401 ], [ %2420, %2417 ], [ %2434, %2431 ], [ %2448, %2445 ], [ %2481, %2478 ], [ %2602, %2599 ], [ %2724, %2721 ], [ %2755, %2752 ], [ %2800, %2797 ], [ %2850, %2847 ], [ %2900, %2897 ], [ %2950, %2947 ], [ %3000, %2997 ], [ %3032, %3029 ], [ %3070, %3067 ], [ %3095, %3092 ], [ %3303, %3300 ], [ %3581, %3578 ], [ %3640, %3637 ], [ %3718, %3715 ], [ %3789, %3786 ], [ %3806, %3803 ], [ %3819, %3815 ], [ %3829, %3826 ]
  %76 = phi ptr [ %70, %68 ], [ %92, %90 ], [ %109, %107 ], [ %128, %126 ], [ %149, %147 ], [ %162, %160 ], [ %176, %174 ], [ %189, %187 ], [ %212, %210 ], [ %235, %233 ], [ %273, %271 ], [ %315, %313 ], [ %384, %382 ], [ %435, %433 ], [ %474, %472 ], [ %535, %533 ], [ %623, %621 ], [ %693, %691 ], [ %751, %749 ], [ %796, %794 ], [ %843, %841 ], [ %878, %876 ], [ %931, %929 ], [ %984, %982 ], [ %1037, %1035 ], [ %1115, %1113 ], [ %1159, %1157 ], [ %1200, %1198 ], [ %1275, %1273 ], [ %1315, %1313 ], [ %1355, %1353 ], [ %1395, %1393 ], [ %1446, %1444 ], [ %1497, %1495 ], [ %1550, %1548 ], [ %1603, %1601 ], [ %1656, %1654 ], [ %1734, %1732 ], [ %1778, %1776 ], [ %1819, %1817 ], [ %1894, %1892 ], [ %1949, %1947 ], [ %2004, %2002 ], [ %2059, %2057 ], [ %2125, %2123 ], [ %2191, %2189 ], [ %2215, %2213 ], [ %2242, %2240 ], [ %2268, %2266 ], [ %2299, %2297 ], [ %2338, %2336 ], [ %2360, %2358 ], [ %2378, %2376 ], [ %2403, %2401 ], [ %2419, %2417 ], [ %2433, %2431 ], [ %2447, %2445 ], [ %2480, %2478 ], [ %2601, %2599 ], [ %2723, %2721 ], [ %2754, %2752 ], [ %2799, %2797 ], [ %2849, %2847 ], [ %2899, %2897 ], [ %2949, %2947 ], [ %2999, %2997 ], [ %3031, %3029 ], [ %3069, %3067 ], [ %3094, %3092 ], [ %3302, %3300 ], [ %3580, %3578 ], [ %3639, %3637 ], [ %3717, %3715 ], [ %3788, %3786 ], [ %3805, %3803 ], [ %3818, %3815 ], [ %3828, %3826 ]
  br label %3243

77:                                               ; preds = %3243
  %78 = lshr i32 %3248, 7
  %79 = and i32 %78, 255
  %80 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %79
  %81 = lshr i32 %3248, 15
  %82 = add nsw i32 %81, -65535
  %83 = sext i32 %82 to i64
  store i64 %83, ptr %80, align 8, !tbaa !6
  %84 = getelementptr inbounds i8, ptr %80, i32 8
  store i8 3, ptr %84, align 8, !tbaa !2
  %85 = icmp eq i32 %3245, 0
  br i1 %85, label %90, label %86, !prof !27

86:                                               ; preds = %77
  %87 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %88 = load ptr, ptr %29, align 4, !tbaa !6
  %89 = getelementptr inbounds i8, ptr %88, i32 16
  br label %90

90:                                               ; preds = %86, %77
  %91 = phi i32 [ %87, %86 ], [ 0, %77 ]
  %92 = phi ptr [ %89, %86 ], [ %3247, %77 ]
  %93 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

94:                                               ; preds = %3243
  %95 = lshr i32 %3248, 7
  %96 = and i32 %95, 255
  %97 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %96
  %98 = lshr i32 %3248, 15
  %99 = add nsw i32 %98, -65535
  %100 = sitofp i32 %99 to double
  store double %100, ptr %97, align 8, !tbaa !6
  %101 = getelementptr inbounds i8, ptr %97, i32 8
  store i8 19, ptr %101, align 8, !tbaa !2
  %102 = icmp eq i32 %3245, 0
  br i1 %102, label %107, label %103, !prof !27

103:                                              ; preds = %94
  %104 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %105 = load ptr, ptr %29, align 4, !tbaa !6
  %106 = getelementptr inbounds i8, ptr %105, i32 16
  br label %107

107:                                              ; preds = %103, %94
  %108 = phi i32 [ %104, %103 ], [ 0, %94 ]
  %109 = phi ptr [ %106, %103 ], [ %3247, %94 ]
  %110 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

111:                                              ; preds = %3243
  %112 = lshr i32 %3248, 7
  %113 = and i32 %112, 255
  %114 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %113
  %115 = lshr i32 %3248, 15
  %116 = getelementptr inbounds %struct.TValue, ptr %35, i32 %115
  %117 = load i64, ptr %116, align 8, !tbaa !6
  store i64 %117, ptr %114, align 8, !tbaa !6
  %118 = getelementptr inbounds i8, ptr %116, i32 8
  %119 = load i8, ptr %118, align 8, !tbaa !2
  %120 = getelementptr inbounds i8, ptr %114, i32 8
  store i8 %119, ptr %120, align 8, !tbaa !2
  %121 = icmp eq i32 %3245, 0
  br i1 %121, label %126, label %122, !prof !27

122:                                              ; preds = %111
  %123 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %124 = load ptr, ptr %29, align 4, !tbaa !6
  %125 = getelementptr inbounds i8, ptr %124, i32 16
  br label %126

126:                                              ; preds = %122, %111
  %127 = phi i32 [ %123, %122 ], [ 0, %111 ]
  %128 = phi ptr [ %125, %122 ], [ %3247, %111 ]
  %129 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

130:                                              ; preds = %3243
  %131 = lshr i32 %3248, 7
  %132 = and i32 %131, 255
  %133 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %132
  %134 = load i32, ptr %3246, align 4, !tbaa !30
  %135 = lshr i32 %134, 7
  %136 = getelementptr inbounds %struct.TValue, ptr %35, i32 %135
  %137 = getelementptr inbounds i8, ptr %3246, i32 4
  %138 = load i64, ptr %136, align 8, !tbaa !6
  store i64 %138, ptr %133, align 8, !tbaa !6
  %139 = getelementptr inbounds i8, ptr %136, i32 8
  %140 = load i8, ptr %139, align 8, !tbaa !2
  %141 = getelementptr inbounds i8, ptr %133, i32 8
  store i8 %140, ptr %141, align 8, !tbaa !2
  %142 = icmp eq i32 %3245, 0
  br i1 %142, label %147, label %143, !prof !27

143:                                              ; preds = %130
  %144 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %137) #12
  %145 = load ptr, ptr %29, align 4, !tbaa !6
  %146 = getelementptr inbounds i8, ptr %145, i32 16
  br label %147

147:                                              ; preds = %143, %130
  %148 = phi i32 [ %144, %143 ], [ 0, %130 ]
  %149 = phi ptr [ %146, %143 ], [ %3247, %130 ]
  %150 = getelementptr inbounds i8, ptr %3246, i32 8
  br label %72

151:                                              ; preds = %3243
  %152 = lshr i32 %3248, 7
  %153 = and i32 %152, 255
  %154 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %153, i32 0, i32 1
  store i8 1, ptr %154, align 8, !tbaa !6
  %155 = icmp eq i32 %3245, 0
  br i1 %155, label %160, label %156, !prof !27

156:                                              ; preds = %151
  %157 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %158 = load ptr, ptr %29, align 4, !tbaa !6
  %159 = getelementptr inbounds i8, ptr %158, i32 16
  br label %160

160:                                              ; preds = %156, %151
  %161 = phi i32 [ %157, %156 ], [ 0, %151 ]
  %162 = phi ptr [ %159, %156 ], [ %3247, %151 ]
  %163 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

164:                                              ; preds = %3243
  %165 = lshr i32 %3248, 7
  %166 = and i32 %165, 255
  %167 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %166, i32 0, i32 1
  store i8 1, ptr %167, align 8, !tbaa !6
  %168 = getelementptr inbounds i8, ptr %3246, i32 4
  %169 = icmp eq i32 %3245, 0
  br i1 %169, label %174, label %170, !prof !27

170:                                              ; preds = %164
  %171 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %168) #12
  %172 = load ptr, ptr %29, align 4, !tbaa !6
  %173 = getelementptr inbounds i8, ptr %172, i32 16
  br label %174

174:                                              ; preds = %170, %164
  %175 = phi i32 [ %171, %170 ], [ 0, %164 ]
  %176 = phi ptr [ %173, %170 ], [ %3247, %164 ]
  %177 = getelementptr inbounds i8, ptr %3246, i32 8
  br label %72

178:                                              ; preds = %3243
  %179 = lshr i32 %3248, 7
  %180 = and i32 %179, 255
  %181 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %180, i32 0, i32 1
  store i8 17, ptr %181, align 8, !tbaa !6
  %182 = icmp eq i32 %3245, 0
  br i1 %182, label %187, label %183, !prof !27

183:                                              ; preds = %178
  %184 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %185 = load ptr, ptr %29, align 4, !tbaa !6
  %186 = getelementptr inbounds i8, ptr %185, i32 16
  br label %187

187:                                              ; preds = %183, %178
  %188 = phi i32 [ %184, %183 ], [ 0, %178 ]
  %189 = phi ptr [ %186, %183 ], [ %3247, %178 ]
  %190 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

191:                                              ; preds = %3243
  %192 = lshr i32 %3248, 7
  %193 = and i32 %192, 255
  %194 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %193
  %195 = lshr i32 %3248, 16
  %196 = and i32 %195, 255
  br label %197

197:                                              ; preds = %197, %191
  %198 = phi i32 [ %196, %191 ], [ %202, %197 ]
  %199 = phi ptr [ %194, %191 ], [ %200, %197 ]
  %200 = getelementptr inbounds i8, ptr %199, i32 16
  %201 = getelementptr inbounds i8, ptr %199, i32 8
  store i8 0, ptr %201, align 8, !tbaa !6
  %202 = add nsw i32 %198, -1
  %203 = icmp eq i32 %198, 0
  br i1 %203, label %204, label %197

204:                                              ; preds = %197
  %205 = icmp eq i32 %3245, 0
  br i1 %205, label %210, label %206, !prof !27

206:                                              ; preds = %204
  %207 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %208 = load ptr, ptr %29, align 4, !tbaa !6
  %209 = getelementptr inbounds i8, ptr %208, i32 16
  br label %210

210:                                              ; preds = %206, %204
  %211 = phi i32 [ %207, %206 ], [ 0, %204 ]
  %212 = phi ptr [ %209, %206 ], [ %3247, %204 ]
  %213 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

214:                                              ; preds = %3243
  %215 = lshr i32 %3248, 7
  %216 = and i32 %215, 255
  %217 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %216
  %218 = lshr i32 %3248, 16
  %219 = and i32 %218, 255
  %220 = getelementptr inbounds [1 x ptr], ptr %51, i32 0, i32 %219
  %221 = load ptr, ptr %220, align 4, !tbaa !23
  %222 = getelementptr inbounds i8, ptr %221, i32 8
  %223 = load ptr, ptr %222, align 8, !tbaa !6
  %224 = load i64, ptr %223, align 8, !tbaa !6
  store i64 %224, ptr %217, align 8, !tbaa !6
  %225 = getelementptr inbounds i8, ptr %223, i32 8
  %226 = load i8, ptr %225, align 8, !tbaa !2
  %227 = getelementptr inbounds i8, ptr %217, i32 8
  store i8 %226, ptr %227, align 8, !tbaa !2
  %228 = icmp eq i32 %3245, 0
  br i1 %228, label %233, label %229, !prof !27

229:                                              ; preds = %214
  %230 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %231 = load ptr, ptr %29, align 4, !tbaa !6
  %232 = getelementptr inbounds i8, ptr %231, i32 16
  br label %233

233:                                              ; preds = %229, %214
  %234 = phi i32 [ %230, %229 ], [ 0, %214 ]
  %235 = phi ptr [ %232, %229 ], [ %3247, %214 ]
  %236 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

237:                                              ; preds = %3243
  %238 = lshr i32 %3248, 7
  %239 = and i32 %238, 255
  %240 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %239
  %241 = lshr i32 %3248, 16
  %242 = and i32 %241, 255
  %243 = getelementptr inbounds [1 x ptr], ptr %51, i32 0, i32 %242
  %244 = load ptr, ptr %243, align 4, !tbaa !23
  %245 = getelementptr inbounds i8, ptr %244, i32 8
  %246 = load ptr, ptr %245, align 8, !tbaa !6
  %247 = load i64, ptr %240, align 8, !tbaa !6
  store i64 %247, ptr %246, align 8, !tbaa !6
  %248 = getelementptr inbounds i8, ptr %240, i32 8
  %249 = load i8, ptr %248, align 8, !tbaa !6
  %250 = getelementptr inbounds i8, ptr %246, i32 8
  store i8 %249, ptr %250, align 8, !tbaa !2
  %251 = and i8 %249, 64
  %252 = icmp eq i8 %251, 0
  br i1 %252, label %265, label %253

253:                                              ; preds = %237
  %254 = getelementptr inbounds i8, ptr %244, i32 5
  %255 = load i8, ptr %254, align 1, !tbaa !37
  %256 = and i8 %255, 32
  %257 = icmp eq i8 %256, 0
  br i1 %257, label %265, label %258

258:                                              ; preds = %253
  %259 = load ptr, ptr %240, align 8, !tbaa !6
  %260 = getelementptr inbounds i8, ptr %259, i32 5
  %261 = load i8, ptr %260, align 1, !tbaa !25
  %262 = and i8 %261, 24
  %263 = icmp eq i8 %262, 0
  br i1 %263, label %265, label %264

264:                                              ; preds = %258
  call void @luaC_barrier_(ptr noundef %0, ptr noundef nonnull %244, ptr noundef nonnull %259) #12
  br label %265

265:                                              ; preds = %237, %264, %258, %253
  %266 = icmp eq i32 %3245, 0
  br i1 %266, label %271, label %267, !prof !27

267:                                              ; preds = %265
  %268 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %269 = load ptr, ptr %29, align 4, !tbaa !6
  %270 = getelementptr inbounds i8, ptr %269, i32 16
  br label %271

271:                                              ; preds = %267, %265
  %272 = phi i32 [ %268, %267 ], [ 0, %265 ]
  %273 = phi ptr [ %270, %267 ], [ %3247, %265 ]
  %274 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

275:                                              ; preds = %3243
  %276 = lshr i32 %3248, 7
  %277 = and i32 %276, 255
  %278 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %277
  %279 = lshr i32 %3248, 16
  %280 = and i32 %279, 255
  %281 = getelementptr inbounds [1 x ptr], ptr %51, i32 0, i32 %280
  %282 = load ptr, ptr %281, align 4, !tbaa !23
  %283 = getelementptr inbounds i8, ptr %282, i32 8
  %284 = load ptr, ptr %283, align 8, !tbaa !6
  %285 = lshr i32 %3248, 24
  %286 = getelementptr inbounds %struct.TValue, ptr %35, i32 %285
  %287 = getelementptr inbounds i8, ptr %284, i32 8
  %288 = load i8, ptr %287, align 8, !tbaa !2
  %289 = icmp eq i8 %288, 69
  br i1 %289, label %290, label %302

290:                                              ; preds = %275
  %291 = load ptr, ptr %286, align 8, !tbaa !6
  %292 = load ptr, ptr %284, align 8, !tbaa !6
  %293 = call ptr @luaH_getshortstr(ptr noundef %292, ptr noundef %291) #12
  %294 = getelementptr inbounds i8, ptr %293, i32 8
  %295 = load i8, ptr %294, align 8, !tbaa !2
  %296 = and i8 %295, 15
  %297 = icmp eq i8 %296, 0
  br i1 %297, label %302, label %298

298:                                              ; preds = %290
  %299 = load i64, ptr %293, align 8, !tbaa !6
  store i64 %299, ptr %278, align 8, !tbaa !6
  %300 = load i8, ptr %294, align 8, !tbaa !2
  %301 = getelementptr inbounds i8, ptr %278, i32 8
  store i8 %300, ptr %301, align 8, !tbaa !2
  br label %306

302:                                              ; preds = %275, %290
  %303 = phi ptr [ %293, %290 ], [ null, %275 ]
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %304 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %304, ptr %12, align 4, !tbaa !6
  call void @luaV_finishget(ptr noundef %0, ptr noundef nonnull %284, ptr noundef %286, ptr noundef %278, ptr noundef %303)
  %305 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %306

306:                                              ; preds = %302, %298
  %307 = phi i32 [ %3245, %298 ], [ %305, %302 ]
  %308 = icmp eq i32 %307, 0
  br i1 %308, label %313, label %309, !prof !27

309:                                              ; preds = %306
  %310 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %311 = load ptr, ptr %29, align 4, !tbaa !6
  %312 = getelementptr inbounds i8, ptr %311, i32 16
  br label %313

313:                                              ; preds = %309, %306
  %314 = phi i32 [ %310, %309 ], [ 0, %306 ]
  %315 = phi ptr [ %312, %309 ], [ %3247, %306 ]
  %316 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

317:                                              ; preds = %3243
  %318 = lshr i32 %3248, 7
  %319 = and i32 %318, 255
  %320 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %319
  %321 = lshr i32 %3248, 16
  %322 = and i32 %321, 255
  %323 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %322
  %324 = lshr i32 %3248, 24
  %325 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %324
  %326 = getelementptr inbounds i8, ptr %325, i32 8
  %327 = load i8, ptr %326, align 8, !tbaa !2
  %328 = icmp eq i8 %327, 3
  br i1 %328, label %329, label %354

329:                                              ; preds = %317
  %330 = load i64, ptr %325, align 8, !tbaa !6
  %331 = getelementptr inbounds i8, ptr %323, i32 8
  %332 = load i8, ptr %331, align 8, !tbaa !2
  %333 = icmp eq i8 %332, 69
  br i1 %333, label %334, label %371

334:                                              ; preds = %329
  %335 = add i64 %330, -1
  %336 = load ptr, ptr %323, align 8, !tbaa !6
  %337 = getelementptr inbounds i8, ptr %336, i32 8
  %338 = load i32, ptr %337, align 8, !tbaa !6
  %339 = zext i32 %338 to i64
  %340 = icmp ult i64 %335, %339
  br i1 %340, label %341, label %346

341:                                              ; preds = %334
  %342 = getelementptr inbounds i8, ptr %336, i32 12
  %343 = load ptr, ptr %342, align 4, !tbaa !6
  %344 = trunc nuw i64 %335 to i32
  %345 = getelementptr inbounds %struct.TValue, ptr %343, i32 %344
  br label %348

346:                                              ; preds = %334
  %347 = call ptr @luaH_getint(ptr noundef nonnull %336, i64 noundef %330) #12
  br label %348

348:                                              ; preds = %341, %346
  %349 = phi ptr [ %345, %341 ], [ %347, %346 ]
  %350 = getelementptr inbounds i8, ptr %349, i32 8
  %351 = load i8, ptr %350, align 8, !tbaa !2
  %352 = and i8 %351, 15
  %353 = icmp eq i8 %352, 0
  br i1 %353, label %371, label %365

354:                                              ; preds = %317
  %355 = getelementptr inbounds i8, ptr %323, i32 8
  %356 = load i8, ptr %355, align 8, !tbaa !2
  %357 = icmp eq i8 %356, 69
  br i1 %357, label %358, label %371

358:                                              ; preds = %354
  %359 = load ptr, ptr %323, align 8, !tbaa !6
  %360 = call ptr @luaH_get(ptr noundef %359, ptr noundef nonnull %325) #12
  %361 = getelementptr inbounds i8, ptr %360, i32 8
  %362 = load i8, ptr %361, align 8, !tbaa !2
  %363 = and i8 %362, 15
  %364 = icmp eq i8 %363, 0
  br i1 %364, label %371, label %365

365:                                              ; preds = %358, %348
  %366 = phi ptr [ %349, %348 ], [ %360, %358 ]
  %367 = load i64, ptr %366, align 8, !tbaa !6
  store i64 %367, ptr %320, align 8, !tbaa !6
  %368 = getelementptr inbounds i8, ptr %366, i32 8
  %369 = load i8, ptr %368, align 8, !tbaa !2
  %370 = getelementptr inbounds i8, ptr %320, i32 8
  store i8 %369, ptr %370, align 8, !tbaa !2
  br label %375

371:                                              ; preds = %329, %354, %358, %348
  %372 = phi ptr [ %349, %348 ], [ %360, %358 ], [ null, %354 ], [ null, %329 ]
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %373 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %373, ptr %12, align 4, !tbaa !6
  call void @luaV_finishget(ptr noundef %0, ptr noundef nonnull %323, ptr noundef nonnull %325, ptr noundef nonnull %320, ptr noundef %372)
  %374 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %375

375:                                              ; preds = %371, %365
  %376 = phi i32 [ %3245, %365 ], [ %374, %371 ]
  %377 = icmp eq i32 %376, 0
  br i1 %377, label %382, label %378, !prof !27

378:                                              ; preds = %375
  %379 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %380 = load ptr, ptr %29, align 4, !tbaa !6
  %381 = getelementptr inbounds i8, ptr %380, i32 16
  br label %382

382:                                              ; preds = %378, %375
  %383 = phi i32 [ %379, %378 ], [ 0, %375 ]
  %384 = phi ptr [ %381, %378 ], [ %3247, %375 ]
  %385 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

386:                                              ; preds = %3243
  %387 = lshr i32 %3248, 7
  %388 = and i32 %387, 255
  %389 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %388
  %390 = lshr i32 %3248, 16
  %391 = and i32 %390, 255
  %392 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %391
  %393 = lshr i32 %3248, 24
  %394 = getelementptr inbounds i8, ptr %392, i32 8
  %395 = load i8, ptr %394, align 8, !tbaa !2
  %396 = icmp eq i8 %395, 69
  %397 = zext nneg i32 %393 to i64
  br i1 %396, label %398, label %422

398:                                              ; preds = %386
  %399 = add nsw i64 %397, -1
  %400 = load ptr, ptr %392, align 8, !tbaa !6
  %401 = getelementptr inbounds i8, ptr %400, i32 8
  %402 = load i32, ptr %401, align 8, !tbaa !6
  %403 = zext i32 %402 to i64
  %404 = icmp ult i64 %399, %403
  br i1 %404, label %405, label %410

405:                                              ; preds = %398
  %406 = getelementptr inbounds i8, ptr %400, i32 12
  %407 = load ptr, ptr %406, align 4, !tbaa !6
  %408 = getelementptr %struct.TValue, ptr %407, i32 %393
  %409 = getelementptr i8, ptr %408, i32 -16
  br label %412

410:                                              ; preds = %398
  %411 = call ptr @luaH_getint(ptr noundef nonnull %400, i64 noundef %397) #12
  br label %412

412:                                              ; preds = %410, %405
  %413 = phi ptr [ %409, %405 ], [ %411, %410 ]
  %414 = getelementptr inbounds i8, ptr %413, i32 8
  %415 = load i8, ptr %414, align 8, !tbaa !2
  %416 = and i8 %415, 15
  %417 = icmp eq i8 %416, 0
  br i1 %417, label %422, label %418

418:                                              ; preds = %412
  %419 = load i64, ptr %413, align 8, !tbaa !6
  store i64 %419, ptr %389, align 8, !tbaa !6
  %420 = load i8, ptr %414, align 8, !tbaa !2
  %421 = getelementptr inbounds i8, ptr %389, i32 8
  store i8 %420, ptr %421, align 8, !tbaa !2
  br label %426

422:                                              ; preds = %386, %412
  %423 = phi ptr [ %413, %412 ], [ null, %386 ]
  store i64 %397, ptr %8, align 8, !tbaa !6
  store i8 3, ptr %20, align 8, !tbaa !2
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %424 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %424, ptr %12, align 4, !tbaa !6
  call void @luaV_finishget(ptr noundef %0, ptr noundef nonnull %392, ptr noundef nonnull %8, ptr noundef nonnull %389, ptr noundef %423)
  %425 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %426

426:                                              ; preds = %422, %418
  %427 = phi i32 [ %3245, %418 ], [ %425, %422 ]
  %428 = icmp eq i32 %427, 0
  br i1 %428, label %433, label %429, !prof !27

429:                                              ; preds = %426
  %430 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %431 = load ptr, ptr %29, align 4, !tbaa !6
  %432 = getelementptr inbounds i8, ptr %431, i32 16
  br label %433

433:                                              ; preds = %429, %426
  %434 = phi i32 [ %430, %429 ], [ 0, %426 ]
  %435 = phi ptr [ %432, %429 ], [ %3247, %426 ]
  %436 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

437:                                              ; preds = %3243
  %438 = lshr i32 %3248, 7
  %439 = and i32 %438, 255
  %440 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %439
  %441 = lshr i32 %3248, 16
  %442 = and i32 %441, 255
  %443 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %442
  %444 = lshr i32 %3248, 24
  %445 = getelementptr inbounds %struct.TValue, ptr %35, i32 %444
  %446 = getelementptr inbounds i8, ptr %443, i32 8
  %447 = load i8, ptr %446, align 8, !tbaa !2
  %448 = icmp eq i8 %447, 69
  br i1 %448, label %449, label %461

449:                                              ; preds = %437
  %450 = load ptr, ptr %445, align 8, !tbaa !6
  %451 = load ptr, ptr %443, align 8, !tbaa !6
  %452 = call ptr @luaH_getshortstr(ptr noundef %451, ptr noundef %450) #12
  %453 = getelementptr inbounds i8, ptr %452, i32 8
  %454 = load i8, ptr %453, align 8, !tbaa !2
  %455 = and i8 %454, 15
  %456 = icmp eq i8 %455, 0
  br i1 %456, label %461, label %457

457:                                              ; preds = %449
  %458 = load i64, ptr %452, align 8, !tbaa !6
  store i64 %458, ptr %440, align 8, !tbaa !6
  %459 = load i8, ptr %453, align 8, !tbaa !2
  %460 = getelementptr inbounds i8, ptr %440, i32 8
  store i8 %459, ptr %460, align 8, !tbaa !2
  br label %465

461:                                              ; preds = %437, %449
  %462 = phi ptr [ %452, %449 ], [ null, %437 ]
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %463 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %463, ptr %12, align 4, !tbaa !6
  call void @luaV_finishget(ptr noundef %0, ptr noundef nonnull %443, ptr noundef %445, ptr noundef nonnull %440, ptr noundef %462)
  %464 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %465

465:                                              ; preds = %461, %457
  %466 = phi i32 [ %3245, %457 ], [ %464, %461 ]
  %467 = icmp eq i32 %466, 0
  br i1 %467, label %472, label %468, !prof !27

468:                                              ; preds = %465
  %469 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %470 = load ptr, ptr %29, align 4, !tbaa !6
  %471 = getelementptr inbounds i8, ptr %470, i32 16
  br label %472

472:                                              ; preds = %468, %465
  %473 = phi i32 [ %469, %468 ], [ 0, %465 ]
  %474 = phi ptr [ %471, %468 ], [ %3247, %465 ]
  %475 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

476:                                              ; preds = %3243
  %477 = lshr i32 %3248, 7
  %478 = and i32 %477, 255
  %479 = getelementptr inbounds [1 x ptr], ptr %51, i32 0, i32 %478
  %480 = load ptr, ptr %479, align 4, !tbaa !23
  %481 = getelementptr inbounds i8, ptr %480, i32 8
  %482 = load ptr, ptr %481, align 8, !tbaa !6
  %483 = lshr i32 %3248, 16
  %484 = and i32 %483, 255
  %485 = getelementptr inbounds %struct.TValue, ptr %35, i32 %484
  %486 = and i32 %3248, 32768
  %487 = icmp eq i32 %486, 0
  %488 = lshr i32 %3248, 24
  %489 = getelementptr inbounds %struct.TValue, ptr %35, i32 %488
  %490 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %488
  %491 = select i1 %487, ptr %490, ptr %489
  %492 = getelementptr inbounds i8, ptr %482, i32 8
  %493 = load i8, ptr %492, align 8, !tbaa !2
  %494 = icmp eq i8 %493, 69
  br i1 %494, label %495, label %522

495:                                              ; preds = %476
  %496 = load ptr, ptr %485, align 8, !tbaa !6
  %497 = load ptr, ptr %482, align 8, !tbaa !6
  %498 = call ptr @luaH_getshortstr(ptr noundef %497, ptr noundef %496) #12
  %499 = getelementptr inbounds i8, ptr %498, i32 8
  %500 = load i8, ptr %499, align 8, !tbaa !2
  %501 = and i8 %500, 15
  %502 = icmp eq i8 %501, 0
  br i1 %502, label %522, label %503

503:                                              ; preds = %495
  %504 = load i64, ptr %491, align 8, !tbaa !6
  store i64 %504, ptr %498, align 8, !tbaa !6
  %505 = getelementptr inbounds i8, ptr %491, i32 8
  %506 = load i8, ptr %505, align 8, !tbaa !2
  store i8 %506, ptr %499, align 8, !tbaa !2
  %507 = and i8 %506, 64
  %508 = icmp eq i8 %507, 0
  br i1 %508, label %526, label %509

509:                                              ; preds = %503
  %510 = load ptr, ptr %482, align 8, !tbaa !6
  %511 = getelementptr inbounds i8, ptr %510, i32 5
  %512 = load i8, ptr %511, align 1, !tbaa !25
  %513 = and i8 %512, 32
  %514 = icmp eq i8 %513, 0
  br i1 %514, label %526, label %515

515:                                              ; preds = %509
  %516 = load ptr, ptr %491, align 8, !tbaa !6
  %517 = getelementptr inbounds i8, ptr %516, i32 5
  %518 = load i8, ptr %517, align 1, !tbaa !25
  %519 = and i8 %518, 24
  %520 = icmp eq i8 %519, 0
  br i1 %520, label %526, label %521

521:                                              ; preds = %515
  call void @luaC_barrierback_(ptr noundef %0, ptr noundef nonnull %510) #12
  br label %526

522:                                              ; preds = %476, %495
  %523 = phi ptr [ %498, %495 ], [ null, %476 ]
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %524 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %524, ptr %12, align 4, !tbaa !6
  call void @luaV_finishset(ptr noundef %0, ptr noundef nonnull %482, ptr noundef %485, ptr noundef %491, ptr noundef %523)
  %525 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %526

526:                                              ; preds = %509, %515, %521, %503, %522
  %527 = phi i32 [ %3245, %521 ], [ %3245, %515 ], [ %3245, %509 ], [ %3245, %503 ], [ %525, %522 ]
  %528 = icmp eq i32 %527, 0
  br i1 %528, label %533, label %529, !prof !27

529:                                              ; preds = %526
  %530 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %531 = load ptr, ptr %29, align 4, !tbaa !6
  %532 = getelementptr inbounds i8, ptr %531, i32 16
  br label %533

533:                                              ; preds = %529, %526
  %534 = phi i32 [ %530, %529 ], [ 0, %526 ]
  %535 = phi ptr [ %532, %529 ], [ %3247, %526 ]
  %536 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

537:                                              ; preds = %3243
  %538 = lshr i32 %3248, 7
  %539 = and i32 %538, 255
  %540 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %539
  %541 = lshr i32 %3248, 16
  %542 = and i32 %541, 255
  %543 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %542
  %544 = and i32 %3248, 32768
  %545 = icmp eq i32 %544, 0
  %546 = lshr i32 %3248, 24
  %547 = getelementptr inbounds %struct.TValue, ptr %35, i32 %546
  %548 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %546
  %549 = select i1 %545, ptr %548, ptr %547
  %550 = getelementptr inbounds i8, ptr %543, i32 8
  %551 = load i8, ptr %550, align 8, !tbaa !2
  %552 = icmp eq i8 %551, 3
  br i1 %552, label %553, label %578

553:                                              ; preds = %537
  %554 = load i64, ptr %543, align 8, !tbaa !6
  %555 = getelementptr inbounds i8, ptr %540, i32 8
  %556 = load i8, ptr %555, align 8, !tbaa !6
  %557 = icmp eq i8 %556, 69
  br i1 %557, label %558, label %610

558:                                              ; preds = %553
  %559 = add i64 %554, -1
  %560 = load ptr, ptr %540, align 8, !tbaa !6
  %561 = getelementptr inbounds i8, ptr %560, i32 8
  %562 = load i32, ptr %561, align 8, !tbaa !6
  %563 = zext i32 %562 to i64
  %564 = icmp ult i64 %559, %563
  br i1 %564, label %565, label %570

565:                                              ; preds = %558
  %566 = getelementptr inbounds i8, ptr %560, i32 12
  %567 = load ptr, ptr %566, align 4, !tbaa !6
  %568 = trunc nuw i64 %559 to i32
  %569 = getelementptr inbounds %struct.TValue, ptr %567, i32 %568
  br label %572

570:                                              ; preds = %558
  %571 = call ptr @luaH_getint(ptr noundef nonnull %560, i64 noundef %554) #12
  br label %572

572:                                              ; preds = %565, %570
  %573 = phi ptr [ %569, %565 ], [ %571, %570 ]
  %574 = getelementptr inbounds i8, ptr %573, i32 8
  %575 = load i8, ptr %574, align 8, !tbaa !2
  %576 = and i8 %575, 15
  %577 = icmp eq i8 %576, 0
  br i1 %577, label %610, label %589

578:                                              ; preds = %537
  %579 = getelementptr inbounds i8, ptr %540, i32 8
  %580 = load i8, ptr %579, align 8, !tbaa !6
  %581 = icmp eq i8 %580, 69
  br i1 %581, label %582, label %610

582:                                              ; preds = %578
  %583 = load ptr, ptr %540, align 8, !tbaa !6
  %584 = call ptr @luaH_get(ptr noundef %583, ptr noundef nonnull %543) #12
  %585 = getelementptr inbounds i8, ptr %584, i32 8
  %586 = load i8, ptr %585, align 8, !tbaa !2
  %587 = and i8 %586, 15
  %588 = icmp eq i8 %587, 0
  br i1 %588, label %610, label %589

589:                                              ; preds = %582, %572
  %590 = phi ptr [ %573, %572 ], [ %584, %582 ]
  %591 = load i64, ptr %549, align 8, !tbaa !6
  store i64 %591, ptr %590, align 8, !tbaa !6
  %592 = getelementptr inbounds i8, ptr %549, i32 8
  %593 = load i8, ptr %592, align 8, !tbaa !2
  %594 = getelementptr inbounds i8, ptr %590, i32 8
  store i8 %593, ptr %594, align 8, !tbaa !2
  %595 = and i8 %593, 64
  %596 = icmp eq i8 %595, 0
  br i1 %596, label %614, label %597

597:                                              ; preds = %589
  %598 = load ptr, ptr %540, align 8, !tbaa !6
  %599 = getelementptr inbounds i8, ptr %598, i32 5
  %600 = load i8, ptr %599, align 1, !tbaa !25
  %601 = and i8 %600, 32
  %602 = icmp eq i8 %601, 0
  br i1 %602, label %614, label %603

603:                                              ; preds = %597
  %604 = load ptr, ptr %549, align 8, !tbaa !6
  %605 = getelementptr inbounds i8, ptr %604, i32 5
  %606 = load i8, ptr %605, align 1, !tbaa !25
  %607 = and i8 %606, 24
  %608 = icmp eq i8 %607, 0
  br i1 %608, label %614, label %609

609:                                              ; preds = %603
  call void @luaC_barrierback_(ptr noundef %0, ptr noundef nonnull %598) #12
  br label %614

610:                                              ; preds = %553, %578, %582, %572
  %611 = phi ptr [ %573, %572 ], [ %584, %582 ], [ null, %578 ], [ null, %553 ]
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %612 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %612, ptr %12, align 4, !tbaa !6
  call void @luaV_finishset(ptr noundef %0, ptr noundef nonnull %540, ptr noundef nonnull %543, ptr noundef %549, ptr noundef %611)
  %613 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %614

614:                                              ; preds = %597, %603, %609, %589, %610
  %615 = phi i32 [ %3245, %609 ], [ %3245, %603 ], [ %3245, %597 ], [ %3245, %589 ], [ %613, %610 ]
  %616 = icmp eq i32 %615, 0
  br i1 %616, label %621, label %617, !prof !27

617:                                              ; preds = %614
  %618 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %619 = load ptr, ptr %29, align 4, !tbaa !6
  %620 = getelementptr inbounds i8, ptr %619, i32 16
  br label %621

621:                                              ; preds = %617, %614
  %622 = phi i32 [ %618, %617 ], [ 0, %614 ]
  %623 = phi ptr [ %620, %617 ], [ %3247, %614 ]
  %624 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

625:                                              ; preds = %3243
  %626 = lshr i32 %3248, 7
  %627 = and i32 %626, 255
  %628 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %627
  %629 = lshr i32 %3248, 16
  %630 = and i32 %629, 255
  %631 = and i32 %3248, 32768
  %632 = icmp eq i32 %631, 0
  %633 = lshr i32 %3248, 24
  %634 = getelementptr inbounds %struct.TValue, ptr %35, i32 %633
  %635 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %633
  %636 = select i1 %632, ptr %635, ptr %634
  %637 = getelementptr inbounds i8, ptr %628, i32 8
  %638 = load i8, ptr %637, align 8, !tbaa !6
  %639 = icmp eq i8 %638, 69
  %640 = zext nneg i32 %630 to i64
  br i1 %639, label %641, label %680

641:                                              ; preds = %625
  %642 = add nsw i64 %640, -1
  %643 = load ptr, ptr %628, align 8, !tbaa !6
  %644 = getelementptr inbounds i8, ptr %643, i32 8
  %645 = load i32, ptr %644, align 8, !tbaa !6
  %646 = zext i32 %645 to i64
  %647 = icmp ult i64 %642, %646
  br i1 %647, label %648, label %653

648:                                              ; preds = %641
  %649 = getelementptr inbounds i8, ptr %643, i32 12
  %650 = load ptr, ptr %649, align 4, !tbaa !6
  %651 = getelementptr %struct.TValue, ptr %650, i32 %630
  %652 = getelementptr i8, ptr %651, i32 -16
  br label %655

653:                                              ; preds = %641
  %654 = call ptr @luaH_getint(ptr noundef nonnull %643, i64 noundef %640) #12
  br label %655

655:                                              ; preds = %653, %648
  %656 = phi ptr [ %652, %648 ], [ %654, %653 ]
  %657 = getelementptr inbounds i8, ptr %656, i32 8
  %658 = load i8, ptr %657, align 8, !tbaa !2
  %659 = and i8 %658, 15
  %660 = icmp eq i8 %659, 0
  br i1 %660, label %680, label %661

661:                                              ; preds = %655
  %662 = load i64, ptr %636, align 8, !tbaa !6
  store i64 %662, ptr %656, align 8, !tbaa !6
  %663 = getelementptr inbounds i8, ptr %636, i32 8
  %664 = load i8, ptr %663, align 8, !tbaa !2
  store i8 %664, ptr %657, align 8, !tbaa !2
  %665 = and i8 %664, 64
  %666 = icmp eq i8 %665, 0
  br i1 %666, label %684, label %667

667:                                              ; preds = %661
  %668 = load ptr, ptr %628, align 8, !tbaa !6
  %669 = getelementptr inbounds i8, ptr %668, i32 5
  %670 = load i8, ptr %669, align 1, !tbaa !25
  %671 = and i8 %670, 32
  %672 = icmp eq i8 %671, 0
  br i1 %672, label %684, label %673

673:                                              ; preds = %667
  %674 = load ptr, ptr %636, align 8, !tbaa !6
  %675 = getelementptr inbounds i8, ptr %674, i32 5
  %676 = load i8, ptr %675, align 1, !tbaa !25
  %677 = and i8 %676, 24
  %678 = icmp eq i8 %677, 0
  br i1 %678, label %684, label %679

679:                                              ; preds = %673
  call void @luaC_barrierback_(ptr noundef %0, ptr noundef nonnull %668) #12
  br label %684

680:                                              ; preds = %625, %655
  %681 = phi ptr [ %656, %655 ], [ null, %625 ]
  store i64 %640, ptr %9, align 8, !tbaa !6
  store i8 3, ptr %19, align 8, !tbaa !2
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %682 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %682, ptr %12, align 4, !tbaa !6
  call void @luaV_finishset(ptr noundef %0, ptr noundef nonnull %628, ptr noundef nonnull %9, ptr noundef %636, ptr noundef %681)
  %683 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %684

684:                                              ; preds = %667, %673, %679, %661, %680
  %685 = phi i32 [ %3245, %679 ], [ %3245, %673 ], [ %3245, %667 ], [ %3245, %661 ], [ %683, %680 ]
  %686 = icmp eq i32 %685, 0
  br i1 %686, label %691, label %687, !prof !27

687:                                              ; preds = %684
  %688 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %689 = load ptr, ptr %29, align 4, !tbaa !6
  %690 = getelementptr inbounds i8, ptr %689, i32 16
  br label %691

691:                                              ; preds = %687, %684
  %692 = phi i32 [ %688, %687 ], [ 0, %684 ]
  %693 = phi ptr [ %690, %687 ], [ %3247, %684 ]
  %694 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

695:                                              ; preds = %3243
  %696 = lshr i32 %3248, 7
  %697 = and i32 %696, 255
  %698 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %697
  %699 = lshr i32 %3248, 16
  %700 = and i32 %699, 255
  %701 = getelementptr inbounds %struct.TValue, ptr %35, i32 %700
  %702 = and i32 %3248, 32768
  %703 = icmp eq i32 %702, 0
  %704 = lshr i32 %3248, 24
  %705 = getelementptr inbounds %struct.TValue, ptr %35, i32 %704
  %706 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %704
  %707 = select i1 %703, ptr %706, ptr %705
  %708 = getelementptr inbounds i8, ptr %698, i32 8
  %709 = load i8, ptr %708, align 8, !tbaa !6
  %710 = icmp eq i8 %709, 69
  br i1 %710, label %711, label %738

711:                                              ; preds = %695
  %712 = load ptr, ptr %701, align 8, !tbaa !6
  %713 = load ptr, ptr %698, align 8, !tbaa !6
  %714 = call ptr @luaH_getshortstr(ptr noundef %713, ptr noundef %712) #12
  %715 = getelementptr inbounds i8, ptr %714, i32 8
  %716 = load i8, ptr %715, align 8, !tbaa !2
  %717 = and i8 %716, 15
  %718 = icmp eq i8 %717, 0
  br i1 %718, label %738, label %719

719:                                              ; preds = %711
  %720 = load i64, ptr %707, align 8, !tbaa !6
  store i64 %720, ptr %714, align 8, !tbaa !6
  %721 = getelementptr inbounds i8, ptr %707, i32 8
  %722 = load i8, ptr %721, align 8, !tbaa !2
  store i8 %722, ptr %715, align 8, !tbaa !2
  %723 = and i8 %722, 64
  %724 = icmp eq i8 %723, 0
  br i1 %724, label %742, label %725

725:                                              ; preds = %719
  %726 = load ptr, ptr %698, align 8, !tbaa !6
  %727 = getelementptr inbounds i8, ptr %726, i32 5
  %728 = load i8, ptr %727, align 1, !tbaa !25
  %729 = and i8 %728, 32
  %730 = icmp eq i8 %729, 0
  br i1 %730, label %742, label %731

731:                                              ; preds = %725
  %732 = load ptr, ptr %707, align 8, !tbaa !6
  %733 = getelementptr inbounds i8, ptr %732, i32 5
  %734 = load i8, ptr %733, align 1, !tbaa !25
  %735 = and i8 %734, 24
  %736 = icmp eq i8 %735, 0
  br i1 %736, label %742, label %737

737:                                              ; preds = %731
  call void @luaC_barrierback_(ptr noundef %0, ptr noundef nonnull %726) #12
  br label %742

738:                                              ; preds = %695, %711
  %739 = phi ptr [ %714, %711 ], [ null, %695 ]
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %740 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %740, ptr %12, align 4, !tbaa !6
  call void @luaV_finishset(ptr noundef %0, ptr noundef nonnull %698, ptr noundef %701, ptr noundef %707, ptr noundef %739)
  %741 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %742

742:                                              ; preds = %725, %731, %737, %719, %738
  %743 = phi i32 [ %3245, %737 ], [ %3245, %731 ], [ %3245, %725 ], [ %3245, %719 ], [ %741, %738 ]
  %744 = icmp eq i32 %743, 0
  br i1 %744, label %749, label %745, !prof !27

745:                                              ; preds = %742
  %746 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %747 = load ptr, ptr %29, align 4, !tbaa !6
  %748 = getelementptr inbounds i8, ptr %747, i32 16
  br label %749

749:                                              ; preds = %745, %742
  %750 = phi i32 [ %746, %745 ], [ 0, %742 ]
  %751 = phi ptr [ %748, %745 ], [ %3247, %742 ]
  %752 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

753:                                              ; preds = %3243
  %754 = lshr i32 %3248, 7
  %755 = and i32 %754, 255
  %756 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %755
  %757 = lshr i32 %3248, 16
  %758 = and i32 %757, 255
  %759 = lshr i32 %3248, 24
  %760 = icmp ne i32 %758, 0
  %761 = add nsw i32 %758, -1
  %762 = shl nuw i32 1, %761
  %763 = select i1 %760, i32 %762, i32 0
  %764 = and i32 %3248, 32768
  %765 = icmp eq i32 %764, 0
  br i1 %765, label %771, label %766

766:                                              ; preds = %753
  %767 = load i32, ptr %3246, align 4, !tbaa !30
  %768 = shl nuw nsw i32 %767, 1
  %769 = and i32 %768, 2147483392
  %770 = or disjoint i32 %769, %759
  br label %771

771:                                              ; preds = %766, %753
  %772 = phi i32 [ %770, %766 ], [ %759, %753 ]
  %773 = getelementptr inbounds i8, ptr %3246, i32 4
  %774 = getelementptr inbounds i8, ptr %756, i32 16
  store ptr %774, ptr %12, align 4, !tbaa !6
  %775 = call ptr @luaH_new(ptr noundef %0) #12
  store ptr %775, ptr %756, align 8, !tbaa !6
  %776 = getelementptr inbounds i8, ptr %756, i32 8
  store i8 69, ptr %776, align 8, !tbaa !2
  %777 = icmp ne i32 %772, 0
  %778 = select i1 %760, i1 true, i1 %777
  br i1 %778, label %779, label %780

779:                                              ; preds = %771
  call void @luaH_resize(ptr noundef nonnull %0, ptr noundef %775, i32 noundef %772, i32 noundef %763) #12
  br label %780

780:                                              ; preds = %771, %779
  %781 = load ptr, ptr %13, align 4, !tbaa !18
  %782 = getelementptr inbounds i8, ptr %781, i32 12
  %783 = load i32, ptr %782, align 4, !tbaa !39
  %784 = icmp sgt i32 %783, 0
  br i1 %784, label %785, label %787

785:                                              ; preds = %780
  store ptr %773, ptr %36, align 4, !tbaa !6
  store ptr %774, ptr %12, align 4, !tbaa !6
  call void @luaC_step(ptr noundef nonnull %0) #12
  %786 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %787

787:                                              ; preds = %785, %780
  %788 = phi i32 [ %786, %785 ], [ %3245, %780 ]
  %789 = icmp eq i32 %788, 0
  br i1 %789, label %794, label %790, !prof !27

790:                                              ; preds = %787
  %791 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %773) #12
  %792 = load ptr, ptr %29, align 4, !tbaa !6
  %793 = getelementptr inbounds i8, ptr %792, i32 16
  br label %794

794:                                              ; preds = %790, %787
  %795 = phi i32 [ %791, %790 ], [ 0, %787 ]
  %796 = phi ptr [ %793, %790 ], [ %3247, %787 ]
  %797 = getelementptr inbounds i8, ptr %3246, i32 8
  br label %72

798:                                              ; preds = %3243
  %799 = lshr i32 %3248, 7
  %800 = and i32 %799, 255
  %801 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %800
  %802 = lshr i32 %3248, 16
  %803 = and i32 %802, 255
  %804 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %803
  %805 = and i32 %3248, 32768
  %806 = icmp eq i32 %805, 0
  %807 = lshr i32 %3248, 24
  %808 = getelementptr inbounds %struct.TValue, ptr %35, i32 %807
  %809 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %807
  %810 = select i1 %806, ptr %809, ptr %808
  %811 = load ptr, ptr %810, align 8, !tbaa !6
  %812 = getelementptr inbounds i8, ptr %801, i32 16
  %813 = load i64, ptr %804, align 8
  store i64 %813, ptr %812, align 8, !tbaa !6
  %814 = getelementptr inbounds i8, ptr %804, i32 8
  %815 = load i8, ptr %814, align 8, !tbaa !2
  %816 = getelementptr inbounds i8, ptr %801, i32 24
  store i8 %815, ptr %816, align 8, !tbaa !2
  %817 = icmp eq i8 %815, 69
  br i1 %817, label %818, label %830

818:                                              ; preds = %798
  %819 = trunc i64 %813 to i32
  %820 = inttoptr i32 %819 to ptr
  %821 = call ptr @luaH_getstr(ptr noundef %820, ptr noundef %811) #12
  %822 = getelementptr inbounds i8, ptr %821, i32 8
  %823 = load i8, ptr %822, align 8, !tbaa !2
  %824 = and i8 %823, 15
  %825 = icmp eq i8 %824, 0
  br i1 %825, label %830, label %826

826:                                              ; preds = %818
  %827 = load i64, ptr %821, align 8, !tbaa !6
  store i64 %827, ptr %801, align 8, !tbaa !6
  %828 = load i8, ptr %822, align 8, !tbaa !2
  %829 = getelementptr inbounds i8, ptr %801, i32 8
  store i8 %828, ptr %829, align 8, !tbaa !2
  br label %834

830:                                              ; preds = %798, %818
  %831 = phi ptr [ %821, %818 ], [ null, %798 ]
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %832 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %832, ptr %12, align 4, !tbaa !6
  call void @luaV_finishget(ptr noundef %0, ptr noundef nonnull %804, ptr noundef nonnull %810, ptr noundef nonnull %801, ptr noundef %831)
  %833 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %834

834:                                              ; preds = %830, %826
  %835 = phi i32 [ %3245, %826 ], [ %833, %830 ]
  %836 = icmp eq i32 %835, 0
  br i1 %836, label %841, label %837, !prof !27

837:                                              ; preds = %834
  %838 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %839 = load ptr, ptr %29, align 4, !tbaa !6
  %840 = getelementptr inbounds i8, ptr %839, i32 16
  br label %841

841:                                              ; preds = %837, %834
  %842 = phi i32 [ %838, %837 ], [ 0, %834 ]
  %843 = phi ptr [ %840, %837 ], [ %3247, %834 ]
  %844 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

845:                                              ; preds = %3243
  %846 = lshr i32 %3248, 7
  %847 = and i32 %846, 255
  %848 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %847
  %849 = lshr i32 %3248, 16
  %850 = and i32 %849, 255
  %851 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %850
  %852 = lshr i32 %3248, 24
  %853 = add nsw i32 %852, -127
  %854 = getelementptr inbounds i8, ptr %851, i32 8
  %855 = load i8, ptr %854, align 8, !tbaa !2
  switch i8 %855, label %869 [
    i8 3, label %856
    i8 19, label %861
  ]

856:                                              ; preds = %845
  %857 = load i64, ptr %851, align 8, !tbaa !6
  %858 = sext i32 %853 to i64
  %859 = add i64 %857, %858
  %860 = bitcast i64 %859 to double
  br label %865

861:                                              ; preds = %845
  %862 = load double, ptr %851, align 8, !tbaa !6
  %863 = sitofp i32 %853 to double
  %864 = fadd double %862, %863
  br label %865

865:                                              ; preds = %856, %861
  %866 = phi double [ %864, %861 ], [ %860, %856 ]
  %867 = getelementptr inbounds i8, ptr %3246, i32 4
  store double %866, ptr %848, align 8, !tbaa !6
  %868 = getelementptr inbounds i8, ptr %848, i32 8
  store i8 %855, ptr %868, align 8, !tbaa !2
  br label %869

869:                                              ; preds = %865, %845
  %870 = phi ptr [ %3246, %845 ], [ %867, %865 ]
  %871 = icmp eq i32 %3245, 0
  br i1 %871, label %876, label %872, !prof !27

872:                                              ; preds = %869
  %873 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %870) #12
  %874 = load ptr, ptr %29, align 4, !tbaa !6
  %875 = getelementptr inbounds i8, ptr %874, i32 16
  br label %876

876:                                              ; preds = %872, %869
  %877 = phi i32 [ %873, %872 ], [ 0, %869 ]
  %878 = phi ptr [ %875, %872 ], [ %3247, %869 ]
  %879 = getelementptr inbounds i8, ptr %870, i32 4
  br label %72

880:                                              ; preds = %3243
  %881 = lshr i32 %3248, 16
  %882 = and i32 %881, 255
  %883 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %882
  %884 = lshr i32 %3248, 24
  %885 = getelementptr inbounds %struct.TValue, ptr %35, i32 %884
  %886 = lshr i32 %3248, 7
  %887 = and i32 %886, 255
  %888 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %887
  %889 = getelementptr inbounds i8, ptr %883, i32 8
  %890 = load i8, ptr %889, align 8, !tbaa !2
  switch i8 %890, label %922 [
    i8 3, label %891
    i8 19, label %900
  ]

891:                                              ; preds = %880
  %892 = getelementptr inbounds i8, ptr %885, i32 8
  %893 = load i8, ptr %892, align 8, !tbaa !2
  %894 = icmp eq i8 %893, 3
  %895 = load i64, ptr %883, align 8, !tbaa !6
  br i1 %894, label %896, label %904

896:                                              ; preds = %891
  %897 = load i64, ptr %885, align 8, !tbaa !6
  %898 = add i64 %897, %895
  %899 = bitcast i64 %898 to double
  br label %917

900:                                              ; preds = %880
  %901 = load double, ptr %883, align 8, !tbaa !6
  %902 = getelementptr inbounds i8, ptr %885, i32 8
  %903 = load i8, ptr %902, align 8, !tbaa !2
  br label %906

904:                                              ; preds = %891
  %905 = sitofp i64 %895 to double
  br label %906

906:                                              ; preds = %900, %904
  %907 = phi i8 [ %903, %900 ], [ %893, %904 ]
  %908 = phi double [ %901, %900 ], [ %905, %904 ]
  switch i8 %907, label %922 [
    i8 19, label %909
    i8 3, label %911
  ]

909:                                              ; preds = %906
  %910 = load double, ptr %885, align 8, !tbaa !6
  br label %914

911:                                              ; preds = %906
  %912 = load i64, ptr %885, align 8, !tbaa !6
  %913 = sitofp i64 %912 to double
  br label %914

914:                                              ; preds = %909, %911
  %915 = phi double [ %910, %909 ], [ %913, %911 ]
  %916 = fadd double %908, %915
  br label %917

917:                                              ; preds = %896, %914
  %918 = phi double [ %916, %914 ], [ %899, %896 ]
  %919 = phi i8 [ 19, %914 ], [ 3, %896 ]
  %920 = getelementptr inbounds i8, ptr %3246, i32 4
  store double %918, ptr %888, align 8, !tbaa !6
  %921 = getelementptr inbounds i8, ptr %888, i32 8
  store i8 %919, ptr %921, align 8, !tbaa !2
  br label %922

922:                                              ; preds = %917, %880, %906
  %923 = phi ptr [ %3246, %906 ], [ %3246, %880 ], [ %920, %917 ]
  %924 = icmp eq i32 %3245, 0
  br i1 %924, label %929, label %925, !prof !27

925:                                              ; preds = %922
  %926 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %923) #12
  %927 = load ptr, ptr %29, align 4, !tbaa !6
  %928 = getelementptr inbounds i8, ptr %927, i32 16
  br label %929

929:                                              ; preds = %925, %922
  %930 = phi i32 [ %926, %925 ], [ 0, %922 ]
  %931 = phi ptr [ %928, %925 ], [ %3247, %922 ]
  %932 = getelementptr inbounds i8, ptr %923, i32 4
  br label %72

933:                                              ; preds = %3243
  %934 = lshr i32 %3248, 16
  %935 = and i32 %934, 255
  %936 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %935
  %937 = lshr i32 %3248, 24
  %938 = getelementptr inbounds %struct.TValue, ptr %35, i32 %937
  %939 = lshr i32 %3248, 7
  %940 = and i32 %939, 255
  %941 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %940
  %942 = getelementptr inbounds i8, ptr %936, i32 8
  %943 = load i8, ptr %942, align 8, !tbaa !2
  switch i8 %943, label %975 [
    i8 3, label %944
    i8 19, label %953
  ]

944:                                              ; preds = %933
  %945 = getelementptr inbounds i8, ptr %938, i32 8
  %946 = load i8, ptr %945, align 8, !tbaa !2
  %947 = icmp eq i8 %946, 3
  %948 = load i64, ptr %936, align 8, !tbaa !6
  br i1 %947, label %949, label %957

949:                                              ; preds = %944
  %950 = load i64, ptr %938, align 8, !tbaa !6
  %951 = sub i64 %948, %950
  %952 = bitcast i64 %951 to double
  br label %970

953:                                              ; preds = %933
  %954 = load double, ptr %936, align 8, !tbaa !6
  %955 = getelementptr inbounds i8, ptr %938, i32 8
  %956 = load i8, ptr %955, align 8, !tbaa !2
  br label %959

957:                                              ; preds = %944
  %958 = sitofp i64 %948 to double
  br label %959

959:                                              ; preds = %953, %957
  %960 = phi i8 [ %956, %953 ], [ %946, %957 ]
  %961 = phi double [ %954, %953 ], [ %958, %957 ]
  switch i8 %960, label %975 [
    i8 19, label %962
    i8 3, label %964
  ]

962:                                              ; preds = %959
  %963 = load double, ptr %938, align 8, !tbaa !6
  br label %967

964:                                              ; preds = %959
  %965 = load i64, ptr %938, align 8, !tbaa !6
  %966 = sitofp i64 %965 to double
  br label %967

967:                                              ; preds = %962, %964
  %968 = phi double [ %963, %962 ], [ %966, %964 ]
  %969 = fsub double %961, %968
  br label %970

970:                                              ; preds = %949, %967
  %971 = phi double [ %969, %967 ], [ %952, %949 ]
  %972 = phi i8 [ 19, %967 ], [ 3, %949 ]
  %973 = getelementptr inbounds i8, ptr %3246, i32 4
  store double %971, ptr %941, align 8, !tbaa !6
  %974 = getelementptr inbounds i8, ptr %941, i32 8
  store i8 %972, ptr %974, align 8, !tbaa !2
  br label %975

975:                                              ; preds = %970, %933, %959
  %976 = phi ptr [ %3246, %959 ], [ %3246, %933 ], [ %973, %970 ]
  %977 = icmp eq i32 %3245, 0
  br i1 %977, label %982, label %978, !prof !27

978:                                              ; preds = %975
  %979 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %976) #12
  %980 = load ptr, ptr %29, align 4, !tbaa !6
  %981 = getelementptr inbounds i8, ptr %980, i32 16
  br label %982

982:                                              ; preds = %978, %975
  %983 = phi i32 [ %979, %978 ], [ 0, %975 ]
  %984 = phi ptr [ %981, %978 ], [ %3247, %975 ]
  %985 = getelementptr inbounds i8, ptr %976, i32 4
  br label %72

986:                                              ; preds = %3243
  %987 = lshr i32 %3248, 16
  %988 = and i32 %987, 255
  %989 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %988
  %990 = lshr i32 %3248, 24
  %991 = getelementptr inbounds %struct.TValue, ptr %35, i32 %990
  %992 = lshr i32 %3248, 7
  %993 = and i32 %992, 255
  %994 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %993
  %995 = getelementptr inbounds i8, ptr %989, i32 8
  %996 = load i8, ptr %995, align 8, !tbaa !2
  switch i8 %996, label %1028 [
    i8 3, label %997
    i8 19, label %1006
  ]

997:                                              ; preds = %986
  %998 = getelementptr inbounds i8, ptr %991, i32 8
  %999 = load i8, ptr %998, align 8, !tbaa !2
  %1000 = icmp eq i8 %999, 3
  %1001 = load i64, ptr %989, align 8, !tbaa !6
  br i1 %1000, label %1002, label %1010

1002:                                             ; preds = %997
  %1003 = load i64, ptr %991, align 8, !tbaa !6
  %1004 = mul i64 %1003, %1001
  %1005 = bitcast i64 %1004 to double
  br label %1023

1006:                                             ; preds = %986
  %1007 = load double, ptr %989, align 8, !tbaa !6
  %1008 = getelementptr inbounds i8, ptr %991, i32 8
  %1009 = load i8, ptr %1008, align 8, !tbaa !2
  br label %1012

1010:                                             ; preds = %997
  %1011 = sitofp i64 %1001 to double
  br label %1012

1012:                                             ; preds = %1006, %1010
  %1013 = phi i8 [ %1009, %1006 ], [ %999, %1010 ]
  %1014 = phi double [ %1007, %1006 ], [ %1011, %1010 ]
  switch i8 %1013, label %1028 [
    i8 19, label %1015
    i8 3, label %1017
  ]

1015:                                             ; preds = %1012
  %1016 = load double, ptr %991, align 8, !tbaa !6
  br label %1020

1017:                                             ; preds = %1012
  %1018 = load i64, ptr %991, align 8, !tbaa !6
  %1019 = sitofp i64 %1018 to double
  br label %1020

1020:                                             ; preds = %1015, %1017
  %1021 = phi double [ %1016, %1015 ], [ %1019, %1017 ]
  %1022 = fmul double %1014, %1021
  br label %1023

1023:                                             ; preds = %1002, %1020
  %1024 = phi double [ %1022, %1020 ], [ %1005, %1002 ]
  %1025 = phi i8 [ 19, %1020 ], [ 3, %1002 ]
  %1026 = getelementptr inbounds i8, ptr %3246, i32 4
  store double %1024, ptr %994, align 8, !tbaa !6
  %1027 = getelementptr inbounds i8, ptr %994, i32 8
  store i8 %1025, ptr %1027, align 8, !tbaa !2
  br label %1028

1028:                                             ; preds = %1023, %986, %1012
  %1029 = phi ptr [ %3246, %1012 ], [ %3246, %986 ], [ %1026, %1023 ]
  %1030 = icmp eq i32 %3245, 0
  br i1 %1030, label %1035, label %1031, !prof !27

1031:                                             ; preds = %1028
  %1032 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1029) #12
  %1033 = load ptr, ptr %29, align 4, !tbaa !6
  %1034 = getelementptr inbounds i8, ptr %1033, i32 16
  br label %1035

1035:                                             ; preds = %1031, %1028
  %1036 = phi i32 [ %1032, %1031 ], [ 0, %1028 ]
  %1037 = phi ptr [ %1034, %1031 ], [ %3247, %1028 ]
  %1038 = getelementptr inbounds i8, ptr %1029, i32 4
  br label %72

1039:                                             ; preds = %3243
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %1040 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %1040, ptr %12, align 4, !tbaa !6
  %1041 = lshr i32 %3248, 16
  %1042 = and i32 %1041, 255
  %1043 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1042
  %1044 = lshr i32 %3248, 24
  %1045 = getelementptr inbounds %struct.TValue, ptr %35, i32 %1044
  %1046 = lshr i32 %3248, 7
  %1047 = and i32 %1046, 255
  %1048 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1047
  %1049 = getelementptr inbounds i8, ptr %1043, i32 8
  %1050 = load i8, ptr %1049, align 8, !tbaa !2
  switch i8 %1050, label %1106 [
    i8 3, label %1051
    i8 19, label %1074
  ]

1051:                                             ; preds = %1039
  %1052 = getelementptr inbounds i8, ptr %1045, i32 8
  %1053 = load i8, ptr %1052, align 8, !tbaa !2
  %1054 = icmp eq i8 %1053, 3
  br i1 %1054, label %1055, label %1078

1055:                                             ; preds = %1051
  %1056 = load i64, ptr %1045, align 8, !tbaa !6
  %1057 = add i64 %1056, 1
  %1058 = icmp ult i64 %1057, 2
  br i1 %1058, label %1059, label %1062, !prof !15

1059:                                             ; preds = %1055
  %1060 = icmp eq i64 %1056, 0
  br i1 %1060, label %1061, label %1071

1061:                                             ; preds = %1059
  call void (ptr, ptr, ...) @luaG_runerror(ptr noundef nonnull %0, ptr noundef nonnull @.str.6) #13
  unreachable

1062:                                             ; preds = %1055
  %1063 = load i64, ptr %1043, align 8, !tbaa !6
  %1064 = srem i64 %1063, %1056
  %1065 = icmp eq i64 %1064, 0
  br i1 %1065, label %1071, label %1066

1066:                                             ; preds = %1062
  %1067 = xor i64 %1064, %1056
  %1068 = icmp slt i64 %1067, 0
  %1069 = select i1 %1068, i64 %1056, i64 0
  %1070 = add nsw i64 %1069, %1064
  br label %1071

1071:                                             ; preds = %1059, %1062, %1066
  %1072 = phi i64 [ 0, %1059 ], [ 0, %1062 ], [ %1070, %1066 ]
  %1073 = bitcast i64 %1072 to double
  br label %1101

1074:                                             ; preds = %1039
  %1075 = load double, ptr %1043, align 8, !tbaa !6
  %1076 = getelementptr inbounds i8, ptr %1045, i32 8
  %1077 = load i8, ptr %1076, align 8, !tbaa !2
  br label %1081

1078:                                             ; preds = %1051
  %1079 = load i64, ptr %1043, align 8, !tbaa !6
  %1080 = sitofp i64 %1079 to double
  br label %1081

1081:                                             ; preds = %1074, %1078
  %1082 = phi i8 [ %1077, %1074 ], [ %1053, %1078 ]
  %1083 = phi double [ %1075, %1074 ], [ %1080, %1078 ]
  switch i8 %1082, label %1106 [
    i8 19, label %1084
    i8 3, label %1086
  ]

1084:                                             ; preds = %1081
  %1085 = load double, ptr %1045, align 8, !tbaa !6
  br label %1089

1086:                                             ; preds = %1081
  %1087 = load i64, ptr %1045, align 8, !tbaa !6
  %1088 = sitofp i64 %1087 to double
  br label %1089

1089:                                             ; preds = %1084, %1086
  %1090 = phi double [ %1085, %1084 ], [ %1088, %1086 ]
  %1091 = frem double %1083, %1090
  %1092 = fcmp ogt double %1091, 0.000000e+00
  br i1 %1092, label %1093, label %1095

1093:                                             ; preds = %1089
  %1094 = fcmp olt double %1090, 0.000000e+00
  br i1 %1094, label %1099, label %1101

1095:                                             ; preds = %1089
  %1096 = fcmp olt double %1091, 0.000000e+00
  %1097 = fcmp ogt double %1090, 0.000000e+00
  %1098 = and i1 %1097, %1096
  br i1 %1098, label %1099, label %1101

1099:                                             ; preds = %1095, %1093
  %1100 = fadd double %1090, %1091
  br label %1101

1101:                                             ; preds = %1099, %1095, %1093, %1071
  %1102 = phi double [ %1073, %1071 ], [ %1100, %1099 ], [ %1091, %1093 ], [ %1091, %1095 ]
  %1103 = phi i8 [ 3, %1071 ], [ 19, %1099 ], [ 19, %1093 ], [ 19, %1095 ]
  %1104 = getelementptr inbounds i8, ptr %3246, i32 4
  store double %1102, ptr %1048, align 8, !tbaa !6
  %1105 = getelementptr inbounds i8, ptr %1048, i32 8
  store i8 %1103, ptr %1105, align 8, !tbaa !2
  br label %1106

1106:                                             ; preds = %1101, %1039, %1081
  %1107 = phi ptr [ %3246, %1081 ], [ %3246, %1039 ], [ %1104, %1101 ]
  %1108 = icmp eq i32 %3245, 0
  br i1 %1108, label %1113, label %1109, !prof !27

1109:                                             ; preds = %1106
  %1110 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %1107) #12
  %1111 = load ptr, ptr %29, align 4, !tbaa !6
  %1112 = getelementptr inbounds i8, ptr %1111, i32 16
  br label %1113

1113:                                             ; preds = %1109, %1106
  %1114 = phi i32 [ %1110, %1109 ], [ 0, %1106 ]
  %1115 = phi ptr [ %1112, %1109 ], [ %3247, %1106 ]
  %1116 = getelementptr inbounds i8, ptr %1107, i32 4
  br label %72

1117:                                             ; preds = %3243
  %1118 = lshr i32 %3248, 7
  %1119 = and i32 %1118, 255
  %1120 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1119
  %1121 = lshr i32 %3248, 16
  %1122 = and i32 %1121, 255
  %1123 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1122
  %1124 = lshr i32 %3248, 24
  %1125 = getelementptr inbounds %struct.TValue, ptr %35, i32 %1124
  %1126 = getelementptr inbounds i8, ptr %1123, i32 8
  %1127 = load i8, ptr %1126, align 8, !tbaa !2
  switch i8 %1127, label %1150 [
    i8 19, label %1128
    i8 3, label %1130
  ]

1128:                                             ; preds = %1117
  %1129 = load double, ptr %1123, align 8, !tbaa !6
  br label %1133

1130:                                             ; preds = %1117
  %1131 = load i64, ptr %1123, align 8, !tbaa !6
  %1132 = sitofp i64 %1131 to double
  br label %1133

1133:                                             ; preds = %1128, %1130
  %1134 = phi double [ %1129, %1128 ], [ %1132, %1130 ]
  %1135 = getelementptr inbounds i8, ptr %1125, i32 8
  %1136 = load i8, ptr %1135, align 8, !tbaa !2
  switch i8 %1136, label %1150 [
    i8 19, label %1137
    i8 3, label %1139
  ]

1137:                                             ; preds = %1133
  %1138 = load double, ptr %1125, align 8, !tbaa !6
  br label %1142

1139:                                             ; preds = %1133
  %1140 = load i64, ptr %1125, align 8, !tbaa !6
  %1141 = sitofp i64 %1140 to double
  br label %1142

1142:                                             ; preds = %1137, %1139
  %1143 = phi double [ %1138, %1137 ], [ %1141, %1139 ]
  %1144 = getelementptr inbounds i8, ptr %3246, i32 4
  %1145 = fcmp oeq double %1143, 2.000000e+00
  %1146 = fmul double %1134, %1134
  %1147 = call double @llvm.pow.f64(double %1134, double %1143)
  %1148 = select i1 %1145, double %1146, double %1147
  store double %1148, ptr %1120, align 8, !tbaa !6
  %1149 = getelementptr inbounds i8, ptr %1120, i32 8
  store i8 19, ptr %1149, align 8, !tbaa !2
  br label %1150

1150:                                             ; preds = %1133, %1117, %1142
  %1151 = phi ptr [ %1144, %1142 ], [ %3246, %1117 ], [ %3246, %1133 ]
  %1152 = icmp eq i32 %3245, 0
  br i1 %1152, label %1157, label %1153, !prof !27

1153:                                             ; preds = %1150
  %1154 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1151) #12
  %1155 = load ptr, ptr %29, align 4, !tbaa !6
  %1156 = getelementptr inbounds i8, ptr %1155, i32 16
  br label %1157

1157:                                             ; preds = %1153, %1150
  %1158 = phi i32 [ %1154, %1153 ], [ 0, %1150 ]
  %1159 = phi ptr [ %1156, %1153 ], [ %3247, %1150 ]
  %1160 = getelementptr inbounds i8, ptr %1151, i32 4
  br label %72

1161:                                             ; preds = %3243
  %1162 = lshr i32 %3248, 7
  %1163 = and i32 %1162, 255
  %1164 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1163
  %1165 = lshr i32 %3248, 16
  %1166 = and i32 %1165, 255
  %1167 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1166
  %1168 = lshr i32 %3248, 24
  %1169 = getelementptr inbounds %struct.TValue, ptr %35, i32 %1168
  %1170 = getelementptr inbounds i8, ptr %1167, i32 8
  %1171 = load i8, ptr %1170, align 8, !tbaa !2
  switch i8 %1171, label %1191 [
    i8 19, label %1172
    i8 3, label %1174
  ]

1172:                                             ; preds = %1161
  %1173 = load double, ptr %1167, align 8, !tbaa !6
  br label %1177

1174:                                             ; preds = %1161
  %1175 = load i64, ptr %1167, align 8, !tbaa !6
  %1176 = sitofp i64 %1175 to double
  br label %1177

1177:                                             ; preds = %1172, %1174
  %1178 = phi double [ %1173, %1172 ], [ %1176, %1174 ]
  %1179 = getelementptr inbounds i8, ptr %1169, i32 8
  %1180 = load i8, ptr %1179, align 8, !tbaa !2
  switch i8 %1180, label %1191 [
    i8 19, label %1181
    i8 3, label %1183
  ]

1181:                                             ; preds = %1177
  %1182 = load double, ptr %1169, align 8, !tbaa !6
  br label %1186

1183:                                             ; preds = %1177
  %1184 = load i64, ptr %1169, align 8, !tbaa !6
  %1185 = sitofp i64 %1184 to double
  br label %1186

1186:                                             ; preds = %1181, %1183
  %1187 = phi double [ %1182, %1181 ], [ %1185, %1183 ]
  %1188 = getelementptr inbounds i8, ptr %3246, i32 4
  %1189 = fdiv double %1178, %1187
  store double %1189, ptr %1164, align 8, !tbaa !6
  %1190 = getelementptr inbounds i8, ptr %1164, i32 8
  store i8 19, ptr %1190, align 8, !tbaa !2
  br label %1191

1191:                                             ; preds = %1177, %1161, %1186
  %1192 = phi ptr [ %1188, %1186 ], [ %3246, %1161 ], [ %3246, %1177 ]
  %1193 = icmp eq i32 %3245, 0
  br i1 %1193, label %1198, label %1194, !prof !27

1194:                                             ; preds = %1191
  %1195 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1192) #12
  %1196 = load ptr, ptr %29, align 4, !tbaa !6
  %1197 = getelementptr inbounds i8, ptr %1196, i32 16
  br label %1198

1198:                                             ; preds = %1194, %1191
  %1199 = phi i32 [ %1195, %1194 ], [ 0, %1191 ]
  %1200 = phi ptr [ %1197, %1194 ], [ %3247, %1191 ]
  %1201 = getelementptr inbounds i8, ptr %1192, i32 4
  br label %72

1202:                                             ; preds = %3243
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %1203 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %1203, ptr %12, align 4, !tbaa !6
  %1204 = lshr i32 %3248, 16
  %1205 = and i32 %1204, 255
  %1206 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1205
  %1207 = lshr i32 %3248, 24
  %1208 = getelementptr inbounds %struct.TValue, ptr %35, i32 %1207
  %1209 = lshr i32 %3248, 7
  %1210 = and i32 %1209, 255
  %1211 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1210
  %1212 = getelementptr inbounds i8, ptr %1206, i32 8
  %1213 = load i8, ptr %1212, align 8, !tbaa !2
  switch i8 %1213, label %1266 [
    i8 3, label %1214
    i8 19, label %1243
  ]

1214:                                             ; preds = %1202
  %1215 = getelementptr inbounds i8, ptr %1208, i32 8
  %1216 = load i8, ptr %1215, align 8, !tbaa !2
  %1217 = icmp eq i8 %1216, 3
  %1218 = load i64, ptr %1206, align 8, !tbaa !6
  br i1 %1217, label %1219, label %1247

1219:                                             ; preds = %1214
  %1220 = load i64, ptr %1208, align 8, !tbaa !6
  %1221 = add i64 %1220, 1
  %1222 = icmp ult i64 %1221, 2
  br i1 %1222, label %1223, label %1228, !prof !15

1223:                                             ; preds = %1219
  %1224 = icmp eq i64 %1220, 0
  br i1 %1224, label %1225, label %1226

1225:                                             ; preds = %1223
  call void (ptr, ptr, ...) @luaG_runerror(ptr noundef nonnull %0, ptr noundef nonnull @.str.5) #13
  unreachable

1226:                                             ; preds = %1223
  %1227 = sub i64 0, %1218
  br label %1240

1228:                                             ; preds = %1219
  %1229 = freeze i64 %1218
  %1230 = freeze i64 %1220
  %1231 = sdiv i64 %1229, %1230
  %1232 = xor i64 %1220, %1218
  %1233 = icmp slt i64 %1232, 0
  br i1 %1233, label %1234, label %1240

1234:                                             ; preds = %1228
  %1235 = mul i64 %1231, %1230
  %1236 = sub i64 %1229, %1235
  %1237 = icmp ne i64 %1236, 0
  %1238 = sext i1 %1237 to i64
  %1239 = add nsw i64 %1231, %1238
  br label %1240

1240:                                             ; preds = %1226, %1228, %1234
  %1241 = phi i64 [ %1227, %1226 ], [ %1231, %1228 ], [ %1239, %1234 ]
  %1242 = bitcast i64 %1241 to double
  br label %1261

1243:                                             ; preds = %1202
  %1244 = load double, ptr %1206, align 8, !tbaa !6
  %1245 = getelementptr inbounds i8, ptr %1208, i32 8
  %1246 = load i8, ptr %1245, align 8, !tbaa !2
  br label %1249

1247:                                             ; preds = %1214
  %1248 = sitofp i64 %1218 to double
  br label %1249

1249:                                             ; preds = %1243, %1247
  %1250 = phi i8 [ %1246, %1243 ], [ %1216, %1247 ]
  %1251 = phi double [ %1244, %1243 ], [ %1248, %1247 ]
  switch i8 %1250, label %1266 [
    i8 19, label %1252
    i8 3, label %1254
  ]

1252:                                             ; preds = %1249
  %1253 = load double, ptr %1208, align 8, !tbaa !6
  br label %1257

1254:                                             ; preds = %1249
  %1255 = load i64, ptr %1208, align 8, !tbaa !6
  %1256 = sitofp i64 %1255 to double
  br label %1257

1257:                                             ; preds = %1252, %1254
  %1258 = phi double [ %1253, %1252 ], [ %1256, %1254 ]
  %1259 = fdiv double %1251, %1258
  %1260 = call double @llvm.floor.f64(double %1259)
  br label %1261

1261:                                             ; preds = %1240, %1257
  %1262 = phi double [ %1260, %1257 ], [ %1242, %1240 ]
  %1263 = phi i8 [ 19, %1257 ], [ 3, %1240 ]
  %1264 = getelementptr inbounds i8, ptr %3246, i32 4
  store double %1262, ptr %1211, align 8, !tbaa !6
  %1265 = getelementptr inbounds i8, ptr %1211, i32 8
  store i8 %1263, ptr %1265, align 8, !tbaa !2
  br label %1266

1266:                                             ; preds = %1261, %1202, %1249
  %1267 = phi ptr [ %3246, %1249 ], [ %3246, %1202 ], [ %1264, %1261 ]
  %1268 = icmp eq i32 %3245, 0
  br i1 %1268, label %1273, label %1269, !prof !27

1269:                                             ; preds = %1266
  %1270 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %1267) #12
  %1271 = load ptr, ptr %29, align 4, !tbaa !6
  %1272 = getelementptr inbounds i8, ptr %1271, i32 16
  br label %1273

1273:                                             ; preds = %1269, %1266
  %1274 = phi i32 [ %1270, %1269 ], [ 0, %1266 ]
  %1275 = phi ptr [ %1272, %1269 ], [ %3247, %1266 ]
  %1276 = getelementptr inbounds i8, ptr %1267, i32 4
  br label %72

1277:                                             ; preds = %3243
  %1278 = lshr i32 %3248, 7
  %1279 = and i32 %1278, 255
  %1280 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1279
  %1281 = lshr i32 %3248, 16
  %1282 = and i32 %1281, 255
  %1283 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1282
  %1284 = lshr i32 %3248, 24
  %1285 = getelementptr inbounds %struct.TValue, ptr %35, i32 %1284
  %1286 = load i64, ptr %1285, align 8, !tbaa !6
  %1287 = getelementptr inbounds i8, ptr %1283, i32 8
  %1288 = load i8, ptr %1287, align 8, !tbaa !2
  switch i8 %1288, label %1306 [
    i8 3, label %1289
    i8 19, label %1291
  ], !prof !42

1289:                                             ; preds = %1277
  %1290 = load i64, ptr %1283, align 8, !tbaa !6
  br label %1301

1291:                                             ; preds = %1277
  %1292 = load double, ptr %1283, align 8, !tbaa !6
  %1293 = call double @llvm.floor.f64(double %1292)
  %1294 = fcmp une double %1293, %1292
  br i1 %1294, label %1306, label %1295

1295:                                             ; preds = %1291
  %1296 = fcmp oge double %1293, 0xC3E0000000000000
  %1297 = fcmp olt double %1293, 0x43E0000000000000
  %1298 = and i1 %1296, %1297
  br i1 %1298, label %1299, label %1306

1299:                                             ; preds = %1295
  %1300 = fptosi double %1293 to i64
  br label %1301

1301:                                             ; preds = %1299, %1289
  %1302 = phi i64 [ %1290, %1289 ], [ %1300, %1299 ]
  %1303 = getelementptr inbounds i8, ptr %3246, i32 4
  %1304 = and i64 %1302, %1286
  store i64 %1304, ptr %1280, align 8, !tbaa !6
  %1305 = getelementptr inbounds i8, ptr %1280, i32 8
  store i8 3, ptr %1305, align 8, !tbaa !2
  br label %1306

1306:                                             ; preds = %1277, %1291, %1295, %1301
  %1307 = phi ptr [ %1303, %1301 ], [ %3246, %1295 ], [ %3246, %1291 ], [ %3246, %1277 ]
  %1308 = icmp eq i32 %3245, 0
  br i1 %1308, label %1313, label %1309, !prof !27

1309:                                             ; preds = %1306
  %1310 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1307) #12
  %1311 = load ptr, ptr %29, align 4, !tbaa !6
  %1312 = getelementptr inbounds i8, ptr %1311, i32 16
  br label %1313

1313:                                             ; preds = %1309, %1306
  %1314 = phi i32 [ %1310, %1309 ], [ 0, %1306 ]
  %1315 = phi ptr [ %1312, %1309 ], [ %3247, %1306 ]
  %1316 = getelementptr inbounds i8, ptr %1307, i32 4
  br label %72

1317:                                             ; preds = %3243
  %1318 = lshr i32 %3248, 7
  %1319 = and i32 %1318, 255
  %1320 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1319
  %1321 = lshr i32 %3248, 16
  %1322 = and i32 %1321, 255
  %1323 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1322
  %1324 = lshr i32 %3248, 24
  %1325 = getelementptr inbounds %struct.TValue, ptr %35, i32 %1324
  %1326 = load i64, ptr %1325, align 8, !tbaa !6
  %1327 = getelementptr inbounds i8, ptr %1323, i32 8
  %1328 = load i8, ptr %1327, align 8, !tbaa !2
  switch i8 %1328, label %1346 [
    i8 3, label %1329
    i8 19, label %1331
  ], !prof !42

1329:                                             ; preds = %1317
  %1330 = load i64, ptr %1323, align 8, !tbaa !6
  br label %1341

1331:                                             ; preds = %1317
  %1332 = load double, ptr %1323, align 8, !tbaa !6
  %1333 = call double @llvm.floor.f64(double %1332)
  %1334 = fcmp une double %1333, %1332
  br i1 %1334, label %1346, label %1335

1335:                                             ; preds = %1331
  %1336 = fcmp oge double %1333, 0xC3E0000000000000
  %1337 = fcmp olt double %1333, 0x43E0000000000000
  %1338 = and i1 %1336, %1337
  br i1 %1338, label %1339, label %1346

1339:                                             ; preds = %1335
  %1340 = fptosi double %1333 to i64
  br label %1341

1341:                                             ; preds = %1339, %1329
  %1342 = phi i64 [ %1330, %1329 ], [ %1340, %1339 ]
  %1343 = getelementptr inbounds i8, ptr %3246, i32 4
  %1344 = or i64 %1342, %1326
  store i64 %1344, ptr %1320, align 8, !tbaa !6
  %1345 = getelementptr inbounds i8, ptr %1320, i32 8
  store i8 3, ptr %1345, align 8, !tbaa !2
  br label %1346

1346:                                             ; preds = %1317, %1331, %1335, %1341
  %1347 = phi ptr [ %1343, %1341 ], [ %3246, %1335 ], [ %3246, %1331 ], [ %3246, %1317 ]
  %1348 = icmp eq i32 %3245, 0
  br i1 %1348, label %1353, label %1349, !prof !27

1349:                                             ; preds = %1346
  %1350 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1347) #12
  %1351 = load ptr, ptr %29, align 4, !tbaa !6
  %1352 = getelementptr inbounds i8, ptr %1351, i32 16
  br label %1353

1353:                                             ; preds = %1349, %1346
  %1354 = phi i32 [ %1350, %1349 ], [ 0, %1346 ]
  %1355 = phi ptr [ %1352, %1349 ], [ %3247, %1346 ]
  %1356 = getelementptr inbounds i8, ptr %1347, i32 4
  br label %72

1357:                                             ; preds = %3243
  %1358 = lshr i32 %3248, 7
  %1359 = and i32 %1358, 255
  %1360 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1359
  %1361 = lshr i32 %3248, 16
  %1362 = and i32 %1361, 255
  %1363 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1362
  %1364 = lshr i32 %3248, 24
  %1365 = getelementptr inbounds %struct.TValue, ptr %35, i32 %1364
  %1366 = load i64, ptr %1365, align 8, !tbaa !6
  %1367 = getelementptr inbounds i8, ptr %1363, i32 8
  %1368 = load i8, ptr %1367, align 8, !tbaa !2
  switch i8 %1368, label %1386 [
    i8 3, label %1369
    i8 19, label %1371
  ], !prof !42

1369:                                             ; preds = %1357
  %1370 = load i64, ptr %1363, align 8, !tbaa !6
  br label %1381

1371:                                             ; preds = %1357
  %1372 = load double, ptr %1363, align 8, !tbaa !6
  %1373 = call double @llvm.floor.f64(double %1372)
  %1374 = fcmp une double %1373, %1372
  br i1 %1374, label %1386, label %1375

1375:                                             ; preds = %1371
  %1376 = fcmp oge double %1373, 0xC3E0000000000000
  %1377 = fcmp olt double %1373, 0x43E0000000000000
  %1378 = and i1 %1376, %1377
  br i1 %1378, label %1379, label %1386

1379:                                             ; preds = %1375
  %1380 = fptosi double %1373 to i64
  br label %1381

1381:                                             ; preds = %1379, %1369
  %1382 = phi i64 [ %1370, %1369 ], [ %1380, %1379 ]
  %1383 = getelementptr inbounds i8, ptr %3246, i32 4
  %1384 = xor i64 %1382, %1366
  store i64 %1384, ptr %1360, align 8, !tbaa !6
  %1385 = getelementptr inbounds i8, ptr %1360, i32 8
  store i8 3, ptr %1385, align 8, !tbaa !2
  br label %1386

1386:                                             ; preds = %1357, %1371, %1375, %1381
  %1387 = phi ptr [ %1383, %1381 ], [ %3246, %1375 ], [ %3246, %1371 ], [ %3246, %1357 ]
  %1388 = icmp eq i32 %3245, 0
  br i1 %1388, label %1393, label %1389, !prof !27

1389:                                             ; preds = %1386
  %1390 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1387) #12
  %1391 = load ptr, ptr %29, align 4, !tbaa !6
  %1392 = getelementptr inbounds i8, ptr %1391, i32 16
  br label %1393

1393:                                             ; preds = %1389, %1386
  %1394 = phi i32 [ %1390, %1389 ], [ 0, %1386 ]
  %1395 = phi ptr [ %1392, %1389 ], [ %3247, %1386 ]
  %1396 = getelementptr inbounds i8, ptr %1387, i32 4
  br label %72

1397:                                             ; preds = %3243
  %1398 = lshr i32 %3248, 7
  %1399 = and i32 %1398, 255
  %1400 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1399
  %1401 = lshr i32 %3248, 16
  %1402 = and i32 %1401, 255
  %1403 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1402
  %1404 = lshr i32 %3248, 24
  %1405 = getelementptr inbounds i8, ptr %1403, i32 8
  %1406 = load i8, ptr %1405, align 8, !tbaa !2
  switch i8 %1406, label %1437 [
    i8 3, label %1407
    i8 19, label %1409
  ], !prof !42

1407:                                             ; preds = %1397
  %1408 = load i64, ptr %1403, align 8, !tbaa !6
  br label %1419

1409:                                             ; preds = %1397
  %1410 = load double, ptr %1403, align 8, !tbaa !6
  %1411 = call double @llvm.floor.f64(double %1410)
  %1412 = fcmp une double %1411, %1410
  br i1 %1412, label %1437, label %1413

1413:                                             ; preds = %1409
  %1414 = fcmp oge double %1411, 0xC3E0000000000000
  %1415 = fcmp olt double %1411, 0x43E0000000000000
  %1416 = and i1 %1414, %1415
  br i1 %1416, label %1417, label %1437

1417:                                             ; preds = %1413
  %1418 = fptosi double %1411 to i64
  br label %1419

1419:                                             ; preds = %1417, %1407
  %1420 = phi i64 [ %1408, %1407 ], [ %1418, %1417 ]
  %1421 = getelementptr inbounds i8, ptr %3246, i32 4
  %1422 = sub nsw i32 127, %1404
  %1423 = sext i32 %1422 to i64
  %1424 = icmp slt i32 %3248, 0
  br i1 %1424, label %1425, label %1430

1425:                                             ; preds = %1419
  %1426 = icmp ult i32 %1422, -63
  br i1 %1426, label %1434, label %1427

1427:                                             ; preds = %1425
  %1428 = sub nsw i64 0, %1423
  %1429 = lshr i64 %1420, %1428
  br label %1434

1430:                                             ; preds = %1419
  %1431 = icmp ugt i32 %1422, 63
  %1432 = shl i64 %1420, %1423
  %1433 = select i1 %1431, i64 0, i64 %1432
  br label %1434

1434:                                             ; preds = %1425, %1427, %1430
  %1435 = phi i64 [ %1429, %1427 ], [ 0, %1425 ], [ %1433, %1430 ]
  store i64 %1435, ptr %1400, align 8, !tbaa !6
  %1436 = getelementptr inbounds i8, ptr %1400, i32 8
  store i8 3, ptr %1436, align 8, !tbaa !2
  br label %1437

1437:                                             ; preds = %1397, %1409, %1413, %1434
  %1438 = phi ptr [ %1421, %1434 ], [ %3246, %1413 ], [ %3246, %1409 ], [ %3246, %1397 ]
  %1439 = icmp eq i32 %3245, 0
  br i1 %1439, label %1444, label %1440, !prof !27

1440:                                             ; preds = %1437
  %1441 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1438) #12
  %1442 = load ptr, ptr %29, align 4, !tbaa !6
  %1443 = getelementptr inbounds i8, ptr %1442, i32 16
  br label %1444

1444:                                             ; preds = %1440, %1437
  %1445 = phi i32 [ %1441, %1440 ], [ 0, %1437 ]
  %1446 = phi ptr [ %1443, %1440 ], [ %3247, %1437 ]
  %1447 = getelementptr inbounds i8, ptr %1438, i32 4
  br label %72

1448:                                             ; preds = %3243
  %1449 = lshr i32 %3248, 7
  %1450 = and i32 %1449, 255
  %1451 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1450
  %1452 = lshr i32 %3248, 16
  %1453 = and i32 %1452, 255
  %1454 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1453
  %1455 = lshr i32 %3248, 24
  %1456 = add nsw i32 %1455, -127
  %1457 = getelementptr inbounds i8, ptr %1454, i32 8
  %1458 = load i8, ptr %1457, align 8, !tbaa !2
  switch i8 %1458, label %1488 [
    i8 3, label %1459
    i8 19, label %1461
  ], !prof !42

1459:                                             ; preds = %1448
  %1460 = load i64, ptr %1454, align 8, !tbaa !6
  br label %1471

1461:                                             ; preds = %1448
  %1462 = load double, ptr %1454, align 8, !tbaa !6
  %1463 = call double @llvm.floor.f64(double %1462)
  %1464 = fcmp une double %1463, %1462
  br i1 %1464, label %1488, label %1465

1465:                                             ; preds = %1461
  %1466 = fcmp oge double %1463, 0xC3E0000000000000
  %1467 = fcmp olt double %1463, 0x43E0000000000000
  %1468 = and i1 %1466, %1467
  br i1 %1468, label %1469, label %1488

1469:                                             ; preds = %1465
  %1470 = fptosi double %1463 to i64
  br label %1471

1471:                                             ; preds = %1469, %1459
  %1472 = phi i64 [ %1460, %1459 ], [ %1470, %1469 ]
  %1473 = getelementptr inbounds i8, ptr %3246, i32 4
  %1474 = sext i32 %1456 to i64
  %1475 = icmp slt i64 %1472, 0
  br i1 %1475, label %1476, label %1481

1476:                                             ; preds = %1471
  %1477 = icmp ult i64 %1472, -63
  br i1 %1477, label %1485, label %1478

1478:                                             ; preds = %1476
  %1479 = sub nsw i64 0, %1472
  %1480 = lshr i64 %1474, %1479
  br label %1485

1481:                                             ; preds = %1471
  %1482 = icmp ugt i64 %1472, 63
  %1483 = shl i64 %1474, %1472
  %1484 = select i1 %1482, i64 0, i64 %1483
  br label %1485

1485:                                             ; preds = %1476, %1478, %1481
  %1486 = phi i64 [ %1480, %1478 ], [ 0, %1476 ], [ %1484, %1481 ]
  store i64 %1486, ptr %1451, align 8, !tbaa !6
  %1487 = getelementptr inbounds i8, ptr %1451, i32 8
  store i8 3, ptr %1487, align 8, !tbaa !2
  br label %1488

1488:                                             ; preds = %1448, %1461, %1465, %1485
  %1489 = phi ptr [ %1473, %1485 ], [ %3246, %1465 ], [ %3246, %1461 ], [ %3246, %1448 ]
  %1490 = icmp eq i32 %3245, 0
  br i1 %1490, label %1495, label %1491, !prof !27

1491:                                             ; preds = %1488
  %1492 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1489) #12
  %1493 = load ptr, ptr %29, align 4, !tbaa !6
  %1494 = getelementptr inbounds i8, ptr %1493, i32 16
  br label %1495

1495:                                             ; preds = %1491, %1488
  %1496 = phi i32 [ %1492, %1491 ], [ 0, %1488 ]
  %1497 = phi ptr [ %1494, %1491 ], [ %3247, %1488 ]
  %1498 = getelementptr inbounds i8, ptr %1489, i32 4
  br label %72

1499:                                             ; preds = %3243
  %1500 = lshr i32 %3248, 16
  %1501 = and i32 %1500, 255
  %1502 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1501
  %1503 = lshr i32 %3248, 24
  %1504 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1503
  %1505 = lshr i32 %3248, 7
  %1506 = and i32 %1505, 255
  %1507 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1506
  %1508 = getelementptr inbounds i8, ptr %1502, i32 8
  %1509 = load i8, ptr %1508, align 8, !tbaa !2
  switch i8 %1509, label %1541 [
    i8 3, label %1510
    i8 19, label %1519
  ]

1510:                                             ; preds = %1499
  %1511 = getelementptr inbounds i8, ptr %1504, i32 8
  %1512 = load i8, ptr %1511, align 8, !tbaa !2
  %1513 = icmp eq i8 %1512, 3
  %1514 = load i64, ptr %1502, align 8, !tbaa !6
  br i1 %1513, label %1515, label %1523

1515:                                             ; preds = %1510
  %1516 = load i64, ptr %1504, align 8, !tbaa !6
  %1517 = add i64 %1516, %1514
  %1518 = bitcast i64 %1517 to double
  br label %1536

1519:                                             ; preds = %1499
  %1520 = load double, ptr %1502, align 8, !tbaa !6
  %1521 = getelementptr inbounds i8, ptr %1504, i32 8
  %1522 = load i8, ptr %1521, align 8, !tbaa !2
  br label %1525

1523:                                             ; preds = %1510
  %1524 = sitofp i64 %1514 to double
  br label %1525

1525:                                             ; preds = %1519, %1523
  %1526 = phi i8 [ %1522, %1519 ], [ %1512, %1523 ]
  %1527 = phi double [ %1520, %1519 ], [ %1524, %1523 ]
  switch i8 %1526, label %1541 [
    i8 19, label %1528
    i8 3, label %1530
  ]

1528:                                             ; preds = %1525
  %1529 = load double, ptr %1504, align 8, !tbaa !6
  br label %1533

1530:                                             ; preds = %1525
  %1531 = load i64, ptr %1504, align 8, !tbaa !6
  %1532 = sitofp i64 %1531 to double
  br label %1533

1533:                                             ; preds = %1528, %1530
  %1534 = phi double [ %1529, %1528 ], [ %1532, %1530 ]
  %1535 = fadd double %1527, %1534
  br label %1536

1536:                                             ; preds = %1515, %1533
  %1537 = phi double [ %1535, %1533 ], [ %1518, %1515 ]
  %1538 = phi i8 [ 19, %1533 ], [ 3, %1515 ]
  %1539 = getelementptr inbounds i8, ptr %3246, i32 4
  store double %1537, ptr %1507, align 8, !tbaa !6
  %1540 = getelementptr inbounds i8, ptr %1507, i32 8
  store i8 %1538, ptr %1540, align 8, !tbaa !2
  br label %1541

1541:                                             ; preds = %1536, %1499, %1525
  %1542 = phi ptr [ %3246, %1525 ], [ %3246, %1499 ], [ %1539, %1536 ]
  %1543 = icmp eq i32 %3245, 0
  br i1 %1543, label %1548, label %1544, !prof !27

1544:                                             ; preds = %1541
  %1545 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1542) #12
  %1546 = load ptr, ptr %29, align 4, !tbaa !6
  %1547 = getelementptr inbounds i8, ptr %1546, i32 16
  br label %1548

1548:                                             ; preds = %1544, %1541
  %1549 = phi i32 [ %1545, %1544 ], [ 0, %1541 ]
  %1550 = phi ptr [ %1547, %1544 ], [ %3247, %1541 ]
  %1551 = getelementptr inbounds i8, ptr %1542, i32 4
  br label %72

1552:                                             ; preds = %3243
  %1553 = lshr i32 %3248, 16
  %1554 = and i32 %1553, 255
  %1555 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1554
  %1556 = lshr i32 %3248, 24
  %1557 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1556
  %1558 = lshr i32 %3248, 7
  %1559 = and i32 %1558, 255
  %1560 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1559
  %1561 = getelementptr inbounds i8, ptr %1555, i32 8
  %1562 = load i8, ptr %1561, align 8, !tbaa !2
  switch i8 %1562, label %1594 [
    i8 3, label %1563
    i8 19, label %1572
  ]

1563:                                             ; preds = %1552
  %1564 = getelementptr inbounds i8, ptr %1557, i32 8
  %1565 = load i8, ptr %1564, align 8, !tbaa !2
  %1566 = icmp eq i8 %1565, 3
  %1567 = load i64, ptr %1555, align 8, !tbaa !6
  br i1 %1566, label %1568, label %1576

1568:                                             ; preds = %1563
  %1569 = load i64, ptr %1557, align 8, !tbaa !6
  %1570 = sub i64 %1567, %1569
  %1571 = bitcast i64 %1570 to double
  br label %1589

1572:                                             ; preds = %1552
  %1573 = load double, ptr %1555, align 8, !tbaa !6
  %1574 = getelementptr inbounds i8, ptr %1557, i32 8
  %1575 = load i8, ptr %1574, align 8, !tbaa !2
  br label %1578

1576:                                             ; preds = %1563
  %1577 = sitofp i64 %1567 to double
  br label %1578

1578:                                             ; preds = %1572, %1576
  %1579 = phi i8 [ %1575, %1572 ], [ %1565, %1576 ]
  %1580 = phi double [ %1573, %1572 ], [ %1577, %1576 ]
  switch i8 %1579, label %1594 [
    i8 19, label %1581
    i8 3, label %1583
  ]

1581:                                             ; preds = %1578
  %1582 = load double, ptr %1557, align 8, !tbaa !6
  br label %1586

1583:                                             ; preds = %1578
  %1584 = load i64, ptr %1557, align 8, !tbaa !6
  %1585 = sitofp i64 %1584 to double
  br label %1586

1586:                                             ; preds = %1581, %1583
  %1587 = phi double [ %1582, %1581 ], [ %1585, %1583 ]
  %1588 = fsub double %1580, %1587
  br label %1589

1589:                                             ; preds = %1568, %1586
  %1590 = phi double [ %1588, %1586 ], [ %1571, %1568 ]
  %1591 = phi i8 [ 19, %1586 ], [ 3, %1568 ]
  %1592 = getelementptr inbounds i8, ptr %3246, i32 4
  store double %1590, ptr %1560, align 8, !tbaa !6
  %1593 = getelementptr inbounds i8, ptr %1560, i32 8
  store i8 %1591, ptr %1593, align 8, !tbaa !2
  br label %1594

1594:                                             ; preds = %1589, %1552, %1578
  %1595 = phi ptr [ %3246, %1578 ], [ %3246, %1552 ], [ %1592, %1589 ]
  %1596 = icmp eq i32 %3245, 0
  br i1 %1596, label %1601, label %1597, !prof !27

1597:                                             ; preds = %1594
  %1598 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1595) #12
  %1599 = load ptr, ptr %29, align 4, !tbaa !6
  %1600 = getelementptr inbounds i8, ptr %1599, i32 16
  br label %1601

1601:                                             ; preds = %1597, %1594
  %1602 = phi i32 [ %1598, %1597 ], [ 0, %1594 ]
  %1603 = phi ptr [ %1600, %1597 ], [ %3247, %1594 ]
  %1604 = getelementptr inbounds i8, ptr %1595, i32 4
  br label %72

1605:                                             ; preds = %3243
  %1606 = lshr i32 %3248, 16
  %1607 = and i32 %1606, 255
  %1608 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1607
  %1609 = lshr i32 %3248, 24
  %1610 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1609
  %1611 = lshr i32 %3248, 7
  %1612 = and i32 %1611, 255
  %1613 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1612
  %1614 = getelementptr inbounds i8, ptr %1608, i32 8
  %1615 = load i8, ptr %1614, align 8, !tbaa !2
  switch i8 %1615, label %1647 [
    i8 3, label %1616
    i8 19, label %1625
  ]

1616:                                             ; preds = %1605
  %1617 = getelementptr inbounds i8, ptr %1610, i32 8
  %1618 = load i8, ptr %1617, align 8, !tbaa !2
  %1619 = icmp eq i8 %1618, 3
  %1620 = load i64, ptr %1608, align 8, !tbaa !6
  br i1 %1619, label %1621, label %1629

1621:                                             ; preds = %1616
  %1622 = load i64, ptr %1610, align 8, !tbaa !6
  %1623 = mul i64 %1622, %1620
  %1624 = bitcast i64 %1623 to double
  br label %1642

1625:                                             ; preds = %1605
  %1626 = load double, ptr %1608, align 8, !tbaa !6
  %1627 = getelementptr inbounds i8, ptr %1610, i32 8
  %1628 = load i8, ptr %1627, align 8, !tbaa !2
  br label %1631

1629:                                             ; preds = %1616
  %1630 = sitofp i64 %1620 to double
  br label %1631

1631:                                             ; preds = %1625, %1629
  %1632 = phi i8 [ %1628, %1625 ], [ %1618, %1629 ]
  %1633 = phi double [ %1626, %1625 ], [ %1630, %1629 ]
  switch i8 %1632, label %1647 [
    i8 19, label %1634
    i8 3, label %1636
  ]

1634:                                             ; preds = %1631
  %1635 = load double, ptr %1610, align 8, !tbaa !6
  br label %1639

1636:                                             ; preds = %1631
  %1637 = load i64, ptr %1610, align 8, !tbaa !6
  %1638 = sitofp i64 %1637 to double
  br label %1639

1639:                                             ; preds = %1634, %1636
  %1640 = phi double [ %1635, %1634 ], [ %1638, %1636 ]
  %1641 = fmul double %1633, %1640
  br label %1642

1642:                                             ; preds = %1621, %1639
  %1643 = phi double [ %1641, %1639 ], [ %1624, %1621 ]
  %1644 = phi i8 [ 19, %1639 ], [ 3, %1621 ]
  %1645 = getelementptr inbounds i8, ptr %3246, i32 4
  store double %1643, ptr %1613, align 8, !tbaa !6
  %1646 = getelementptr inbounds i8, ptr %1613, i32 8
  store i8 %1644, ptr %1646, align 8, !tbaa !2
  br label %1647

1647:                                             ; preds = %1642, %1605, %1631
  %1648 = phi ptr [ %3246, %1631 ], [ %3246, %1605 ], [ %1645, %1642 ]
  %1649 = icmp eq i32 %3245, 0
  br i1 %1649, label %1654, label %1650, !prof !27

1650:                                             ; preds = %1647
  %1651 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1648) #12
  %1652 = load ptr, ptr %29, align 4, !tbaa !6
  %1653 = getelementptr inbounds i8, ptr %1652, i32 16
  br label %1654

1654:                                             ; preds = %1650, %1647
  %1655 = phi i32 [ %1651, %1650 ], [ 0, %1647 ]
  %1656 = phi ptr [ %1653, %1650 ], [ %3247, %1647 ]
  %1657 = getelementptr inbounds i8, ptr %1648, i32 4
  br label %72

1658:                                             ; preds = %3243
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %1659 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %1659, ptr %12, align 4, !tbaa !6
  %1660 = lshr i32 %3248, 16
  %1661 = and i32 %1660, 255
  %1662 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1661
  %1663 = lshr i32 %3248, 24
  %1664 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1663
  %1665 = lshr i32 %3248, 7
  %1666 = and i32 %1665, 255
  %1667 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1666
  %1668 = getelementptr inbounds i8, ptr %1662, i32 8
  %1669 = load i8, ptr %1668, align 8, !tbaa !2
  switch i8 %1669, label %1725 [
    i8 3, label %1670
    i8 19, label %1693
  ]

1670:                                             ; preds = %1658
  %1671 = getelementptr inbounds i8, ptr %1664, i32 8
  %1672 = load i8, ptr %1671, align 8, !tbaa !2
  %1673 = icmp eq i8 %1672, 3
  br i1 %1673, label %1674, label %1697

1674:                                             ; preds = %1670
  %1675 = load i64, ptr %1664, align 8, !tbaa !6
  %1676 = add i64 %1675, 1
  %1677 = icmp ult i64 %1676, 2
  br i1 %1677, label %1678, label %1681, !prof !15

1678:                                             ; preds = %1674
  %1679 = icmp eq i64 %1675, 0
  br i1 %1679, label %1680, label %1690

1680:                                             ; preds = %1678
  call void (ptr, ptr, ...) @luaG_runerror(ptr noundef nonnull %0, ptr noundef nonnull @.str.6) #13
  unreachable

1681:                                             ; preds = %1674
  %1682 = load i64, ptr %1662, align 8, !tbaa !6
  %1683 = srem i64 %1682, %1675
  %1684 = icmp eq i64 %1683, 0
  br i1 %1684, label %1690, label %1685

1685:                                             ; preds = %1681
  %1686 = xor i64 %1683, %1675
  %1687 = icmp slt i64 %1686, 0
  %1688 = select i1 %1687, i64 %1675, i64 0
  %1689 = add nsw i64 %1688, %1683
  br label %1690

1690:                                             ; preds = %1678, %1681, %1685
  %1691 = phi i64 [ 0, %1678 ], [ 0, %1681 ], [ %1689, %1685 ]
  %1692 = bitcast i64 %1691 to double
  br label %1720

1693:                                             ; preds = %1658
  %1694 = load double, ptr %1662, align 8, !tbaa !6
  %1695 = getelementptr inbounds i8, ptr %1664, i32 8
  %1696 = load i8, ptr %1695, align 8, !tbaa !2
  br label %1700

1697:                                             ; preds = %1670
  %1698 = load i64, ptr %1662, align 8, !tbaa !6
  %1699 = sitofp i64 %1698 to double
  br label %1700

1700:                                             ; preds = %1693, %1697
  %1701 = phi i8 [ %1696, %1693 ], [ %1672, %1697 ]
  %1702 = phi double [ %1694, %1693 ], [ %1699, %1697 ]
  switch i8 %1701, label %1725 [
    i8 19, label %1703
    i8 3, label %1705
  ]

1703:                                             ; preds = %1700
  %1704 = load double, ptr %1664, align 8, !tbaa !6
  br label %1708

1705:                                             ; preds = %1700
  %1706 = load i64, ptr %1664, align 8, !tbaa !6
  %1707 = sitofp i64 %1706 to double
  br label %1708

1708:                                             ; preds = %1703, %1705
  %1709 = phi double [ %1704, %1703 ], [ %1707, %1705 ]
  %1710 = frem double %1702, %1709
  %1711 = fcmp ogt double %1710, 0.000000e+00
  br i1 %1711, label %1712, label %1714

1712:                                             ; preds = %1708
  %1713 = fcmp olt double %1709, 0.000000e+00
  br i1 %1713, label %1718, label %1720

1714:                                             ; preds = %1708
  %1715 = fcmp olt double %1710, 0.000000e+00
  %1716 = fcmp ogt double %1709, 0.000000e+00
  %1717 = and i1 %1716, %1715
  br i1 %1717, label %1718, label %1720

1718:                                             ; preds = %1714, %1712
  %1719 = fadd double %1709, %1710
  br label %1720

1720:                                             ; preds = %1718, %1714, %1712, %1690
  %1721 = phi double [ %1692, %1690 ], [ %1719, %1718 ], [ %1710, %1712 ], [ %1710, %1714 ]
  %1722 = phi i8 [ 3, %1690 ], [ 19, %1718 ], [ 19, %1712 ], [ 19, %1714 ]
  %1723 = getelementptr inbounds i8, ptr %3246, i32 4
  store double %1721, ptr %1667, align 8, !tbaa !6
  %1724 = getelementptr inbounds i8, ptr %1667, i32 8
  store i8 %1722, ptr %1724, align 8, !tbaa !2
  br label %1725

1725:                                             ; preds = %1720, %1658, %1700
  %1726 = phi ptr [ %3246, %1700 ], [ %3246, %1658 ], [ %1723, %1720 ]
  %1727 = icmp eq i32 %3245, 0
  br i1 %1727, label %1732, label %1728, !prof !27

1728:                                             ; preds = %1725
  %1729 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %1726) #12
  %1730 = load ptr, ptr %29, align 4, !tbaa !6
  %1731 = getelementptr inbounds i8, ptr %1730, i32 16
  br label %1732

1732:                                             ; preds = %1728, %1725
  %1733 = phi i32 [ %1729, %1728 ], [ 0, %1725 ]
  %1734 = phi ptr [ %1731, %1728 ], [ %3247, %1725 ]
  %1735 = getelementptr inbounds i8, ptr %1726, i32 4
  br label %72

1736:                                             ; preds = %3243
  %1737 = lshr i32 %3248, 7
  %1738 = and i32 %1737, 255
  %1739 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1738
  %1740 = lshr i32 %3248, 16
  %1741 = and i32 %1740, 255
  %1742 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1741
  %1743 = lshr i32 %3248, 24
  %1744 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1743
  %1745 = getelementptr inbounds i8, ptr %1742, i32 8
  %1746 = load i8, ptr %1745, align 8, !tbaa !2
  switch i8 %1746, label %1769 [
    i8 19, label %1747
    i8 3, label %1749
  ]

1747:                                             ; preds = %1736
  %1748 = load double, ptr %1742, align 8, !tbaa !6
  br label %1752

1749:                                             ; preds = %1736
  %1750 = load i64, ptr %1742, align 8, !tbaa !6
  %1751 = sitofp i64 %1750 to double
  br label %1752

1752:                                             ; preds = %1747, %1749
  %1753 = phi double [ %1748, %1747 ], [ %1751, %1749 ]
  %1754 = getelementptr inbounds i8, ptr %1744, i32 8
  %1755 = load i8, ptr %1754, align 8, !tbaa !2
  switch i8 %1755, label %1769 [
    i8 19, label %1756
    i8 3, label %1758
  ]

1756:                                             ; preds = %1752
  %1757 = load double, ptr %1744, align 8, !tbaa !6
  br label %1761

1758:                                             ; preds = %1752
  %1759 = load i64, ptr %1744, align 8, !tbaa !6
  %1760 = sitofp i64 %1759 to double
  br label %1761

1761:                                             ; preds = %1756, %1758
  %1762 = phi double [ %1757, %1756 ], [ %1760, %1758 ]
  %1763 = getelementptr inbounds i8, ptr %3246, i32 4
  %1764 = fcmp oeq double %1762, 2.000000e+00
  %1765 = fmul double %1753, %1753
  %1766 = call double @llvm.pow.f64(double %1753, double %1762)
  %1767 = select i1 %1764, double %1765, double %1766
  store double %1767, ptr %1739, align 8, !tbaa !6
  %1768 = getelementptr inbounds i8, ptr %1739, i32 8
  store i8 19, ptr %1768, align 8, !tbaa !2
  br label %1769

1769:                                             ; preds = %1752, %1736, %1761
  %1770 = phi ptr [ %1763, %1761 ], [ %3246, %1736 ], [ %3246, %1752 ]
  %1771 = icmp eq i32 %3245, 0
  br i1 %1771, label %1776, label %1772, !prof !27

1772:                                             ; preds = %1769
  %1773 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1770) #12
  %1774 = load ptr, ptr %29, align 4, !tbaa !6
  %1775 = getelementptr inbounds i8, ptr %1774, i32 16
  br label %1776

1776:                                             ; preds = %1772, %1769
  %1777 = phi i32 [ %1773, %1772 ], [ 0, %1769 ]
  %1778 = phi ptr [ %1775, %1772 ], [ %3247, %1769 ]
  %1779 = getelementptr inbounds i8, ptr %1770, i32 4
  br label %72

1780:                                             ; preds = %3243
  %1781 = lshr i32 %3248, 7
  %1782 = and i32 %1781, 255
  %1783 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1782
  %1784 = lshr i32 %3248, 16
  %1785 = and i32 %1784, 255
  %1786 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1785
  %1787 = lshr i32 %3248, 24
  %1788 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1787
  %1789 = getelementptr inbounds i8, ptr %1786, i32 8
  %1790 = load i8, ptr %1789, align 8, !tbaa !2
  switch i8 %1790, label %1810 [
    i8 19, label %1791
    i8 3, label %1793
  ]

1791:                                             ; preds = %1780
  %1792 = load double, ptr %1786, align 8, !tbaa !6
  br label %1796

1793:                                             ; preds = %1780
  %1794 = load i64, ptr %1786, align 8, !tbaa !6
  %1795 = sitofp i64 %1794 to double
  br label %1796

1796:                                             ; preds = %1791, %1793
  %1797 = phi double [ %1792, %1791 ], [ %1795, %1793 ]
  %1798 = getelementptr inbounds i8, ptr %1788, i32 8
  %1799 = load i8, ptr %1798, align 8, !tbaa !2
  switch i8 %1799, label %1810 [
    i8 19, label %1800
    i8 3, label %1802
  ]

1800:                                             ; preds = %1796
  %1801 = load double, ptr %1788, align 8, !tbaa !6
  br label %1805

1802:                                             ; preds = %1796
  %1803 = load i64, ptr %1788, align 8, !tbaa !6
  %1804 = sitofp i64 %1803 to double
  br label %1805

1805:                                             ; preds = %1800, %1802
  %1806 = phi double [ %1801, %1800 ], [ %1804, %1802 ]
  %1807 = getelementptr inbounds i8, ptr %3246, i32 4
  %1808 = fdiv double %1797, %1806
  store double %1808, ptr %1783, align 8, !tbaa !6
  %1809 = getelementptr inbounds i8, ptr %1783, i32 8
  store i8 19, ptr %1809, align 8, !tbaa !2
  br label %1810

1810:                                             ; preds = %1796, %1780, %1805
  %1811 = phi ptr [ %1807, %1805 ], [ %3246, %1780 ], [ %3246, %1796 ]
  %1812 = icmp eq i32 %3245, 0
  br i1 %1812, label %1817, label %1813, !prof !27

1813:                                             ; preds = %1810
  %1814 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1811) #12
  %1815 = load ptr, ptr %29, align 4, !tbaa !6
  %1816 = getelementptr inbounds i8, ptr %1815, i32 16
  br label %1817

1817:                                             ; preds = %1813, %1810
  %1818 = phi i32 [ %1814, %1813 ], [ 0, %1810 ]
  %1819 = phi ptr [ %1816, %1813 ], [ %3247, %1810 ]
  %1820 = getelementptr inbounds i8, ptr %1811, i32 4
  br label %72

1821:                                             ; preds = %3243
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %1822 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %1822, ptr %12, align 4, !tbaa !6
  %1823 = lshr i32 %3248, 16
  %1824 = and i32 %1823, 255
  %1825 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1824
  %1826 = lshr i32 %3248, 24
  %1827 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1826
  %1828 = lshr i32 %3248, 7
  %1829 = and i32 %1828, 255
  %1830 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1829
  %1831 = getelementptr inbounds i8, ptr %1825, i32 8
  %1832 = load i8, ptr %1831, align 8, !tbaa !2
  switch i8 %1832, label %1885 [
    i8 3, label %1833
    i8 19, label %1862
  ]

1833:                                             ; preds = %1821
  %1834 = getelementptr inbounds i8, ptr %1827, i32 8
  %1835 = load i8, ptr %1834, align 8, !tbaa !2
  %1836 = icmp eq i8 %1835, 3
  %1837 = load i64, ptr %1825, align 8, !tbaa !6
  br i1 %1836, label %1838, label %1866

1838:                                             ; preds = %1833
  %1839 = load i64, ptr %1827, align 8, !tbaa !6
  %1840 = add i64 %1839, 1
  %1841 = icmp ult i64 %1840, 2
  br i1 %1841, label %1842, label %1847, !prof !15

1842:                                             ; preds = %1838
  %1843 = icmp eq i64 %1839, 0
  br i1 %1843, label %1844, label %1845

1844:                                             ; preds = %1842
  call void (ptr, ptr, ...) @luaG_runerror(ptr noundef nonnull %0, ptr noundef nonnull @.str.5) #13
  unreachable

1845:                                             ; preds = %1842
  %1846 = sub i64 0, %1837
  br label %1859

1847:                                             ; preds = %1838
  %1848 = freeze i64 %1837
  %1849 = freeze i64 %1839
  %1850 = sdiv i64 %1848, %1849
  %1851 = xor i64 %1839, %1837
  %1852 = icmp slt i64 %1851, 0
  br i1 %1852, label %1853, label %1859

1853:                                             ; preds = %1847
  %1854 = mul i64 %1850, %1849
  %1855 = sub i64 %1848, %1854
  %1856 = icmp ne i64 %1855, 0
  %1857 = sext i1 %1856 to i64
  %1858 = add nsw i64 %1850, %1857
  br label %1859

1859:                                             ; preds = %1845, %1847, %1853
  %1860 = phi i64 [ %1846, %1845 ], [ %1850, %1847 ], [ %1858, %1853 ]
  %1861 = bitcast i64 %1860 to double
  br label %1880

1862:                                             ; preds = %1821
  %1863 = load double, ptr %1825, align 8, !tbaa !6
  %1864 = getelementptr inbounds i8, ptr %1827, i32 8
  %1865 = load i8, ptr %1864, align 8, !tbaa !2
  br label %1868

1866:                                             ; preds = %1833
  %1867 = sitofp i64 %1837 to double
  br label %1868

1868:                                             ; preds = %1862, %1866
  %1869 = phi i8 [ %1865, %1862 ], [ %1835, %1866 ]
  %1870 = phi double [ %1863, %1862 ], [ %1867, %1866 ]
  switch i8 %1869, label %1885 [
    i8 19, label %1871
    i8 3, label %1873
  ]

1871:                                             ; preds = %1868
  %1872 = load double, ptr %1827, align 8, !tbaa !6
  br label %1876

1873:                                             ; preds = %1868
  %1874 = load i64, ptr %1827, align 8, !tbaa !6
  %1875 = sitofp i64 %1874 to double
  br label %1876

1876:                                             ; preds = %1871, %1873
  %1877 = phi double [ %1872, %1871 ], [ %1875, %1873 ]
  %1878 = fdiv double %1870, %1877
  %1879 = call double @llvm.floor.f64(double %1878)
  br label %1880

1880:                                             ; preds = %1859, %1876
  %1881 = phi double [ %1879, %1876 ], [ %1861, %1859 ]
  %1882 = phi i8 [ 19, %1876 ], [ 3, %1859 ]
  %1883 = getelementptr inbounds i8, ptr %3246, i32 4
  store double %1881, ptr %1830, align 8, !tbaa !6
  %1884 = getelementptr inbounds i8, ptr %1830, i32 8
  store i8 %1882, ptr %1884, align 8, !tbaa !2
  br label %1885

1885:                                             ; preds = %1880, %1821, %1868
  %1886 = phi ptr [ %3246, %1868 ], [ %3246, %1821 ], [ %1883, %1880 ]
  %1887 = icmp eq i32 %3245, 0
  br i1 %1887, label %1892, label %1888, !prof !27

1888:                                             ; preds = %1885
  %1889 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %1886) #12
  %1890 = load ptr, ptr %29, align 4, !tbaa !6
  %1891 = getelementptr inbounds i8, ptr %1890, i32 16
  br label %1892

1892:                                             ; preds = %1888, %1885
  %1893 = phi i32 [ %1889, %1888 ], [ 0, %1885 ]
  %1894 = phi ptr [ %1891, %1888 ], [ %3247, %1885 ]
  %1895 = getelementptr inbounds i8, ptr %1886, i32 4
  br label %72

1896:                                             ; preds = %3243
  %1897 = lshr i32 %3248, 7
  %1898 = and i32 %1897, 255
  %1899 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1898
  %1900 = lshr i32 %3248, 16
  %1901 = and i32 %1900, 255
  %1902 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1901
  %1903 = lshr i32 %3248, 24
  %1904 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1903
  %1905 = getelementptr inbounds i8, ptr %1902, i32 8
  %1906 = load i8, ptr %1905, align 8, !tbaa !2
  switch i8 %1906, label %1940 [
    i8 3, label %1907
    i8 19, label %1909
  ], !prof !42

1907:                                             ; preds = %1896
  %1908 = load i64, ptr %1902, align 8, !tbaa !6
  br label %1919

1909:                                             ; preds = %1896
  %1910 = load double, ptr %1902, align 8, !tbaa !6
  %1911 = call double @llvm.floor.f64(double %1910)
  %1912 = fcmp une double %1911, %1910
  br i1 %1912, label %1940, label %1913

1913:                                             ; preds = %1909
  %1914 = fcmp oge double %1911, 0xC3E0000000000000
  %1915 = fcmp olt double %1911, 0x43E0000000000000
  %1916 = and i1 %1914, %1915
  br i1 %1916, label %1917, label %1940

1917:                                             ; preds = %1913
  %1918 = fptosi double %1911 to i64
  br label %1919

1919:                                             ; preds = %1917, %1907
  %1920 = phi i64 [ %1908, %1907 ], [ %1918, %1917 ]
  %1921 = getelementptr inbounds i8, ptr %1904, i32 8
  %1922 = load i8, ptr %1921, align 8, !tbaa !2
  switch i8 %1922, label %1940 [
    i8 3, label %1923
    i8 19, label %1925
  ], !prof !42

1923:                                             ; preds = %1919
  %1924 = load i64, ptr %1904, align 8, !tbaa !6
  br label %1935

1925:                                             ; preds = %1919
  %1926 = load double, ptr %1904, align 8, !tbaa !6
  %1927 = call double @llvm.floor.f64(double %1926)
  %1928 = fcmp une double %1927, %1926
  br i1 %1928, label %1940, label %1929

1929:                                             ; preds = %1925
  %1930 = fcmp oge double %1927, 0xC3E0000000000000
  %1931 = fcmp olt double %1927, 0x43E0000000000000
  %1932 = and i1 %1930, %1931
  br i1 %1932, label %1933, label %1940

1933:                                             ; preds = %1929
  %1934 = fptosi double %1927 to i64
  br label %1935

1935:                                             ; preds = %1933, %1923
  %1936 = phi i64 [ %1924, %1923 ], [ %1934, %1933 ]
  %1937 = getelementptr inbounds i8, ptr %3246, i32 4
  %1938 = and i64 %1936, %1920
  store i64 %1938, ptr %1899, align 8, !tbaa !6
  %1939 = getelementptr inbounds i8, ptr %1899, i32 8
  store i8 3, ptr %1939, align 8, !tbaa !2
  br label %1940

1940:                                             ; preds = %1919, %1896, %1925, %1929, %1909, %1913, %1935
  %1941 = phi ptr [ %1937, %1935 ], [ %3246, %1913 ], [ %3246, %1909 ], [ %3246, %1929 ], [ %3246, %1925 ], [ %3246, %1896 ], [ %3246, %1919 ]
  %1942 = icmp eq i32 %3245, 0
  br i1 %1942, label %1947, label %1943, !prof !27

1943:                                             ; preds = %1940
  %1944 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1941) #12
  %1945 = load ptr, ptr %29, align 4, !tbaa !6
  %1946 = getelementptr inbounds i8, ptr %1945, i32 16
  br label %1947

1947:                                             ; preds = %1943, %1940
  %1948 = phi i32 [ %1944, %1943 ], [ 0, %1940 ]
  %1949 = phi ptr [ %1946, %1943 ], [ %3247, %1940 ]
  %1950 = getelementptr inbounds i8, ptr %1941, i32 4
  br label %72

1951:                                             ; preds = %3243
  %1952 = lshr i32 %3248, 7
  %1953 = and i32 %1952, 255
  %1954 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1953
  %1955 = lshr i32 %3248, 16
  %1956 = and i32 %1955, 255
  %1957 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1956
  %1958 = lshr i32 %3248, 24
  %1959 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %1958
  %1960 = getelementptr inbounds i8, ptr %1957, i32 8
  %1961 = load i8, ptr %1960, align 8, !tbaa !2
  switch i8 %1961, label %1995 [
    i8 3, label %1962
    i8 19, label %1964
  ], !prof !42

1962:                                             ; preds = %1951
  %1963 = load i64, ptr %1957, align 8, !tbaa !6
  br label %1974

1964:                                             ; preds = %1951
  %1965 = load double, ptr %1957, align 8, !tbaa !6
  %1966 = call double @llvm.floor.f64(double %1965)
  %1967 = fcmp une double %1966, %1965
  br i1 %1967, label %1995, label %1968

1968:                                             ; preds = %1964
  %1969 = fcmp oge double %1966, 0xC3E0000000000000
  %1970 = fcmp olt double %1966, 0x43E0000000000000
  %1971 = and i1 %1969, %1970
  br i1 %1971, label %1972, label %1995

1972:                                             ; preds = %1968
  %1973 = fptosi double %1966 to i64
  br label %1974

1974:                                             ; preds = %1972, %1962
  %1975 = phi i64 [ %1963, %1962 ], [ %1973, %1972 ]
  %1976 = getelementptr inbounds i8, ptr %1959, i32 8
  %1977 = load i8, ptr %1976, align 8, !tbaa !2
  switch i8 %1977, label %1995 [
    i8 3, label %1978
    i8 19, label %1980
  ], !prof !42

1978:                                             ; preds = %1974
  %1979 = load i64, ptr %1959, align 8, !tbaa !6
  br label %1990

1980:                                             ; preds = %1974
  %1981 = load double, ptr %1959, align 8, !tbaa !6
  %1982 = call double @llvm.floor.f64(double %1981)
  %1983 = fcmp une double %1982, %1981
  br i1 %1983, label %1995, label %1984

1984:                                             ; preds = %1980
  %1985 = fcmp oge double %1982, 0xC3E0000000000000
  %1986 = fcmp olt double %1982, 0x43E0000000000000
  %1987 = and i1 %1985, %1986
  br i1 %1987, label %1988, label %1995

1988:                                             ; preds = %1984
  %1989 = fptosi double %1982 to i64
  br label %1990

1990:                                             ; preds = %1988, %1978
  %1991 = phi i64 [ %1979, %1978 ], [ %1989, %1988 ]
  %1992 = getelementptr inbounds i8, ptr %3246, i32 4
  %1993 = or i64 %1991, %1975
  store i64 %1993, ptr %1954, align 8, !tbaa !6
  %1994 = getelementptr inbounds i8, ptr %1954, i32 8
  store i8 3, ptr %1994, align 8, !tbaa !2
  br label %1995

1995:                                             ; preds = %1974, %1951, %1980, %1984, %1964, %1968, %1990
  %1996 = phi ptr [ %1992, %1990 ], [ %3246, %1968 ], [ %3246, %1964 ], [ %3246, %1984 ], [ %3246, %1980 ], [ %3246, %1951 ], [ %3246, %1974 ]
  %1997 = icmp eq i32 %3245, 0
  br i1 %1997, label %2002, label %1998, !prof !27

1998:                                             ; preds = %1995
  %1999 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %1996) #12
  %2000 = load ptr, ptr %29, align 4, !tbaa !6
  %2001 = getelementptr inbounds i8, ptr %2000, i32 16
  br label %2002

2002:                                             ; preds = %1998, %1995
  %2003 = phi i32 [ %1999, %1998 ], [ 0, %1995 ]
  %2004 = phi ptr [ %2001, %1998 ], [ %3247, %1995 ]
  %2005 = getelementptr inbounds i8, ptr %1996, i32 4
  br label %72

2006:                                             ; preds = %3243
  %2007 = lshr i32 %3248, 7
  %2008 = and i32 %2007, 255
  %2009 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2008
  %2010 = lshr i32 %3248, 16
  %2011 = and i32 %2010, 255
  %2012 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2011
  %2013 = lshr i32 %3248, 24
  %2014 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2013
  %2015 = getelementptr inbounds i8, ptr %2012, i32 8
  %2016 = load i8, ptr %2015, align 8, !tbaa !2
  switch i8 %2016, label %2050 [
    i8 3, label %2017
    i8 19, label %2019
  ], !prof !42

2017:                                             ; preds = %2006
  %2018 = load i64, ptr %2012, align 8, !tbaa !6
  br label %2029

2019:                                             ; preds = %2006
  %2020 = load double, ptr %2012, align 8, !tbaa !6
  %2021 = call double @llvm.floor.f64(double %2020)
  %2022 = fcmp une double %2021, %2020
  br i1 %2022, label %2050, label %2023

2023:                                             ; preds = %2019
  %2024 = fcmp oge double %2021, 0xC3E0000000000000
  %2025 = fcmp olt double %2021, 0x43E0000000000000
  %2026 = and i1 %2024, %2025
  br i1 %2026, label %2027, label %2050

2027:                                             ; preds = %2023
  %2028 = fptosi double %2021 to i64
  br label %2029

2029:                                             ; preds = %2027, %2017
  %2030 = phi i64 [ %2018, %2017 ], [ %2028, %2027 ]
  %2031 = getelementptr inbounds i8, ptr %2014, i32 8
  %2032 = load i8, ptr %2031, align 8, !tbaa !2
  switch i8 %2032, label %2050 [
    i8 3, label %2033
    i8 19, label %2035
  ], !prof !42

2033:                                             ; preds = %2029
  %2034 = load i64, ptr %2014, align 8, !tbaa !6
  br label %2045

2035:                                             ; preds = %2029
  %2036 = load double, ptr %2014, align 8, !tbaa !6
  %2037 = call double @llvm.floor.f64(double %2036)
  %2038 = fcmp une double %2037, %2036
  br i1 %2038, label %2050, label %2039

2039:                                             ; preds = %2035
  %2040 = fcmp oge double %2037, 0xC3E0000000000000
  %2041 = fcmp olt double %2037, 0x43E0000000000000
  %2042 = and i1 %2040, %2041
  br i1 %2042, label %2043, label %2050

2043:                                             ; preds = %2039
  %2044 = fptosi double %2037 to i64
  br label %2045

2045:                                             ; preds = %2043, %2033
  %2046 = phi i64 [ %2034, %2033 ], [ %2044, %2043 ]
  %2047 = getelementptr inbounds i8, ptr %3246, i32 4
  %2048 = xor i64 %2046, %2030
  store i64 %2048, ptr %2009, align 8, !tbaa !6
  %2049 = getelementptr inbounds i8, ptr %2009, i32 8
  store i8 3, ptr %2049, align 8, !tbaa !2
  br label %2050

2050:                                             ; preds = %2029, %2006, %2035, %2039, %2019, %2023, %2045
  %2051 = phi ptr [ %2047, %2045 ], [ %3246, %2023 ], [ %3246, %2019 ], [ %3246, %2039 ], [ %3246, %2035 ], [ %3246, %2006 ], [ %3246, %2029 ]
  %2052 = icmp eq i32 %3245, 0
  br i1 %2052, label %2057, label %2053, !prof !27

2053:                                             ; preds = %2050
  %2054 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2051) #12
  %2055 = load ptr, ptr %29, align 4, !tbaa !6
  %2056 = getelementptr inbounds i8, ptr %2055, i32 16
  br label %2057

2057:                                             ; preds = %2053, %2050
  %2058 = phi i32 [ %2054, %2053 ], [ 0, %2050 ]
  %2059 = phi ptr [ %2056, %2053 ], [ %3247, %2050 ]
  %2060 = getelementptr inbounds i8, ptr %2051, i32 4
  br label %72

2061:                                             ; preds = %3243
  %2062 = lshr i32 %3248, 7
  %2063 = and i32 %2062, 255
  %2064 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2063
  %2065 = lshr i32 %3248, 16
  %2066 = and i32 %2065, 255
  %2067 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2066
  %2068 = lshr i32 %3248, 24
  %2069 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2068
  %2070 = getelementptr inbounds i8, ptr %2067, i32 8
  %2071 = load i8, ptr %2070, align 8, !tbaa !2
  switch i8 %2071, label %2116 [
    i8 3, label %2072
    i8 19, label %2074
  ], !prof !42

2072:                                             ; preds = %2061
  %2073 = load i64, ptr %2067, align 8, !tbaa !6
  br label %2084

2074:                                             ; preds = %2061
  %2075 = load double, ptr %2067, align 8, !tbaa !6
  %2076 = call double @llvm.floor.f64(double %2075)
  %2077 = fcmp une double %2076, %2075
  br i1 %2077, label %2116, label %2078

2078:                                             ; preds = %2074
  %2079 = fcmp oge double %2076, 0xC3E0000000000000
  %2080 = fcmp olt double %2076, 0x43E0000000000000
  %2081 = and i1 %2079, %2080
  br i1 %2081, label %2082, label %2116

2082:                                             ; preds = %2078
  %2083 = fptosi double %2076 to i64
  br label %2084

2084:                                             ; preds = %2082, %2072
  %2085 = phi i64 [ %2073, %2072 ], [ %2083, %2082 ]
  %2086 = getelementptr inbounds i8, ptr %2069, i32 8
  %2087 = load i8, ptr %2086, align 8, !tbaa !2
  switch i8 %2087, label %2116 [
    i8 3, label %2088
    i8 19, label %2090
  ], !prof !42

2088:                                             ; preds = %2084
  %2089 = load i64, ptr %2069, align 8, !tbaa !6
  br label %2100

2090:                                             ; preds = %2084
  %2091 = load double, ptr %2069, align 8, !tbaa !6
  %2092 = call double @llvm.floor.f64(double %2091)
  %2093 = fcmp une double %2092, %2091
  br i1 %2093, label %2116, label %2094

2094:                                             ; preds = %2090
  %2095 = fcmp oge double %2092, 0xC3E0000000000000
  %2096 = fcmp olt double %2092, 0x43E0000000000000
  %2097 = and i1 %2095, %2096
  br i1 %2097, label %2098, label %2116

2098:                                             ; preds = %2094
  %2099 = fptosi double %2092 to i64
  br label %2100

2100:                                             ; preds = %2098, %2088
  %2101 = phi i64 [ %2089, %2088 ], [ %2099, %2098 ]
  %2102 = getelementptr inbounds i8, ptr %3246, i32 4
  %2103 = sub i64 0, %2101
  %2104 = icmp slt i64 %2103, 0
  br i1 %2104, label %2105, label %2109

2105:                                             ; preds = %2100
  %2106 = icmp ult i64 %2103, -63
  %2107 = lshr i64 %2085, %2101
  %2108 = select i1 %2106, i64 0, i64 %2107
  br label %2113

2109:                                             ; preds = %2100
  %2110 = icmp ugt i64 %2103, 63
  %2111 = shl i64 %2085, %2103
  %2112 = select i1 %2110, i64 0, i64 %2111
  br label %2113

2113:                                             ; preds = %2105, %2109
  %2114 = phi i64 [ %2112, %2109 ], [ %2108, %2105 ]
  store i64 %2114, ptr %2064, align 8, !tbaa !6
  %2115 = getelementptr inbounds i8, ptr %2064, i32 8
  store i8 3, ptr %2115, align 8, !tbaa !2
  br label %2116

2116:                                             ; preds = %2084, %2061, %2090, %2094, %2074, %2078, %2113
  %2117 = phi ptr [ %2102, %2113 ], [ %3246, %2078 ], [ %3246, %2074 ], [ %3246, %2094 ], [ %3246, %2090 ], [ %3246, %2061 ], [ %3246, %2084 ]
  %2118 = icmp eq i32 %3245, 0
  br i1 %2118, label %2123, label %2119, !prof !27

2119:                                             ; preds = %2116
  %2120 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2117) #12
  %2121 = load ptr, ptr %29, align 4, !tbaa !6
  %2122 = getelementptr inbounds i8, ptr %2121, i32 16
  br label %2123

2123:                                             ; preds = %2119, %2116
  %2124 = phi i32 [ %2120, %2119 ], [ 0, %2116 ]
  %2125 = phi ptr [ %2122, %2119 ], [ %3247, %2116 ]
  %2126 = getelementptr inbounds i8, ptr %2117, i32 4
  br label %72

2127:                                             ; preds = %3243
  %2128 = lshr i32 %3248, 7
  %2129 = and i32 %2128, 255
  %2130 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2129
  %2131 = lshr i32 %3248, 16
  %2132 = and i32 %2131, 255
  %2133 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2132
  %2134 = lshr i32 %3248, 24
  %2135 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2134
  %2136 = getelementptr inbounds i8, ptr %2133, i32 8
  %2137 = load i8, ptr %2136, align 8, !tbaa !2
  switch i8 %2137, label %2182 [
    i8 3, label %2138
    i8 19, label %2140
  ], !prof !42

2138:                                             ; preds = %2127
  %2139 = load i64, ptr %2133, align 8, !tbaa !6
  br label %2150

2140:                                             ; preds = %2127
  %2141 = load double, ptr %2133, align 8, !tbaa !6
  %2142 = call double @llvm.floor.f64(double %2141)
  %2143 = fcmp une double %2142, %2141
  br i1 %2143, label %2182, label %2144

2144:                                             ; preds = %2140
  %2145 = fcmp oge double %2142, 0xC3E0000000000000
  %2146 = fcmp olt double %2142, 0x43E0000000000000
  %2147 = and i1 %2145, %2146
  br i1 %2147, label %2148, label %2182

2148:                                             ; preds = %2144
  %2149 = fptosi double %2142 to i64
  br label %2150

2150:                                             ; preds = %2148, %2138
  %2151 = phi i64 [ %2139, %2138 ], [ %2149, %2148 ]
  %2152 = getelementptr inbounds i8, ptr %2135, i32 8
  %2153 = load i8, ptr %2152, align 8, !tbaa !2
  switch i8 %2153, label %2182 [
    i8 3, label %2154
    i8 19, label %2156
  ], !prof !42

2154:                                             ; preds = %2150
  %2155 = load i64, ptr %2135, align 8, !tbaa !6
  br label %2166

2156:                                             ; preds = %2150
  %2157 = load double, ptr %2135, align 8, !tbaa !6
  %2158 = call double @llvm.floor.f64(double %2157)
  %2159 = fcmp une double %2158, %2157
  br i1 %2159, label %2182, label %2160

2160:                                             ; preds = %2156
  %2161 = fcmp oge double %2158, 0xC3E0000000000000
  %2162 = fcmp olt double %2158, 0x43E0000000000000
  %2163 = and i1 %2161, %2162
  br i1 %2163, label %2164, label %2182

2164:                                             ; preds = %2160
  %2165 = fptosi double %2158 to i64
  br label %2166

2166:                                             ; preds = %2164, %2154
  %2167 = phi i64 [ %2155, %2154 ], [ %2165, %2164 ]
  %2168 = getelementptr inbounds i8, ptr %3246, i32 4
  %2169 = icmp slt i64 %2167, 0
  br i1 %2169, label %2170, label %2175

2170:                                             ; preds = %2166
  %2171 = icmp ult i64 %2167, -63
  br i1 %2171, label %2179, label %2172

2172:                                             ; preds = %2170
  %2173 = sub nsw i64 0, %2167
  %2174 = lshr i64 %2151, %2173
  br label %2179

2175:                                             ; preds = %2166
  %2176 = icmp ugt i64 %2167, 63
  %2177 = shl i64 %2151, %2167
  %2178 = select i1 %2176, i64 0, i64 %2177
  br label %2179

2179:                                             ; preds = %2170, %2172, %2175
  %2180 = phi i64 [ %2174, %2172 ], [ 0, %2170 ], [ %2178, %2175 ]
  store i64 %2180, ptr %2130, align 8, !tbaa !6
  %2181 = getelementptr inbounds i8, ptr %2130, i32 8
  store i8 3, ptr %2181, align 8, !tbaa !2
  br label %2182

2182:                                             ; preds = %2150, %2127, %2156, %2160, %2140, %2144, %2179
  %2183 = phi ptr [ %2168, %2179 ], [ %3246, %2144 ], [ %3246, %2140 ], [ %3246, %2160 ], [ %3246, %2156 ], [ %3246, %2127 ], [ %3246, %2150 ]
  %2184 = icmp eq i32 %3245, 0
  br i1 %2184, label %2189, label %2185, !prof !27

2185:                                             ; preds = %2182
  %2186 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2183) #12
  %2187 = load ptr, ptr %29, align 4, !tbaa !6
  %2188 = getelementptr inbounds i8, ptr %2187, i32 16
  br label %2189

2189:                                             ; preds = %2185, %2182
  %2190 = phi i32 [ %2186, %2185 ], [ 0, %2182 ]
  %2191 = phi ptr [ %2188, %2185 ], [ %3247, %2182 ]
  %2192 = getelementptr inbounds i8, ptr %2183, i32 4
  br label %72

2193:                                             ; preds = %3243
  %2194 = lshr i32 %3248, 7
  %2195 = and i32 %2194, 255
  %2196 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2195
  %2197 = getelementptr inbounds i8, ptr %3246, i32 -8
  %2198 = load i32, ptr %2197, align 4, !tbaa !30
  %2199 = lshr i32 %3248, 16
  %2200 = and i32 %2199, 255
  %2201 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2200
  %2202 = lshr i32 %3248, 24
  %2203 = lshr i32 %2198, 7
  %2204 = and i32 %2203, 255
  %2205 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2204
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2206 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2206, ptr %12, align 4, !tbaa !6
  call void @luaT_trybinTM(ptr noundef %0, ptr noundef %2196, ptr noundef %2201, ptr noundef %2205, i32 noundef %2202) #12
  %2207 = load volatile i32, ptr %49, align 4, !tbaa !6
  %2208 = icmp eq i32 %2207, 0
  br i1 %2208, label %2213, label %2209, !prof !27

2209:                                             ; preds = %2193
  %2210 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %3246) #12
  %2211 = load ptr, ptr %29, align 4, !tbaa !6
  %2212 = getelementptr inbounds i8, ptr %2211, i32 16
  br label %2213

2213:                                             ; preds = %2209, %2193
  %2214 = phi i32 [ %2210, %2209 ], [ 0, %2193 ]
  %2215 = phi ptr [ %2212, %2209 ], [ %3247, %2193 ]
  %2216 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

2217:                                             ; preds = %3243
  %2218 = lshr i32 %3248, 7
  %2219 = and i32 %2218, 255
  %2220 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2219
  %2221 = getelementptr inbounds i8, ptr %3246, i32 -8
  %2222 = load i32, ptr %2221, align 4, !tbaa !30
  %2223 = lshr i32 %3248, 16
  %2224 = and i32 %2223, 255
  %2225 = add nsw i32 %2224, -127
  %2226 = lshr i32 %3248, 24
  %2227 = lshr i32 %3248, 15
  %2228 = and i32 %2227, 1
  %2229 = lshr i32 %2222, 7
  %2230 = and i32 %2229, 255
  %2231 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2230
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2232 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2232, ptr %12, align 4, !tbaa !6
  %2233 = sext i32 %2225 to i64
  call void @luaT_trybiniTM(ptr noundef %0, ptr noundef %2220, i64 noundef %2233, i32 noundef %2228, ptr noundef %2231, i32 noundef %2226) #12
  %2234 = load volatile i32, ptr %49, align 4, !tbaa !6
  %2235 = icmp eq i32 %2234, 0
  br i1 %2235, label %2240, label %2236, !prof !27

2236:                                             ; preds = %2217
  %2237 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %3246) #12
  %2238 = load ptr, ptr %29, align 4, !tbaa !6
  %2239 = getelementptr inbounds i8, ptr %2238, i32 16
  br label %2240

2240:                                             ; preds = %2236, %2217
  %2241 = phi i32 [ %2237, %2236 ], [ 0, %2217 ]
  %2242 = phi ptr [ %2239, %2236 ], [ %3247, %2217 ]
  %2243 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

2244:                                             ; preds = %3243
  %2245 = lshr i32 %3248, 7
  %2246 = and i32 %2245, 255
  %2247 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2246
  %2248 = getelementptr inbounds i8, ptr %3246, i32 -8
  %2249 = load i32, ptr %2248, align 4, !tbaa !30
  %2250 = lshr i32 %3248, 16
  %2251 = and i32 %2250, 255
  %2252 = getelementptr inbounds %struct.TValue, ptr %35, i32 %2251
  %2253 = lshr i32 %3248, 24
  %2254 = lshr i32 %3248, 15
  %2255 = and i32 %2254, 1
  %2256 = lshr i32 %2249, 7
  %2257 = and i32 %2256, 255
  %2258 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2257
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2259 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2259, ptr %12, align 4, !tbaa !6
  call void @luaT_trybinassocTM(ptr noundef %0, ptr noundef %2247, ptr noundef %2252, i32 noundef %2255, ptr noundef %2258, i32 noundef %2253) #12
  %2260 = load volatile i32, ptr %49, align 4, !tbaa !6
  %2261 = icmp eq i32 %2260, 0
  br i1 %2261, label %2266, label %2262, !prof !27

2262:                                             ; preds = %2244
  %2263 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %3246) #12
  %2264 = load ptr, ptr %29, align 4, !tbaa !6
  %2265 = getelementptr inbounds i8, ptr %2264, i32 16
  br label %2266

2266:                                             ; preds = %2262, %2244
  %2267 = phi i32 [ %2263, %2262 ], [ 0, %2244 ]
  %2268 = phi ptr [ %2265, %2262 ], [ %3247, %2244 ]
  %2269 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

2270:                                             ; preds = %3243
  %2271 = lshr i32 %3248, 7
  %2272 = and i32 %2271, 255
  %2273 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2272
  %2274 = lshr i32 %3248, 16
  %2275 = and i32 %2274, 255
  %2276 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2275
  %2277 = getelementptr inbounds i8, ptr %2276, i32 8
  %2278 = load i8, ptr %2277, align 8, !tbaa !2
  switch i8 %2278, label %2287 [
    i8 3, label %2279
    i8 19, label %2283
  ]

2279:                                             ; preds = %2270
  %2280 = load i64, ptr %2276, align 8, !tbaa !6
  %2281 = sub i64 0, %2280
  store i64 %2281, ptr %2273, align 8, !tbaa !6
  %2282 = getelementptr inbounds i8, ptr %2273, i32 8
  store i8 3, ptr %2282, align 8, !tbaa !2
  br label %2290

2283:                                             ; preds = %2270
  %2284 = load double, ptr %2276, align 8, !tbaa !6
  %2285 = fneg double %2284
  store double %2285, ptr %2273, align 8, !tbaa !6
  %2286 = getelementptr inbounds i8, ptr %2273, i32 8
  store i8 19, ptr %2286, align 8, !tbaa !2
  br label %2290

2287:                                             ; preds = %2270
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2288 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2288, ptr %12, align 4, !tbaa !6
  call void @luaT_trybinTM(ptr noundef %0, ptr noundef nonnull %2276, ptr noundef nonnull %2276, ptr noundef nonnull %2273, i32 noundef 18) #12
  %2289 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2290

2290:                                             ; preds = %2283, %2287, %2279
  %2291 = phi i32 [ %3245, %2279 ], [ %3245, %2283 ], [ %2289, %2287 ]
  %2292 = icmp eq i32 %2291, 0
  br i1 %2292, label %2297, label %2293, !prof !27

2293:                                             ; preds = %2290
  %2294 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %2295 = load ptr, ptr %29, align 4, !tbaa !6
  %2296 = getelementptr inbounds i8, ptr %2295, i32 16
  br label %2297

2297:                                             ; preds = %2293, %2290
  %2298 = phi i32 [ %2294, %2293 ], [ 0, %2290 ]
  %2299 = phi ptr [ %2296, %2293 ], [ %3247, %2290 ]
  %2300 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

2301:                                             ; preds = %3243
  %2302 = lshr i32 %3248, 7
  %2303 = and i32 %2302, 255
  %2304 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2303
  %2305 = lshr i32 %3248, 16
  %2306 = and i32 %2305, 255
  %2307 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2306
  %2308 = getelementptr inbounds i8, ptr %2307, i32 8
  %2309 = load i8, ptr %2308, align 8, !tbaa !2
  switch i8 %2309, label %2326 [
    i8 3, label %2310
    i8 19, label %2312
  ], !prof !42

2310:                                             ; preds = %2301
  %2311 = load i64, ptr %2307, align 8, !tbaa !6
  br label %2322

2312:                                             ; preds = %2301
  %2313 = load double, ptr %2307, align 8, !tbaa !6
  %2314 = call double @llvm.floor.f64(double %2313)
  %2315 = fcmp une double %2314, %2313
  br i1 %2315, label %2326, label %2316

2316:                                             ; preds = %2312
  %2317 = fcmp oge double %2314, 0xC3E0000000000000
  %2318 = fcmp olt double %2314, 0x43E0000000000000
  %2319 = and i1 %2317, %2318
  br i1 %2319, label %2320, label %2326

2320:                                             ; preds = %2316
  %2321 = fptosi double %2314 to i64
  br label %2322

2322:                                             ; preds = %2320, %2310
  %2323 = phi i64 [ %2311, %2310 ], [ %2321, %2320 ]
  %2324 = xor i64 %2323, -1
  store i64 %2324, ptr %2304, align 8, !tbaa !6
  %2325 = getelementptr inbounds i8, ptr %2304, i32 8
  store i8 3, ptr %2325, align 8, !tbaa !2
  br label %2329

2326:                                             ; preds = %2301, %2312, %2316
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2327 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2327, ptr %12, align 4, !tbaa !6
  call void @luaT_trybinTM(ptr noundef %0, ptr noundef nonnull %2307, ptr noundef nonnull %2307, ptr noundef nonnull %2304, i32 noundef 19) #12
  %2328 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2329

2329:                                             ; preds = %2326, %2322
  %2330 = phi i32 [ %3245, %2322 ], [ %2328, %2326 ]
  %2331 = icmp eq i32 %2330, 0
  br i1 %2331, label %2336, label %2332, !prof !27

2332:                                             ; preds = %2329
  %2333 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %2334 = load ptr, ptr %29, align 4, !tbaa !6
  %2335 = getelementptr inbounds i8, ptr %2334, i32 16
  br label %2336

2336:                                             ; preds = %2332, %2329
  %2337 = phi i32 [ %2333, %2332 ], [ 0, %2329 ]
  %2338 = phi ptr [ %2335, %2332 ], [ %3247, %2329 ]
  %2339 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

2340:                                             ; preds = %3243
  %2341 = lshr i32 %3248, 7
  %2342 = and i32 %2341, 255
  %2343 = lshr i32 %3248, 16
  %2344 = and i32 %2343, 255
  %2345 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2344, i32 0, i32 1
  %2346 = load i8, ptr %2345, align 8, !tbaa !2
  %2347 = icmp eq i8 %2346, 1
  %2348 = and i8 %2346, 15
  %2349 = icmp eq i8 %2348, 0
  %2350 = or i1 %2347, %2349
  %2351 = select i1 %2350, i8 17, i8 1
  %2352 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2342, i32 0, i32 1
  store i8 %2351, ptr %2352, align 8
  %2353 = icmp eq i32 %3245, 0
  br i1 %2353, label %2358, label %2354, !prof !27

2354:                                             ; preds = %2340
  %2355 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %2356 = load ptr, ptr %29, align 4, !tbaa !6
  %2357 = getelementptr inbounds i8, ptr %2356, i32 16
  br label %2358

2358:                                             ; preds = %2354, %2340
  %2359 = phi i32 [ %2355, %2354 ], [ 0, %2340 ]
  %2360 = phi ptr [ %2357, %2354 ], [ %3247, %2340 ]
  %2361 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

2362:                                             ; preds = %3243
  %2363 = lshr i32 %3248, 7
  %2364 = and i32 %2363, 255
  %2365 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2364
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2366 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2366, ptr %12, align 4, !tbaa !6
  %2367 = lshr i32 %3248, 16
  %2368 = and i32 %2367, 255
  %2369 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2368
  call void @luaV_objlen(ptr noundef %0, ptr noundef %2365, ptr noundef %2369)
  %2370 = load volatile i32, ptr %49, align 4, !tbaa !6
  %2371 = icmp eq i32 %2370, 0
  br i1 %2371, label %2376, label %2372, !prof !27

2372:                                             ; preds = %2362
  %2373 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %3246) #12
  %2374 = load ptr, ptr %29, align 4, !tbaa !6
  %2375 = getelementptr inbounds i8, ptr %2374, i32 16
  br label %2376

2376:                                             ; preds = %2372, %2362
  %2377 = phi i32 [ %2373, %2372 ], [ 0, %2362 ]
  %2378 = phi ptr [ %2375, %2372 ], [ %3247, %2362 ]
  %2379 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

2380:                                             ; preds = %3243
  %2381 = lshr i32 %3248, 7
  %2382 = and i32 %2381, 255
  %2383 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2382
  %2384 = lshr i32 %3248, 16
  %2385 = and i32 %2384, 255
  %2386 = getelementptr inbounds %union.StackValue, ptr %2383, i32 %2385
  store ptr %2386, ptr %12, align 4, !tbaa !6
  store ptr %3246, ptr %36, align 4, !tbaa !6
  call void @luaV_concat(ptr noundef %0, i32 noundef %2385)
  %2387 = load volatile i32, ptr %49, align 4, !tbaa !6
  %2388 = load ptr, ptr %13, align 4, !tbaa !18
  %2389 = getelementptr inbounds i8, ptr %2388, i32 12
  %2390 = load i32, ptr %2389, align 4, !tbaa !39
  %2391 = icmp sgt i32 %2390, 0
  br i1 %2391, label %2392, label %2394

2392:                                             ; preds = %2380
  store ptr %3246, ptr %36, align 4, !tbaa !6
  call void @luaC_step(ptr noundef nonnull %0) #12
  %2393 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2394

2394:                                             ; preds = %2392, %2380
  %2395 = phi i32 [ %2393, %2392 ], [ %2387, %2380 ]
  %2396 = icmp eq i32 %2395, 0
  br i1 %2396, label %2401, label %2397, !prof !27

2397:                                             ; preds = %2394
  %2398 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %3246) #12
  %2399 = load ptr, ptr %29, align 4, !tbaa !6
  %2400 = getelementptr inbounds i8, ptr %2399, i32 16
  br label %2401

2401:                                             ; preds = %2397, %2394
  %2402 = phi i32 [ %2398, %2397 ], [ 0, %2394 ]
  %2403 = phi ptr [ %2400, %2397 ], [ %3247, %2394 ]
  %2404 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

2405:                                             ; preds = %3243
  %2406 = lshr i32 %3248, 7
  %2407 = and i32 %2406, 255
  %2408 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2407
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2409 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2409, ptr %12, align 4, !tbaa !6
  %2410 = call ptr @luaF_close(ptr noundef %0, ptr noundef %2408, i32 noundef 0, i32 noundef 1) #12
  %2411 = load volatile i32, ptr %49, align 4, !tbaa !6
  %2412 = icmp eq i32 %2411, 0
  br i1 %2412, label %2417, label %2413, !prof !27

2413:                                             ; preds = %2405
  %2414 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %3246) #12
  %2415 = load ptr, ptr %29, align 4, !tbaa !6
  %2416 = getelementptr inbounds i8, ptr %2415, i32 16
  br label %2417

2417:                                             ; preds = %2413, %2405
  %2418 = phi i32 [ %2414, %2413 ], [ 0, %2405 ]
  %2419 = phi ptr [ %2416, %2413 ], [ %3247, %2405 ]
  %2420 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

2421:                                             ; preds = %3243
  %2422 = lshr i32 %3248, 7
  %2423 = and i32 %2422, 255
  %2424 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2423
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2425 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2425, ptr %12, align 4, !tbaa !6
  call void @luaF_newtbcupval(ptr noundef %0, ptr noundef %2424) #12
  %2426 = icmp eq i32 %3245, 0
  br i1 %2426, label %2431, label %2427, !prof !27

2427:                                             ; preds = %2421
  %2428 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %3246) #12
  %2429 = load ptr, ptr %29, align 4, !tbaa !6
  %2430 = getelementptr inbounds i8, ptr %2429, i32 16
  br label %2431

2431:                                             ; preds = %2427, %2421
  %2432 = phi i32 [ %2428, %2427 ], [ 0, %2421 ]
  %2433 = phi ptr [ %2430, %2427 ], [ %3247, %2421 ]
  %2434 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

2435:                                             ; preds = %3243
  %2436 = lshr i32 %3248, 7
  %2437 = add nsw i32 %2436, -16777215
  %2438 = getelementptr inbounds i32, ptr %3246, i32 %2437
  %2439 = load volatile i32, ptr %49, align 4, !tbaa !6
  %2440 = icmp eq i32 %2439, 0
  br i1 %2440, label %2445, label %2441, !prof !27

2441:                                             ; preds = %2435
  %2442 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2438) #12
  %2443 = load ptr, ptr %29, align 4, !tbaa !6
  %2444 = getelementptr inbounds i8, ptr %2443, i32 16
  br label %2445

2445:                                             ; preds = %2441, %2435
  %2446 = phi i32 [ %2442, %2441 ], [ 0, %2435 ]
  %2447 = phi ptr [ %2444, %2441 ], [ %3247, %2435 ]
  %2448 = getelementptr inbounds i8, ptr %2438, i32 4
  br label %72

2449:                                             ; preds = %3243
  %2450 = lshr i32 %3248, 7
  %2451 = and i32 %2450, 255
  %2452 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2451
  %2453 = lshr i32 %3248, 16
  %2454 = and i32 %2453, 255
  %2455 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2454
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2456 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2456, ptr %12, align 4, !tbaa !6
  %2457 = call i32 @luaV_equalobj(ptr noundef %0, ptr noundef %2452, ptr noundef %2455)
  %2458 = load volatile i32, ptr %49, align 4, !tbaa !6
  %2459 = lshr i32 %3248, 15
  %2460 = and i32 %2459, 1
  %2461 = icmp eq i32 %2457, %2460
  br i1 %2461, label %2464, label %2462

2462:                                             ; preds = %2449
  %2463 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %2470

2464:                                             ; preds = %2449
  %2465 = load i32, ptr %3246, align 4, !tbaa !30
  %2466 = lshr i32 %2465, 7
  %2467 = add nsw i32 %2466, -16777214
  %2468 = getelementptr inbounds i32, ptr %3246, i32 %2467
  %2469 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2470

2470:                                             ; preds = %2464, %2462
  %2471 = phi i32 [ %2458, %2462 ], [ %2469, %2464 ]
  %2472 = phi ptr [ %2463, %2462 ], [ %2468, %2464 ]
  %2473 = icmp eq i32 %2471, 0
  br i1 %2473, label %2478, label %2474, !prof !27

2474:                                             ; preds = %2470
  %2475 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %2472) #12
  %2476 = load ptr, ptr %29, align 4, !tbaa !6
  %2477 = getelementptr inbounds i8, ptr %2476, i32 16
  br label %2478

2478:                                             ; preds = %2474, %2470
  %2479 = phi i32 [ %2475, %2474 ], [ 0, %2470 ]
  %2480 = phi ptr [ %2477, %2474 ], [ %3247, %2470 ]
  %2481 = getelementptr inbounds i8, ptr %2472, i32 4
  br label %72

2482:                                             ; preds = %3243
  %2483 = lshr i32 %3248, 7
  %2484 = and i32 %2483, 255
  %2485 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2484
  %2486 = lshr i32 %3248, 16
  %2487 = and i32 %2486, 255
  %2488 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2487
  %2489 = getelementptr inbounds i8, ptr %2485, i32 8
  %2490 = load i8, ptr %2489, align 8, !tbaa !6
  %2491 = icmp eq i8 %2490, 3
  br i1 %2491, label %2492, label %2501

2492:                                             ; preds = %2482
  %2493 = getelementptr inbounds i8, ptr %2488, i32 8
  %2494 = load i8, ptr %2493, align 8, !tbaa !2
  %2495 = icmp eq i8 %2494, 3
  br i1 %2495, label %2496, label %2504

2496:                                             ; preds = %2492
  %2497 = load i64, ptr %2485, align 8, !tbaa !6
  %2498 = load i64, ptr %2488, align 8, !tbaa !6
  %2499 = icmp slt i64 %2497, %2498
  %2500 = zext i1 %2499 to i32
  br label %2577

2501:                                             ; preds = %2482
  %2502 = and i8 %2490, 15
  %2503 = icmp eq i8 %2502, 3
  br i1 %2503, label %2507, label %2557

2504:                                             ; preds = %2492
  %2505 = and i8 %2494, 15
  %2506 = icmp eq i8 %2505, 3
  br i1 %2506, label %2512, label %2557

2507:                                             ; preds = %2501
  %2508 = getelementptr inbounds i8, ptr %2488, i32 8
  %2509 = load i8, ptr %2508, align 8, !tbaa !2
  %2510 = and i8 %2509, 15
  %2511 = icmp eq i8 %2510, 3
  br i1 %2511, label %2532, label %2557

2512:                                             ; preds = %2504
  %2513 = load i64, ptr %2485, align 8, !tbaa !6
  %2514 = load double, ptr %2488, align 8, !tbaa !6
  %2515 = add i64 %2513, 9007199254740992
  %2516 = icmp ult i64 %2515, 18014398509481985
  br i1 %2516, label %2517, label %2520

2517:                                             ; preds = %2512
  %2518 = sitofp i64 %2513 to double
  %2519 = fcmp ogt double %2514, %2518
  br label %2554

2520:                                             ; preds = %2512
  %2521 = call double @llvm.floor.f64(double %2514)
  %2522 = fcmp une double %2521, %2514
  %2523 = fadd double %2521, 1.000000e+00
  %2524 = select i1 %2522, double %2523, double %2521
  %2525 = fcmp oge double %2524, 0xC3E0000000000000
  %2526 = fcmp olt double %2524, 0x43E0000000000000
  %2527 = and i1 %2525, %2526
  %2528 = fptosi double %2524 to i64
  %2529 = icmp slt i64 %2513, %2528
  %2530 = fcmp ogt double %2514, 0.000000e+00
  %2531 = select i1 %2527, i1 %2529, i1 %2530
  br label %2554

2532:                                             ; preds = %2507
  %2533 = load double, ptr %2485, align 8, !tbaa !6
  %2534 = icmp eq i8 %2509, 19
  br i1 %2534, label %2535, label %2538

2535:                                             ; preds = %2532
  %2536 = load double, ptr %2488, align 8, !tbaa !6
  %2537 = fcmp olt double %2533, %2536
  br label %2554

2538:                                             ; preds = %2532
  %2539 = load i64, ptr %2488, align 8, !tbaa !6
  %2540 = add i64 %2539, 9007199254740992
  %2541 = icmp ult i64 %2540, 18014398509481985
  br i1 %2541, label %2542, label %2545

2542:                                             ; preds = %2538
  %2543 = sitofp i64 %2539 to double
  %2544 = fcmp olt double %2533, %2543
  br label %2554

2545:                                             ; preds = %2538
  %2546 = call double @llvm.floor.f64(double %2533)
  %2547 = fcmp oge double %2546, 0xC3E0000000000000
  %2548 = fcmp olt double %2546, 0x43E0000000000000
  %2549 = and i1 %2547, %2548
  %2550 = fptosi double %2546 to i64
  %2551 = icmp sgt i64 %2539, %2550
  %2552 = fcmp olt double %2533, 0.000000e+00
  %2553 = select i1 %2549, i1 %2551, i1 %2552
  br label %2554

2554:                                             ; preds = %2517, %2520, %2535, %2542, %2545
  %2555 = phi i1 [ %2537, %2535 ], [ %2519, %2517 ], [ %2531, %2520 ], [ %2544, %2542 ], [ %2553, %2545 ]
  %2556 = zext i1 %2555 to i32
  br label %2577

2557:                                             ; preds = %2507, %2504, %2501
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2558 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2558, ptr %12, align 4, !tbaa !6
  %2559 = load i8, ptr %2489, align 8, !tbaa !2
  %2560 = and i8 %2559, 15
  %2561 = icmp eq i8 %2560, 4
  br i1 %2561, label %2562, label %2572

2562:                                             ; preds = %2557
  %2563 = getelementptr inbounds i8, ptr %2488, i32 8
  %2564 = load i8, ptr %2563, align 8, !tbaa !2
  %2565 = and i8 %2564, 15
  %2566 = icmp eq i8 %2565, 4
  br i1 %2566, label %2567, label %2572

2567:                                             ; preds = %2562
  %2568 = load ptr, ptr %2485, align 8, !tbaa !6
  %2569 = load ptr, ptr %2488, align 8, !tbaa !6
  %2570 = call fastcc i32 @l_strcmp(ptr noundef %2568, ptr noundef %2569)
  %2571 = lshr i32 %2570, 31
  br label %2574

2572:                                             ; preds = %2562, %2557
  %2573 = call i32 @luaT_callorderTM(ptr noundef nonnull %0, ptr noundef nonnull %2485, ptr noundef nonnull %2488, i32 noundef 20) #12
  br label %2574

2574:                                             ; preds = %2567, %2572
  %2575 = phi i32 [ %2571, %2567 ], [ %2573, %2572 ]
  %2576 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2577

2577:                                             ; preds = %2554, %2574, %2496
  %2578 = phi i32 [ %2500, %2496 ], [ %2556, %2554 ], [ %2575, %2574 ]
  %2579 = phi i32 [ %3245, %2496 ], [ %3245, %2554 ], [ %2576, %2574 ]
  %2580 = lshr i32 %3248, 15
  %2581 = and i32 %2580, 1
  %2582 = icmp eq i32 %2578, %2581
  br i1 %2582, label %2585, label %2583

2583:                                             ; preds = %2577
  %2584 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %2591

2585:                                             ; preds = %2577
  %2586 = load i32, ptr %3246, align 4, !tbaa !30
  %2587 = lshr i32 %2586, 7
  %2588 = add nsw i32 %2587, -16777214
  %2589 = getelementptr inbounds i32, ptr %3246, i32 %2588
  %2590 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2591

2591:                                             ; preds = %2585, %2583
  %2592 = phi i32 [ %2579, %2583 ], [ %2590, %2585 ]
  %2593 = phi ptr [ %2584, %2583 ], [ %2589, %2585 ]
  %2594 = icmp eq i32 %2592, 0
  br i1 %2594, label %2599, label %2595, !prof !27

2595:                                             ; preds = %2591
  %2596 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2593) #12
  %2597 = load ptr, ptr %29, align 4, !tbaa !6
  %2598 = getelementptr inbounds i8, ptr %2597, i32 16
  br label %2599

2599:                                             ; preds = %2595, %2591
  %2600 = phi i32 [ %2596, %2595 ], [ 0, %2591 ]
  %2601 = phi ptr [ %2598, %2595 ], [ %3247, %2591 ]
  %2602 = getelementptr inbounds i8, ptr %2593, i32 4
  br label %72

2603:                                             ; preds = %3243
  %2604 = lshr i32 %3248, 7
  %2605 = and i32 %2604, 255
  %2606 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2605
  %2607 = lshr i32 %3248, 16
  %2608 = and i32 %2607, 255
  %2609 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2608
  %2610 = getelementptr inbounds i8, ptr %2606, i32 8
  %2611 = load i8, ptr %2610, align 8, !tbaa !6
  %2612 = icmp eq i8 %2611, 3
  br i1 %2612, label %2613, label %2622

2613:                                             ; preds = %2603
  %2614 = getelementptr inbounds i8, ptr %2609, i32 8
  %2615 = load i8, ptr %2614, align 8, !tbaa !2
  %2616 = icmp eq i8 %2615, 3
  br i1 %2616, label %2617, label %2625

2617:                                             ; preds = %2613
  %2618 = load i64, ptr %2606, align 8, !tbaa !6
  %2619 = load i64, ptr %2609, align 8, !tbaa !6
  %2620 = icmp sle i64 %2618, %2619
  %2621 = zext i1 %2620 to i32
  br label %2699

2622:                                             ; preds = %2603
  %2623 = and i8 %2611, 15
  %2624 = icmp eq i8 %2623, 3
  br i1 %2624, label %2628, label %2678

2625:                                             ; preds = %2613
  %2626 = and i8 %2615, 15
  %2627 = icmp eq i8 %2626, 3
  br i1 %2627, label %2633, label %2678

2628:                                             ; preds = %2622
  %2629 = getelementptr inbounds i8, ptr %2609, i32 8
  %2630 = load i8, ptr %2629, align 8, !tbaa !2
  %2631 = and i8 %2630, 15
  %2632 = icmp eq i8 %2631, 3
  br i1 %2632, label %2650, label %2678

2633:                                             ; preds = %2625
  %2634 = load i64, ptr %2606, align 8, !tbaa !6
  %2635 = load double, ptr %2609, align 8, !tbaa !6
  %2636 = add i64 %2634, 9007199254740992
  %2637 = icmp ult i64 %2636, 18014398509481985
  br i1 %2637, label %2638, label %2641

2638:                                             ; preds = %2633
  %2639 = sitofp i64 %2634 to double
  %2640 = fcmp oge double %2635, %2639
  br label %2675

2641:                                             ; preds = %2633
  %2642 = call double @llvm.floor.f64(double %2635)
  %2643 = fcmp ult double %2642, 0xC3E0000000000000
  %2644 = fcmp uge double %2642, 0x43E0000000000000
  %2645 = or i1 %2643, %2644
  %2646 = fptosi double %2642 to i64
  %2647 = icmp sle i64 %2634, %2646
  %2648 = fcmp ogt double %2635, 0.000000e+00
  %2649 = select i1 %2645, i1 %2648, i1 %2647
  br label %2675

2650:                                             ; preds = %2628
  %2651 = load double, ptr %2606, align 8, !tbaa !6
  %2652 = icmp eq i8 %2630, 19
  br i1 %2652, label %2653, label %2656

2653:                                             ; preds = %2650
  %2654 = load double, ptr %2609, align 8, !tbaa !6
  %2655 = fcmp ole double %2651, %2654
  br label %2675

2656:                                             ; preds = %2650
  %2657 = load i64, ptr %2609, align 8, !tbaa !6
  %2658 = add i64 %2657, 9007199254740992
  %2659 = icmp ult i64 %2658, 18014398509481985
  br i1 %2659, label %2660, label %2663

2660:                                             ; preds = %2656
  %2661 = sitofp i64 %2657 to double
  %2662 = fcmp ole double %2651, %2661
  br label %2675

2663:                                             ; preds = %2656
  %2664 = call double @llvm.floor.f64(double %2651)
  %2665 = fcmp une double %2664, %2651
  %2666 = fadd double %2664, 1.000000e+00
  %2667 = select i1 %2665, double %2666, double %2664
  %2668 = fcmp ult double %2667, 0xC3E0000000000000
  %2669 = fcmp uge double %2667, 0x43E0000000000000
  %2670 = or i1 %2668, %2669
  %2671 = fptosi double %2667 to i64
  %2672 = icmp sge i64 %2657, %2671
  %2673 = fcmp olt double %2651, 0.000000e+00
  %2674 = select i1 %2670, i1 %2673, i1 %2672
  br label %2675

2675:                                             ; preds = %2638, %2641, %2653, %2660, %2663
  %2676 = phi i1 [ %2655, %2653 ], [ %2640, %2638 ], [ %2649, %2641 ], [ %2662, %2660 ], [ %2674, %2663 ]
  %2677 = zext i1 %2676 to i32
  br label %2699

2678:                                             ; preds = %2628, %2625, %2622
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2679 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2679, ptr %12, align 4, !tbaa !6
  %2680 = load i8, ptr %2610, align 8, !tbaa !2
  %2681 = and i8 %2680, 15
  %2682 = icmp eq i8 %2681, 4
  br i1 %2682, label %2683, label %2694

2683:                                             ; preds = %2678
  %2684 = getelementptr inbounds i8, ptr %2609, i32 8
  %2685 = load i8, ptr %2684, align 8, !tbaa !2
  %2686 = and i8 %2685, 15
  %2687 = icmp eq i8 %2686, 4
  br i1 %2687, label %2688, label %2694

2688:                                             ; preds = %2683
  %2689 = load ptr, ptr %2606, align 8, !tbaa !6
  %2690 = load ptr, ptr %2609, align 8, !tbaa !6
  %2691 = call fastcc i32 @l_strcmp(ptr noundef %2689, ptr noundef %2690)
  %2692 = icmp slt i32 %2691, 1
  %2693 = zext i1 %2692 to i32
  br label %2696

2694:                                             ; preds = %2683, %2678
  %2695 = call i32 @luaT_callorderTM(ptr noundef nonnull %0, ptr noundef nonnull %2606, ptr noundef nonnull %2609, i32 noundef 21) #12
  br label %2696

2696:                                             ; preds = %2688, %2694
  %2697 = phi i32 [ %2693, %2688 ], [ %2695, %2694 ]
  %2698 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2699

2699:                                             ; preds = %2675, %2696, %2617
  %2700 = phi i32 [ %2621, %2617 ], [ %2677, %2675 ], [ %2697, %2696 ]
  %2701 = phi i32 [ %3245, %2617 ], [ %3245, %2675 ], [ %2698, %2696 ]
  %2702 = lshr i32 %3248, 15
  %2703 = and i32 %2702, 1
  %2704 = icmp eq i32 %2700, %2703
  br i1 %2704, label %2707, label %2705

2705:                                             ; preds = %2699
  %2706 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %2713

2707:                                             ; preds = %2699
  %2708 = load i32, ptr %3246, align 4, !tbaa !30
  %2709 = lshr i32 %2708, 7
  %2710 = add nsw i32 %2709, -16777214
  %2711 = getelementptr inbounds i32, ptr %3246, i32 %2710
  %2712 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2713

2713:                                             ; preds = %2707, %2705
  %2714 = phi i32 [ %2701, %2705 ], [ %2712, %2707 ]
  %2715 = phi ptr [ %2706, %2705 ], [ %2711, %2707 ]
  %2716 = icmp eq i32 %2714, 0
  br i1 %2716, label %2721, label %2717, !prof !27

2717:                                             ; preds = %2713
  %2718 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2715) #12
  %2719 = load ptr, ptr %29, align 4, !tbaa !6
  %2720 = getelementptr inbounds i8, ptr %2719, i32 16
  br label %2721

2721:                                             ; preds = %2717, %2713
  %2722 = phi i32 [ %2718, %2717 ], [ 0, %2713 ]
  %2723 = phi ptr [ %2720, %2717 ], [ %3247, %2713 ]
  %2724 = getelementptr inbounds i8, ptr %2715, i32 4
  br label %72

2725:                                             ; preds = %3243
  %2726 = lshr i32 %3248, 7
  %2727 = and i32 %2726, 255
  %2728 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2727
  %2729 = lshr i32 %3248, 16
  %2730 = and i32 %2729, 255
  %2731 = getelementptr inbounds %struct.TValue, ptr %35, i32 %2730
  %2732 = call i32 @luaV_equalobj(ptr noundef null, ptr noundef %2728, ptr noundef %2731)
  %2733 = lshr i32 %3248, 15
  %2734 = and i32 %2733, 1
  %2735 = icmp eq i32 %2732, %2734
  br i1 %2735, label %2738, label %2736

2736:                                             ; preds = %2725
  %2737 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %2744

2738:                                             ; preds = %2725
  %2739 = load i32, ptr %3246, align 4, !tbaa !30
  %2740 = lshr i32 %2739, 7
  %2741 = add nsw i32 %2740, -16777214
  %2742 = getelementptr inbounds i32, ptr %3246, i32 %2741
  %2743 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2744

2744:                                             ; preds = %2738, %2736
  %2745 = phi i32 [ %3245, %2736 ], [ %2743, %2738 ]
  %2746 = phi ptr [ %2737, %2736 ], [ %2742, %2738 ]
  %2747 = icmp eq i32 %2745, 0
  br i1 %2747, label %2752, label %2748, !prof !27

2748:                                             ; preds = %2744
  %2749 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2746) #12
  %2750 = load ptr, ptr %29, align 4, !tbaa !6
  %2751 = getelementptr inbounds i8, ptr %2750, i32 16
  br label %2752

2752:                                             ; preds = %2748, %2744
  %2753 = phi i32 [ %2749, %2748 ], [ 0, %2744 ]
  %2754 = phi ptr [ %2751, %2748 ], [ %3247, %2744 ]
  %2755 = getelementptr inbounds i8, ptr %2746, i32 4
  br label %72

2756:                                             ; preds = %3243
  %2757 = lshr i32 %3248, 7
  %2758 = and i32 %2757, 255
  %2759 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2758
  %2760 = lshr i32 %3248, 16
  %2761 = and i32 %2760, 255
  %2762 = add nsw i32 %2761, -127
  %2763 = getelementptr inbounds i8, ptr %2759, i32 8
  %2764 = load i8, ptr %2763, align 8, !tbaa !6
  switch i8 %2764, label %2765 [
    i8 3, label %2768
    i8 19, label %2772
  ]

2765:                                             ; preds = %2756
  %2766 = and i32 %3248, 32768
  %2767 = icmp eq i32 %2766, 0
  br i1 %2767, label %2783, label %2781

2768:                                             ; preds = %2756
  %2769 = load i64, ptr %2759, align 8, !tbaa !6
  %2770 = sext i32 %2762 to i64
  %2771 = icmp eq i64 %2769, %2770
  br label %2776

2772:                                             ; preds = %2756
  %2773 = load double, ptr %2759, align 8, !tbaa !6
  %2774 = sitofp i32 %2762 to double
  %2775 = fcmp oeq double %2773, %2774
  br label %2776

2776:                                             ; preds = %2772, %2768
  %2777 = phi i1 [ %2771, %2768 ], [ %2775, %2772 ]
  %2778 = and i32 %3248, 32768
  %2779 = icmp eq i32 %2778, 0
  %2780 = xor i1 %2779, %2777
  br i1 %2780, label %2783, label %2781

2781:                                             ; preds = %2765, %2776
  %2782 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %2789

2783:                                             ; preds = %2765, %2776
  %2784 = load i32, ptr %3246, align 4, !tbaa !30
  %2785 = lshr i32 %2784, 7
  %2786 = add nsw i32 %2785, -16777214
  %2787 = getelementptr inbounds i32, ptr %3246, i32 %2786
  %2788 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2789

2789:                                             ; preds = %2783, %2781
  %2790 = phi i32 [ %3245, %2781 ], [ %2788, %2783 ]
  %2791 = phi ptr [ %2782, %2781 ], [ %2787, %2783 ]
  %2792 = icmp eq i32 %2790, 0
  br i1 %2792, label %2797, label %2793, !prof !27

2793:                                             ; preds = %2789
  %2794 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2791) #12
  %2795 = load ptr, ptr %29, align 4, !tbaa !6
  %2796 = getelementptr inbounds i8, ptr %2795, i32 16
  br label %2797

2797:                                             ; preds = %2793, %2789
  %2798 = phi i32 [ %2794, %2793 ], [ 0, %2789 ]
  %2799 = phi ptr [ %2796, %2793 ], [ %3247, %2789 ]
  %2800 = getelementptr inbounds i8, ptr %2791, i32 4
  br label %72

2801:                                             ; preds = %3243
  %2802 = lshr i32 %3248, 7
  %2803 = and i32 %2802, 255
  %2804 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2803
  %2805 = lshr i32 %3248, 16
  %2806 = and i32 %2805, 255
  %2807 = add nsw i32 %2806, -127
  %2808 = getelementptr inbounds i8, ptr %2804, i32 8
  %2809 = load i8, ptr %2808, align 8, !tbaa !6
  switch i8 %2809, label %2820 [
    i8 3, label %2810
    i8 19, label %2815
  ]

2810:                                             ; preds = %2801
  %2811 = load i64, ptr %2804, align 8, !tbaa !6
  %2812 = sext i32 %2807 to i64
  %2813 = icmp slt i64 %2811, %2812
  %2814 = zext i1 %2813 to i32
  br label %2825

2815:                                             ; preds = %2801
  %2816 = load double, ptr %2804, align 8, !tbaa !6
  %2817 = sitofp i32 %2807 to double
  %2818 = fcmp olt double %2816, %2817
  %2819 = zext i1 %2818 to i32
  br label %2825

2820:                                             ; preds = %2801
  %2821 = lshr i32 %3248, 24
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2822 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2822, ptr %12, align 4, !tbaa !6
  %2823 = call i32 @luaT_callorderiTM(ptr noundef %0, ptr noundef nonnull %2804, i32 noundef %2807, i32 noundef 0, i32 noundef %2821, i32 noundef 20) #12
  %2824 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2825

2825:                                             ; preds = %2815, %2820, %2810
  %2826 = phi i32 [ %2814, %2810 ], [ %2819, %2815 ], [ %2823, %2820 ]
  %2827 = phi i32 [ %3245, %2810 ], [ %3245, %2815 ], [ %2824, %2820 ]
  %2828 = lshr i32 %3248, 15
  %2829 = and i32 %2828, 1
  %2830 = icmp eq i32 %2826, %2829
  br i1 %2830, label %2833, label %2831

2831:                                             ; preds = %2825
  %2832 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %2839

2833:                                             ; preds = %2825
  %2834 = load i32, ptr %3246, align 4, !tbaa !30
  %2835 = lshr i32 %2834, 7
  %2836 = add nsw i32 %2835, -16777214
  %2837 = getelementptr inbounds i32, ptr %3246, i32 %2836
  %2838 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2839

2839:                                             ; preds = %2833, %2831
  %2840 = phi i32 [ %2827, %2831 ], [ %2838, %2833 ]
  %2841 = phi ptr [ %2832, %2831 ], [ %2837, %2833 ]
  %2842 = icmp eq i32 %2840, 0
  br i1 %2842, label %2847, label %2843, !prof !27

2843:                                             ; preds = %2839
  %2844 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2841) #12
  %2845 = load ptr, ptr %29, align 4, !tbaa !6
  %2846 = getelementptr inbounds i8, ptr %2845, i32 16
  br label %2847

2847:                                             ; preds = %2843, %2839
  %2848 = phi i32 [ %2844, %2843 ], [ 0, %2839 ]
  %2849 = phi ptr [ %2846, %2843 ], [ %3247, %2839 ]
  %2850 = getelementptr inbounds i8, ptr %2841, i32 4
  br label %72

2851:                                             ; preds = %3243
  %2852 = lshr i32 %3248, 7
  %2853 = and i32 %2852, 255
  %2854 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2853
  %2855 = lshr i32 %3248, 16
  %2856 = and i32 %2855, 255
  %2857 = add nsw i32 %2856, -127
  %2858 = getelementptr inbounds i8, ptr %2854, i32 8
  %2859 = load i8, ptr %2858, align 8, !tbaa !6
  switch i8 %2859, label %2870 [
    i8 3, label %2860
    i8 19, label %2865
  ]

2860:                                             ; preds = %2851
  %2861 = load i64, ptr %2854, align 8, !tbaa !6
  %2862 = sext i32 %2857 to i64
  %2863 = icmp sle i64 %2861, %2862
  %2864 = zext i1 %2863 to i32
  br label %2875

2865:                                             ; preds = %2851
  %2866 = load double, ptr %2854, align 8, !tbaa !6
  %2867 = sitofp i32 %2857 to double
  %2868 = fcmp ole double %2866, %2867
  %2869 = zext i1 %2868 to i32
  br label %2875

2870:                                             ; preds = %2851
  %2871 = lshr i32 %3248, 24
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2872 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2872, ptr %12, align 4, !tbaa !6
  %2873 = call i32 @luaT_callorderiTM(ptr noundef %0, ptr noundef nonnull %2854, i32 noundef %2857, i32 noundef 0, i32 noundef %2871, i32 noundef 21) #12
  %2874 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2875

2875:                                             ; preds = %2865, %2870, %2860
  %2876 = phi i32 [ %2864, %2860 ], [ %2869, %2865 ], [ %2873, %2870 ]
  %2877 = phi i32 [ %3245, %2860 ], [ %3245, %2865 ], [ %2874, %2870 ]
  %2878 = lshr i32 %3248, 15
  %2879 = and i32 %2878, 1
  %2880 = icmp eq i32 %2876, %2879
  br i1 %2880, label %2883, label %2881

2881:                                             ; preds = %2875
  %2882 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %2889

2883:                                             ; preds = %2875
  %2884 = load i32, ptr %3246, align 4, !tbaa !30
  %2885 = lshr i32 %2884, 7
  %2886 = add nsw i32 %2885, -16777214
  %2887 = getelementptr inbounds i32, ptr %3246, i32 %2886
  %2888 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2889

2889:                                             ; preds = %2883, %2881
  %2890 = phi i32 [ %2877, %2881 ], [ %2888, %2883 ]
  %2891 = phi ptr [ %2882, %2881 ], [ %2887, %2883 ]
  %2892 = icmp eq i32 %2890, 0
  br i1 %2892, label %2897, label %2893, !prof !27

2893:                                             ; preds = %2889
  %2894 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2891) #12
  %2895 = load ptr, ptr %29, align 4, !tbaa !6
  %2896 = getelementptr inbounds i8, ptr %2895, i32 16
  br label %2897

2897:                                             ; preds = %2893, %2889
  %2898 = phi i32 [ %2894, %2893 ], [ 0, %2889 ]
  %2899 = phi ptr [ %2896, %2893 ], [ %3247, %2889 ]
  %2900 = getelementptr inbounds i8, ptr %2891, i32 4
  br label %72

2901:                                             ; preds = %3243
  %2902 = lshr i32 %3248, 7
  %2903 = and i32 %2902, 255
  %2904 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2903
  %2905 = lshr i32 %3248, 16
  %2906 = and i32 %2905, 255
  %2907 = add nsw i32 %2906, -127
  %2908 = getelementptr inbounds i8, ptr %2904, i32 8
  %2909 = load i8, ptr %2908, align 8, !tbaa !6
  switch i8 %2909, label %2920 [
    i8 3, label %2910
    i8 19, label %2915
  ]

2910:                                             ; preds = %2901
  %2911 = load i64, ptr %2904, align 8, !tbaa !6
  %2912 = sext i32 %2907 to i64
  %2913 = icmp sgt i64 %2911, %2912
  %2914 = zext i1 %2913 to i32
  br label %2925

2915:                                             ; preds = %2901
  %2916 = load double, ptr %2904, align 8, !tbaa !6
  %2917 = sitofp i32 %2907 to double
  %2918 = fcmp ogt double %2916, %2917
  %2919 = zext i1 %2918 to i32
  br label %2925

2920:                                             ; preds = %2901
  %2921 = lshr i32 %3248, 24
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2922 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2922, ptr %12, align 4, !tbaa !6
  %2923 = call i32 @luaT_callorderiTM(ptr noundef %0, ptr noundef nonnull %2904, i32 noundef %2907, i32 noundef 1, i32 noundef %2921, i32 noundef 20) #12
  %2924 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2925

2925:                                             ; preds = %2915, %2920, %2910
  %2926 = phi i32 [ %2914, %2910 ], [ %2919, %2915 ], [ %2923, %2920 ]
  %2927 = phi i32 [ %3245, %2910 ], [ %3245, %2915 ], [ %2924, %2920 ]
  %2928 = lshr i32 %3248, 15
  %2929 = and i32 %2928, 1
  %2930 = icmp eq i32 %2926, %2929
  br i1 %2930, label %2933, label %2931

2931:                                             ; preds = %2925
  %2932 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %2939

2933:                                             ; preds = %2925
  %2934 = load i32, ptr %3246, align 4, !tbaa !30
  %2935 = lshr i32 %2934, 7
  %2936 = add nsw i32 %2935, -16777214
  %2937 = getelementptr inbounds i32, ptr %3246, i32 %2936
  %2938 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2939

2939:                                             ; preds = %2933, %2931
  %2940 = phi i32 [ %2927, %2931 ], [ %2938, %2933 ]
  %2941 = phi ptr [ %2932, %2931 ], [ %2937, %2933 ]
  %2942 = icmp eq i32 %2940, 0
  br i1 %2942, label %2947, label %2943, !prof !27

2943:                                             ; preds = %2939
  %2944 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2941) #12
  %2945 = load ptr, ptr %29, align 4, !tbaa !6
  %2946 = getelementptr inbounds i8, ptr %2945, i32 16
  br label %2947

2947:                                             ; preds = %2943, %2939
  %2948 = phi i32 [ %2944, %2943 ], [ 0, %2939 ]
  %2949 = phi ptr [ %2946, %2943 ], [ %3247, %2939 ]
  %2950 = getelementptr inbounds i8, ptr %2941, i32 4
  br label %72

2951:                                             ; preds = %3243
  %2952 = lshr i32 %3248, 7
  %2953 = and i32 %2952, 255
  %2954 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %2953
  %2955 = lshr i32 %3248, 16
  %2956 = and i32 %2955, 255
  %2957 = add nsw i32 %2956, -127
  %2958 = getelementptr inbounds i8, ptr %2954, i32 8
  %2959 = load i8, ptr %2958, align 8, !tbaa !6
  switch i8 %2959, label %2970 [
    i8 3, label %2960
    i8 19, label %2965
  ]

2960:                                             ; preds = %2951
  %2961 = load i64, ptr %2954, align 8, !tbaa !6
  %2962 = sext i32 %2957 to i64
  %2963 = icmp sge i64 %2961, %2962
  %2964 = zext i1 %2963 to i32
  br label %2975

2965:                                             ; preds = %2951
  %2966 = load double, ptr %2954, align 8, !tbaa !6
  %2967 = sitofp i32 %2957 to double
  %2968 = fcmp oge double %2966, %2967
  %2969 = zext i1 %2968 to i32
  br label %2975

2970:                                             ; preds = %2951
  %2971 = lshr i32 %3248, 24
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %2972 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %2972, ptr %12, align 4, !tbaa !6
  %2973 = call i32 @luaT_callorderiTM(ptr noundef %0, ptr noundef nonnull %2954, i32 noundef %2957, i32 noundef 1, i32 noundef %2971, i32 noundef 21) #12
  %2974 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2975

2975:                                             ; preds = %2965, %2970, %2960
  %2976 = phi i32 [ %2964, %2960 ], [ %2969, %2965 ], [ %2973, %2970 ]
  %2977 = phi i32 [ %3245, %2960 ], [ %3245, %2965 ], [ %2974, %2970 ]
  %2978 = lshr i32 %3248, 15
  %2979 = and i32 %2978, 1
  %2980 = icmp eq i32 %2976, %2979
  br i1 %2980, label %2983, label %2981

2981:                                             ; preds = %2975
  %2982 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %2989

2983:                                             ; preds = %2975
  %2984 = load i32, ptr %3246, align 4, !tbaa !30
  %2985 = lshr i32 %2984, 7
  %2986 = add nsw i32 %2985, -16777214
  %2987 = getelementptr inbounds i32, ptr %3246, i32 %2986
  %2988 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %2989

2989:                                             ; preds = %2983, %2981
  %2990 = phi i32 [ %2977, %2981 ], [ %2988, %2983 ]
  %2991 = phi ptr [ %2982, %2981 ], [ %2987, %2983 ]
  %2992 = icmp eq i32 %2990, 0
  br i1 %2992, label %2997, label %2993, !prof !27

2993:                                             ; preds = %2989
  %2994 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %2991) #12
  %2995 = load ptr, ptr %29, align 4, !tbaa !6
  %2996 = getelementptr inbounds i8, ptr %2995, i32 16
  br label %2997

2997:                                             ; preds = %2993, %2989
  %2998 = phi i32 [ %2994, %2993 ], [ 0, %2989 ]
  %2999 = phi ptr [ %2996, %2993 ], [ %3247, %2989 ]
  %3000 = getelementptr inbounds i8, ptr %2991, i32 4
  br label %72

3001:                                             ; preds = %3243
  %3002 = lshr i32 %3248, 7
  %3003 = and i32 %3002, 255
  %3004 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3003, i32 0, i32 1
  %3005 = load i8, ptr %3004, align 8, !tbaa !6
  %3006 = icmp eq i8 %3005, 1
  %3007 = and i8 %3005, 15
  %3008 = icmp eq i8 %3007, 0
  %3009 = or i1 %3006, %3008
  %3010 = and i32 %3248, 32768
  %3011 = icmp ne i32 %3010, 0
  %3012 = xor i1 %3011, %3009
  br i1 %3012, label %3015, label %3013

3013:                                             ; preds = %3001
  %3014 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %3021

3015:                                             ; preds = %3001
  %3016 = load i32, ptr %3246, align 4, !tbaa !30
  %3017 = lshr i32 %3016, 7
  %3018 = add nsw i32 %3017, -16777214
  %3019 = getelementptr inbounds i32, ptr %3246, i32 %3018
  %3020 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %3021

3021:                                             ; preds = %3015, %3013
  %3022 = phi i32 [ %3245, %3013 ], [ %3020, %3015 ]
  %3023 = phi ptr [ %3014, %3013 ], [ %3019, %3015 ]
  %3024 = icmp eq i32 %3022, 0
  br i1 %3024, label %3029, label %3025, !prof !27

3025:                                             ; preds = %3021
  %3026 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3023) #12
  %3027 = load ptr, ptr %29, align 4, !tbaa !6
  %3028 = getelementptr inbounds i8, ptr %3027, i32 16
  br label %3029

3029:                                             ; preds = %3025, %3021
  %3030 = phi i32 [ %3026, %3025 ], [ 0, %3021 ]
  %3031 = phi ptr [ %3028, %3025 ], [ %3247, %3021 ]
  %3032 = getelementptr inbounds i8, ptr %3023, i32 4
  br label %72

3033:                                             ; preds = %3243
  %3034 = lshr i32 %3248, 16
  %3035 = and i32 %3034, 255
  %3036 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3035
  %3037 = getelementptr inbounds i8, ptr %3036, i32 8
  %3038 = load i8, ptr %3037, align 8, !tbaa !2
  %3039 = icmp eq i8 %3038, 1
  %3040 = and i8 %3038, 15
  %3041 = icmp eq i8 %3040, 0
  %3042 = or i1 %3039, %3041
  %3043 = and i32 %3248, 32768
  %3044 = icmp eq i32 %3043, 0
  %3045 = xor i1 %3044, %3042
  br i1 %3045, label %3046, label %3048

3046:                                             ; preds = %3033
  %3047 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %3059

3048:                                             ; preds = %3033
  %3049 = lshr i32 %3248, 7
  %3050 = and i32 %3049, 255
  %3051 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3050
  %3052 = load i64, ptr %3036, align 8, !tbaa !6
  store i64 %3052, ptr %3051, align 8, !tbaa !6
  %3053 = getelementptr inbounds i8, ptr %3051, i32 8
  store i8 %3038, ptr %3053, align 8, !tbaa !2
  %3054 = load i32, ptr %3246, align 4, !tbaa !30
  %3055 = lshr i32 %3054, 7
  %3056 = add nsw i32 %3055, -16777214
  %3057 = getelementptr inbounds i32, ptr %3246, i32 %3056
  %3058 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %3059

3059:                                             ; preds = %3048, %3046
  %3060 = phi i32 [ %3245, %3046 ], [ %3058, %3048 ]
  %3061 = phi ptr [ %3047, %3046 ], [ %3057, %3048 ]
  %3062 = icmp eq i32 %3060, 0
  br i1 %3062, label %3067, label %3063, !prof !27

3063:                                             ; preds = %3059
  %3064 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3061) #12
  %3065 = load ptr, ptr %29, align 4, !tbaa !6
  %3066 = getelementptr inbounds i8, ptr %3065, i32 16
  br label %3067

3067:                                             ; preds = %3063, %3059
  %3068 = phi i32 [ %3064, %3063 ], [ 0, %3059 ]
  %3069 = phi ptr [ %3066, %3063 ], [ %3247, %3059 ]
  %3070 = getelementptr inbounds i8, ptr %3061, i32 4
  br label %72

3071:                                             ; preds = %3243
  %3072 = lshr i32 %3248, 7
  %3073 = and i32 %3072, 255
  %3074 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3073
  %3075 = lshr i32 %3248, 16
  %3076 = and i32 %3075, 255
  %3077 = lshr i32 %3248, 24
  %3078 = add nsw i32 %3077, -1
  %3079 = icmp eq i32 %3076, 0
  br i1 %3079, label %3082, label %3080

3080:                                             ; preds = %3071
  %3081 = getelementptr inbounds %union.StackValue, ptr %3074, i32 %3076
  store ptr %3081, ptr %12, align 4, !tbaa !6
  br label %3082

3082:                                             ; preds = %3080, %3071
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %3083 = call ptr @luaD_precall(ptr noundef %0, ptr noundef %3074, i32 noundef %3078) #12
  %3084 = icmp eq ptr %3083, null
  br i1 %3084, label %3085, label %22

3085:                                             ; preds = %3082
  %3086 = load volatile i32, ptr %49, align 4, !tbaa !6
  %3087 = icmp eq i32 %3086, 0
  br i1 %3087, label %3092, label %3088, !prof !27

3088:                                             ; preds = %3085
  %3089 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %3090 = load ptr, ptr %29, align 4, !tbaa !6
  %3091 = getelementptr inbounds i8, ptr %3090, i32 16
  br label %3092

3092:                                             ; preds = %3088, %3085
  %3093 = phi i32 [ %3089, %3088 ], [ 0, %3085 ]
  %3094 = phi ptr [ %3091, %3088 ], [ %3247, %3085 ]
  %3095 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

3096:                                             ; preds = %3243
  %3097 = lshr i32 %3248, 7
  %3098 = and i32 %3097, 255
  %3099 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3098
  %3100 = lshr i32 %3248, 16
  %3101 = and i32 %3100, 255
  %3102 = icmp ult i32 %3248, 16777216
  br i1 %3102, label %3108, label %3103

3103:                                             ; preds = %3096
  %3104 = lshr i32 %3248, 24
  %3105 = getelementptr inbounds i8, ptr %29, i32 24
  %3106 = load i32, ptr %3105, align 4, !tbaa !6
  %3107 = add nsw i32 %3106, %3104
  br label %3108

3108:                                             ; preds = %3096, %3103
  %3109 = phi i32 [ %3107, %3103 ], [ 0, %3096 ]
  %3110 = icmp eq i32 %3101, 0
  br i1 %3110, label %3113, label %3111

3111:                                             ; preds = %3108
  %3112 = getelementptr inbounds %union.StackValue, ptr %3099, i32 %3101
  store ptr %3112, ptr %12, align 4, !tbaa !6
  br label %3119

3113:                                             ; preds = %3108
  %3114 = load ptr, ptr %12, align 4, !tbaa !6
  %3115 = ptrtoint ptr %3114 to i32
  %3116 = ptrtoint ptr %3099 to i32
  %3117 = sub i32 %3115, %3116
  %3118 = ashr exact i32 %3117, 4
  br label %3119

3119:                                             ; preds = %3113, %3111
  %3120 = phi i32 [ %3101, %3111 ], [ %3118, %3113 ]
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %3121 = and i32 %3248, 32768
  %3122 = icmp eq i32 %3121, 0
  br i1 %3122, label %3124, label %3123

3123:                                             ; preds = %3119
  call void @luaF_closeupval(ptr noundef nonnull %0, ptr noundef %3247) #12
  br label %3124

3124:                                             ; preds = %3123, %3119
  %3125 = call i32 @luaD_pretailcall(ptr noundef nonnull %0, ptr noundef nonnull %29, ptr noundef %3099, i32 noundef %3120, i32 noundef %3109) #12
  %3126 = icmp slt i32 %3125, 0
  br i1 %3126, label %22, label %3127

3127:                                             ; preds = %3124
  %3128 = load ptr, ptr %29, align 4, !tbaa !6
  %3129 = sub nsw i32 0, %3109
  %3130 = getelementptr inbounds %union.StackValue, ptr %3128, i32 %3129
  store ptr %3130, ptr %29, align 4, !tbaa !6
  call void @luaD_poscall(ptr noundef nonnull %0, ptr noundef nonnull %29, i32 noundef %3125) #12
  %3131 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %3236

3132:                                             ; preds = %3243
  %3133 = lshr i32 %3248, 7
  %3134 = and i32 %3133, 255
  %3135 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3134
  %3136 = lshr i32 %3248, 16
  %3137 = and i32 %3136, 255
  %3138 = add nsw i32 %3137, -1
  %3139 = lshr i32 %3248, 24
  %3140 = icmp eq i32 %3137, 0
  br i1 %3140, label %3141, label %3147

3141:                                             ; preds = %3132
  %3142 = load ptr, ptr %12, align 4, !tbaa !6
  %3143 = ptrtoint ptr %3142 to i32
  %3144 = ptrtoint ptr %3135 to i32
  %3145 = sub i32 %3143, %3144
  %3146 = ashr exact i32 %3145, 4
  br label %3147

3147:                                             ; preds = %3141, %3132
  %3148 = phi i32 [ %3146, %3141 ], [ %3138, %3132 ]
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %3149 = and i32 %3248, 32768
  %3150 = icmp eq i32 %3149, 0
  br i1 %3150, label %3165, label %3151

3151:                                             ; preds = %3147
  %3152 = getelementptr inbounds i8, ptr %29, i32 28
  store i32 %3148, ptr %3152, align 4, !tbaa !6
  %3153 = load ptr, ptr %12, align 4, !tbaa !6
  %3154 = load ptr, ptr %50, align 4, !tbaa !6
  %3155 = icmp ult ptr %3153, %3154
  br i1 %3155, label %3156, label %3157

3156:                                             ; preds = %3151
  store ptr %3154, ptr %12, align 4, !tbaa !6
  br label %3157

3157:                                             ; preds = %3156, %3151
  %3158 = call ptr @luaF_close(ptr noundef nonnull %0, ptr noundef %3247, i32 noundef -1, i32 noundef 1) #12
  %3159 = load volatile i32, ptr %49, align 4, !tbaa !6
  %3160 = icmp eq i32 %3159, 0
  br i1 %3160, label %3165, label %3161, !prof !27

3161:                                             ; preds = %3157
  %3162 = load ptr, ptr %29, align 4, !tbaa !6
  %3163 = getelementptr inbounds i8, ptr %3162, i32 16
  %3164 = getelementptr inbounds %union.StackValue, ptr %3163, i32 %3134
  br label %3165

3165:                                             ; preds = %3157, %3161, %3147
  %3166 = phi ptr [ %3164, %3161 ], [ %3135, %3157 ], [ %3135, %3147 ]
  %3167 = icmp ult i32 %3248, 16777216
  br i1 %3167, label %3175, label %3168

3168:                                             ; preds = %3165
  %3169 = getelementptr inbounds i8, ptr %29, i32 24
  %3170 = load i32, ptr %3169, align 4, !tbaa !6
  %3171 = add nsw i32 %3139, %3170
  %3172 = load ptr, ptr %29, align 4, !tbaa !6
  %3173 = sub nsw i32 0, %3171
  %3174 = getelementptr inbounds %union.StackValue, ptr %3172, i32 %3173
  store ptr %3174, ptr %29, align 4, !tbaa !6
  br label %3175

3175:                                             ; preds = %3168, %3165
  %3176 = getelementptr inbounds %union.StackValue, ptr %3166, i32 %3148
  store ptr %3176, ptr %12, align 4, !tbaa !6
  call void @luaD_poscall(ptr noundef %0, ptr noundef nonnull %29, i32 noundef %3148) #12
  %3177 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %3236

3178:                                             ; preds = %3243
  %3179 = load volatile i32, ptr %10, align 4, !tbaa !31
  %3180 = icmp eq i32 %3179, 0
  br i1 %3180, label %3185, label %3181, !prof !27

3181:                                             ; preds = %3178
  %3182 = lshr i32 %3248, 7
  %3183 = and i32 %3182, 255
  %3184 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3183
  store ptr %3184, ptr %12, align 4, !tbaa !6
  store ptr %3246, ptr %36, align 4, !tbaa !6
  call void @luaD_poscall(ptr noundef nonnull %0, ptr noundef nonnull %29, i32 noundef 0) #12
  br label %3236

3185:                                             ; preds = %3178
  %3186 = getelementptr inbounds i8, ptr %29, i32 8
  %3187 = load ptr, ptr %3186, align 4, !tbaa !43
  store ptr %3187, ptr %21, align 4, !tbaa !29
  %3188 = getelementptr inbounds i8, ptr %3247, i32 -16
  store ptr %3188, ptr %12, align 4, !tbaa !6
  %3189 = getelementptr inbounds i8, ptr %29, i32 32
  %3190 = load i16, ptr %3189, align 4, !tbaa !44
  %3191 = icmp sgt i16 %3190, 0
  br i1 %3191, label %3192, label %3236, !prof !45

3192:                                             ; preds = %3185
  %3193 = zext nneg i16 %3190 to i32
  br label %3194

3194:                                             ; preds = %3192, %3194
  %3195 = phi i32 [ %3199, %3194 ], [ %3193, %3192 ]
  %3196 = load ptr, ptr %12, align 4, !tbaa !6
  %3197 = getelementptr inbounds i8, ptr %3196, i32 16
  store ptr %3197, ptr %12, align 4, !tbaa !6
  %3198 = getelementptr inbounds i8, ptr %3196, i32 8
  store i8 0, ptr %3198, align 8, !tbaa !6
  %3199 = add nsw i32 %3195, -1
  %3200 = icmp ugt i32 %3195, 1
  br i1 %3200, label %3194, label %3236, !prof !46

3201:                                             ; preds = %3243
  %3202 = load volatile i32, ptr %10, align 4, !tbaa !31
  %3203 = icmp eq i32 %3202, 0
  br i1 %3203, label %3209, label %3204, !prof !27

3204:                                             ; preds = %3201
  %3205 = lshr i32 %3248, 7
  %3206 = and i32 %3205, 255
  %3207 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3206
  %3208 = getelementptr inbounds i8, ptr %3207, i32 16
  store ptr %3208, ptr %12, align 4, !tbaa !6
  store ptr %3246, ptr %36, align 4, !tbaa !6
  call void @luaD_poscall(ptr noundef nonnull %0, ptr noundef nonnull %29, i32 noundef 1) #12
  br label %3236

3209:                                             ; preds = %3201
  %3210 = getelementptr inbounds i8, ptr %29, i32 32
  %3211 = load i16, ptr %3210, align 4, !tbaa !44
  %3212 = getelementptr inbounds i8, ptr %29, i32 8
  %3213 = load ptr, ptr %3212, align 4, !tbaa !43
  store ptr %3213, ptr %21, align 4, !tbaa !29
  %3214 = icmp eq i16 %3211, 0
  br i1 %3214, label %3215, label %3217

3215:                                             ; preds = %3209
  %3216 = getelementptr inbounds i8, ptr %3247, i32 -16
  store ptr %3216, ptr %12, align 4, !tbaa !6
  br label %3236

3217:                                             ; preds = %3209
  %3218 = lshr i32 %3248, 7
  %3219 = and i32 %3218, 255
  %3220 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3219
  %3221 = getelementptr inbounds i8, ptr %3247, i32 -16
  %3222 = load i64, ptr %3220, align 8, !tbaa !6
  store i64 %3222, ptr %3221, align 8, !tbaa !6
  %3223 = getelementptr inbounds i8, ptr %3220, i32 8
  %3224 = load i8, ptr %3223, align 8, !tbaa !2
  %3225 = getelementptr inbounds i8, ptr %3247, i32 -8
  store i8 %3224, ptr %3225, align 8, !tbaa !2
  store ptr %3247, ptr %12, align 4, !tbaa !6
  %3226 = icmp sgt i16 %3211, 1
  br i1 %3226, label %3227, label %3236, !prof !45

3227:                                             ; preds = %3217
  %3228 = zext nneg i16 %3211 to i32
  br label %3229

3229:                                             ; preds = %3227, %3229
  %3230 = phi i32 [ %3234, %3229 ], [ %3228, %3227 ]
  %3231 = load ptr, ptr %12, align 4, !tbaa !6
  %3232 = getelementptr inbounds i8, ptr %3231, i32 16
  store ptr %3232, ptr %12, align 4, !tbaa !6
  %3233 = getelementptr inbounds i8, ptr %3231, i32 8
  store i8 0, ptr %3233, align 8, !tbaa !6
  %3234 = add nsw i32 %3230, -1
  %3235 = icmp ugt i32 %3230, 2
  br i1 %3235, label %3229, label %3236, !prof !46

3236:                                             ; preds = %3229, %3194, %3217, %3185, %3204, %3215, %3181, %3175, %3127
  %3237 = phi i32 [ 1, %3204 ], [ %3245, %3215 ], [ 1, %3181 ], [ %3177, %3175 ], [ %3131, %3127 ], [ %3245, %3185 ], [ %3245, %3217 ], [ %3245, %3194 ], [ %3245, %3229 ]
  %3238 = getelementptr inbounds i8, ptr %29, i32 34
  %3239 = load i16, ptr %3238, align 2, !tbaa !47
  %3240 = and i16 %3239, 4
  %3241 = icmp eq i16 %3240, 0
  br i1 %3241, label %3252, label %3242

3242:                                             ; preds = %3236
  ret void

3243:                                             ; preds = %72, %44
  %3244 = phi ptr [ %37, %44 ], [ %73, %72 ]
  %3245 = phi i32 [ %45, %44 ], [ %74, %72 ]
  %3246 = phi ptr [ %48, %44 ], [ %75, %72 ]
  %3247 = phi ptr [ %47, %44 ], [ %76, %72 ]
  %3248 = load i32, ptr %3244, align 4, !tbaa !30
  %3249 = and i32 %3248, 127
  %3250 = getelementptr inbounds [83 x ptr], ptr @luaV_execute.disptab, i32 0, i32 %3249
  %3251 = load ptr, ptr %3250, align 4, !tbaa !23
  indirectbr ptr %3251, [label %52, label %77, label %94, label %111, label %130, label %151, label %164, label %178, label %191, label %214, label %237, label %275, label %317, label %386, label %437, label %476, label %537, label %625, label %695, label %753, label %798, label %845, label %880, label %933, label %986, label %1039, label %1117, label %1161, label %1202, label %1277, label %1317, label %1357, label %1397, label %1448, label %1499, label %1552, label %1605, label %1658, label %1736, label %1780, label %1821, label %1896, label %1951, label %2006, label %2127, label %2061, label %2193, label %2217, label %2244, label %2270, label %2301, label %2340, label %2362, label %2380, label %2405, label %2421, label %2435, label %2449, label %2482, label %2603, label %2725, label %2756, label %2801, label %2851, label %2901, label %2951, label %3001, label %3033, label %3071, label %3096, label %3132, label %3178, label %3201, label %3255, label %3304, label %3582, label %3592, label %3610, label %3641, label %3719, label %3790, label %3807, label %3820]

3252:                                             ; preds = %3236
  %3253 = getelementptr inbounds i8, ptr %29, i32 8
  %3254 = load ptr, ptr %3253, align 4, !tbaa !43
  br label %27

3255:                                             ; preds = %3243
  %3256 = lshr i32 %3248, 7
  %3257 = and i32 %3256, 255
  %3258 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3257
  %3259 = getelementptr inbounds i8, ptr %3258, i32 32
  %3260 = getelementptr inbounds i8, ptr %3258, i32 40
  %3261 = load i8, ptr %3260, align 8, !tbaa !6
  %3262 = icmp eq i8 %3261, 3
  br i1 %3262, label %3263, label %3273

3263:                                             ; preds = %3255
  %3264 = getelementptr inbounds i8, ptr %3258, i32 16
  %3265 = load i64, ptr %3264, align 8, !tbaa !6
  %3266 = icmp eq i64 %3265, 0
  br i1 %3266, label %3292, label %3267

3267:                                             ; preds = %3263
  %3268 = load i64, ptr %3259, align 8, !tbaa !6
  %3269 = load i64, ptr %3258, align 8, !tbaa !6
  %3270 = add i64 %3265, -1
  store i64 %3270, ptr %3264, align 8, !tbaa !6
  %3271 = add i64 %3269, %3268
  store i64 %3271, ptr %3258, align 8, !tbaa !6
  %3272 = getelementptr inbounds i8, ptr %3258, i32 48
  store i64 %3271, ptr %3272, align 8, !tbaa !6
  br label %3286

3273:                                             ; preds = %3255
  %3274 = load double, ptr %3259, align 8, !tbaa !6
  %3275 = getelementptr inbounds i8, ptr %3258, i32 16
  %3276 = load double, ptr %3275, align 8, !tbaa !6
  %3277 = load double, ptr %3258, align 8, !tbaa !6
  %3278 = fadd double %3274, %3277
  %3279 = fcmp ogt double %3274, 0.000000e+00
  br i1 %3279, label %3280, label %3282

3280:                                             ; preds = %3273
  %3281 = fcmp ugt double %3278, %3276
  br i1 %3281, label %3292, label %3284

3282:                                             ; preds = %3273
  %3283 = fcmp ugt double %3276, %3278
  br i1 %3283, label %3292, label %3284

3284:                                             ; preds = %3282, %3280
  store double %3278, ptr %3258, align 8, !tbaa !6
  %3285 = getelementptr inbounds i8, ptr %3258, i32 48
  store double %3278, ptr %3285, align 8, !tbaa !6
  br label %3286

3286:                                             ; preds = %3267, %3284
  %3287 = phi i8 [ 19, %3284 ], [ 3, %3267 ]
  %3288 = getelementptr inbounds i8, ptr %3258, i32 56
  store i8 %3287, ptr %3288, align 8, !tbaa !2
  %3289 = lshr i32 %3248, 15
  %3290 = sub nsw i32 0, %3289
  %3291 = getelementptr inbounds i32, ptr %3246, i32 %3290
  br label %3292

3292:                                             ; preds = %3286, %3280, %3282, %3263
  %3293 = phi ptr [ %3246, %3263 ], [ %3246, %3282 ], [ %3246, %3280 ], [ %3291, %3286 ]
  %3294 = load volatile i32, ptr %49, align 4, !tbaa !6
  %3295 = icmp eq i32 %3294, 0
  br i1 %3295, label %3300, label %3296, !prof !27

3296:                                             ; preds = %3292
  %3297 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3293) #12
  %3298 = load ptr, ptr %29, align 4, !tbaa !6
  %3299 = getelementptr inbounds i8, ptr %3298, i32 16
  br label %3300

3300:                                             ; preds = %3296, %3292
  %3301 = phi i32 [ %3297, %3296 ], [ 0, %3292 ]
  %3302 = phi ptr [ %3299, %3296 ], [ %3247, %3292 ]
  %3303 = getelementptr inbounds i8, ptr %3293, i32 4
  br label %72

3304:                                             ; preds = %3243
  %3305 = lshr i32 %3248, 7
  %3306 = and i32 %3305, 255
  %3307 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3306
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %3308 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %3308, ptr %12, align 4, !tbaa !6
  %3309 = getelementptr inbounds i8, ptr %3307, i32 16
  %3310 = getelementptr inbounds i8, ptr %3307, i32 32
  %3311 = getelementptr inbounds i8, ptr %3307, i32 8
  %3312 = load i8, ptr %3311, align 8, !tbaa !2
  %3313 = icmp eq i8 %3312, 3
  br i1 %3313, label %3314, label %3433

3314:                                             ; preds = %3304
  %3315 = getelementptr inbounds i8, ptr %3307, i32 40
  %3316 = load i8, ptr %3315, align 8, !tbaa !2
  %3317 = icmp eq i8 %3316, 3
  br i1 %3317, label %3318, label %3433

3318:                                             ; preds = %3314
  %3319 = load i64, ptr %3307, align 8, !tbaa !6
  %3320 = load i64, ptr %3310, align 8, !tbaa !6
  %3321 = icmp eq i64 %3320, 0
  br i1 %3321, label %3322, label %3323

3322:                                             ; preds = %3318
  call void (ptr, ptr, ...) @luaG_runerror(ptr noundef nonnull %0, ptr noundef nonnull @.str.7) #13
  unreachable

3323:                                             ; preds = %3318
  %3324 = getelementptr inbounds i8, ptr %3307, i32 48
  store i64 %3319, ptr %3324, align 8, !tbaa !6
  %3325 = getelementptr inbounds i8, ptr %3307, i32 56
  store i8 3, ptr %3325, align 8, !tbaa !2
  %3326 = icmp slt i64 %3320, 0
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %7) #12
  %3327 = getelementptr inbounds i8, ptr %3307, i32 24
  %3328 = load i8, ptr %3327, align 8, !tbaa !2
  %3329 = and i8 %3328, 15
  %3330 = icmp eq i8 %3329, 4
  br i1 %3330, label %3331, label %3351

3331:                                             ; preds = %3323
  %3332 = load ptr, ptr %3309, align 8, !tbaa !6
  %3333 = getelementptr inbounds i8, ptr %3332, i32 16
  %3334 = call i32 @luaO_str2num(ptr noundef nonnull %3333, ptr noundef nonnull %7) #12
  %3335 = getelementptr inbounds i8, ptr %3332, i32 7
  %3336 = load i8, ptr %3335, align 1, !tbaa !7
  %3337 = icmp eq i8 %3336, -1
  br i1 %3337, label %3340, label %3338

3338:                                             ; preds = %3331
  %3339 = zext i8 %3336 to i32
  br label %3343

3340:                                             ; preds = %3331
  %3341 = getelementptr inbounds i8, ptr %3332, i32 12
  %3342 = load i32, ptr %3341, align 4, !tbaa !6
  br label %3343

3343:                                             ; preds = %3340, %3338
  %3344 = phi i32 [ %3339, %3338 ], [ %3342, %3340 ]
  %3345 = add i32 %3344, 1
  %3346 = icmp ne i32 %3334, %3345
  %3347 = freeze i1 %3346
  %3348 = select i1 %3347, ptr %3309, ptr %7
  %3349 = select i1 %3347, ptr %3327, ptr %17
  %3350 = load i8, ptr %3349, align 8, !tbaa !2
  br label %3351

3351:                                             ; preds = %3343, %3323
  %3352 = phi i8 [ %3350, %3343 ], [ %3328, %3323 ]
  %3353 = phi ptr [ %3348, %3343 ], [ %3309, %3323 ]
  switch i8 %3352, label %3367 [
    i8 19, label %3354
    i8 3, label %3365
  ]

3354:                                             ; preds = %3351
  %3355 = load double, ptr %3353, align 8, !tbaa !6
  %3356 = call double @llvm.floor.f64(double %3355)
  %3357 = fcmp une double %3356, %3355
  %3358 = and i1 %3326, %3357
  %3359 = fadd double %3356, 1.000000e+00
  %3360 = select i1 %3358, double %3359, double %3356
  %3361 = fcmp oge double %3360, 0xC3E0000000000000
  %3362 = fcmp olt double %3360, 0x43E0000000000000
  %3363 = and i1 %3361, %3362
  br i1 %3363, label %3368, label %3364

3364:                                             ; preds = %3354
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %7) #12
  br label %3370

3365:                                             ; preds = %3351
  %3366 = load i64, ptr %3353, align 8, !tbaa !6
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %7) #12
  br label %3415

3367:                                             ; preds = %3351
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %7) #12
  br label %3370

3368:                                             ; preds = %3354
  %3369 = fptosi double %3360 to i64
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %7) #12
  br label %3415

3370:                                             ; preds = %3367, %3364
  %3371 = load i8, ptr %3327, align 8, !tbaa !2
  %3372 = icmp eq i8 %3371, 19
  br i1 %3372, label %3373, label %3375

3373:                                             ; preds = %3370
  %3374 = load double, ptr %3309, align 8, !tbaa !6
  br label %3409

3375:                                             ; preds = %3370
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %6) #12
  %3376 = icmp eq i8 %3371, 3
  br i1 %3376, label %3377, label %3380

3377:                                             ; preds = %3375
  %3378 = load i64, ptr %3309, align 8, !tbaa !6
  %3379 = sitofp i64 %3378 to double
  br label %3406

3380:                                             ; preds = %3375
  %3381 = and i8 %3371, 15
  %3382 = icmp eq i8 %3381, 4
  br i1 %3382, label %3383, label %3408

3383:                                             ; preds = %3380
  %3384 = load ptr, ptr %3309, align 8, !tbaa !6
  %3385 = getelementptr inbounds i8, ptr %3384, i32 16
  %3386 = call i32 @luaO_str2num(ptr noundef nonnull %3385, ptr noundef nonnull %6) #12
  %3387 = getelementptr inbounds i8, ptr %3384, i32 7
  %3388 = load i8, ptr %3387, align 1, !tbaa !7
  %3389 = icmp eq i8 %3388, -1
  br i1 %3389, label %3392, label %3390

3390:                                             ; preds = %3383
  %3391 = zext i8 %3388 to i32
  br label %3395

3392:                                             ; preds = %3383
  %3393 = getelementptr inbounds i8, ptr %3384, i32 12
  %3394 = load i32, ptr %3393, align 4, !tbaa !6
  br label %3395

3395:                                             ; preds = %3392, %3390
  %3396 = phi i32 [ %3391, %3390 ], [ %3394, %3392 ]
  %3397 = add i32 %3396, 1
  %3398 = icmp eq i32 %3386, %3397
  br i1 %3398, label %3399, label %3408

3399:                                             ; preds = %3395
  %3400 = load i8, ptr %18, align 8, !tbaa !2
  %3401 = icmp eq i8 %3400, 3
  %3402 = load i64, ptr %6, align 8
  %3403 = sitofp i64 %3402 to double
  %3404 = bitcast i64 %3402 to double
  %3405 = select i1 %3401, double %3403, double %3404
  br label %3406

3406:                                             ; preds = %3399, %3377
  %3407 = phi double [ %3405, %3399 ], [ %3379, %3377 ]
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %6) #12
  br label %3409

3408:                                             ; preds = %3395, %3380
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %6) #12
  call void @luaG_forerror(ptr noundef nonnull %0, ptr noundef nonnull %3309, ptr noundef nonnull @.str.8) #13
  unreachable

3409:                                             ; preds = %3406, %3373
  %3410 = phi double [ %3374, %3373 ], [ %3407, %3406 ]
  %3411 = fcmp ogt double %3410, 0.000000e+00
  br i1 %3411, label %3412, label %3413

3412:                                             ; preds = %3409
  br i1 %3326, label %3567, label %3415

3413:                                             ; preds = %3409
  %3414 = icmp sgt i64 %3320, 0
  br i1 %3414, label %3567, label %3415

3415:                                             ; preds = %3413, %3412, %3368, %3365
  %3416 = phi i64 [ %3366, %3365 ], [ %3369, %3368 ], [ 9223372036854775807, %3412 ], [ -9223372036854775808, %3413 ]
  %3417 = icmp sgt i64 %3320, 0
  %3418 = icmp sge i64 %3416, %3319
  %3419 = icmp sle i64 %3416, %3319
  %3420 = select i1 %3417, i1 %3418, i1 %3419
  br i1 %3420, label %3421, label %3567

3421:                                             ; preds = %3415
  br i1 %3417, label %3422, label %3427

3422:                                             ; preds = %3421
  %3423 = sub i64 %3416, %3319
  %3424 = icmp eq i64 %3320, 1
  br i1 %3424, label %3431, label %3425

3425:                                             ; preds = %3422
  %3426 = udiv i64 %3423, %3320
  br label %3431

3427:                                             ; preds = %3421
  %3428 = sub i64 %3319, %3416
  %3429 = sub i64 0, %3320
  %3430 = udiv i64 %3428, %3429
  br label %3431

3431:                                             ; preds = %3427, %3425, %3422
  %3432 = phi i64 [ %3426, %3425 ], [ %3423, %3422 ], [ %3430, %3427 ]
  store i64 %3432, ptr %3309, align 8, !tbaa !6
  store i8 3, ptr %3327, align 8, !tbaa !2
  br label %3571

3433:                                             ; preds = %3314, %3304
  %3434 = getelementptr inbounds i8, ptr %3307, i32 24
  %3435 = load i8, ptr %3434, align 8, !tbaa !2
  %3436 = icmp eq i8 %3435, 19
  br i1 %3436, label %3437, label %3439

3437:                                             ; preds = %3433
  %3438 = load double, ptr %3309, align 8, !tbaa !6
  br label %3473

3439:                                             ; preds = %3433
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %5) #12
  %3440 = icmp eq i8 %3435, 3
  br i1 %3440, label %3441, label %3444

3441:                                             ; preds = %3439
  %3442 = load i64, ptr %3309, align 8, !tbaa !6
  %3443 = sitofp i64 %3442 to double
  br label %3470

3444:                                             ; preds = %3439
  %3445 = and i8 %3435, 15
  %3446 = icmp eq i8 %3445, 4
  br i1 %3446, label %3447, label %3472

3447:                                             ; preds = %3444
  %3448 = load ptr, ptr %3309, align 8, !tbaa !6
  %3449 = getelementptr inbounds i8, ptr %3448, i32 16
  %3450 = call i32 @luaO_str2num(ptr noundef nonnull %3449, ptr noundef nonnull %5) #12
  %3451 = getelementptr inbounds i8, ptr %3448, i32 7
  %3452 = load i8, ptr %3451, align 1, !tbaa !7
  %3453 = icmp eq i8 %3452, -1
  br i1 %3453, label %3456, label %3454

3454:                                             ; preds = %3447
  %3455 = zext i8 %3452 to i32
  br label %3459

3456:                                             ; preds = %3447
  %3457 = getelementptr inbounds i8, ptr %3448, i32 12
  %3458 = load i32, ptr %3457, align 4, !tbaa !6
  br label %3459

3459:                                             ; preds = %3456, %3454
  %3460 = phi i32 [ %3455, %3454 ], [ %3458, %3456 ]
  %3461 = add i32 %3460, 1
  %3462 = icmp eq i32 %3450, %3461
  br i1 %3462, label %3463, label %3472

3463:                                             ; preds = %3459
  %3464 = load i8, ptr %14, align 8, !tbaa !2
  %3465 = icmp eq i8 %3464, 3
  %3466 = load i64, ptr %5, align 8
  %3467 = sitofp i64 %3466 to double
  %3468 = bitcast i64 %3466 to double
  %3469 = select i1 %3465, double %3467, double %3468
  br label %3470

3470:                                             ; preds = %3463, %3441
  %3471 = phi double [ %3469, %3463 ], [ %3443, %3441 ]
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %5) #12
  br label %3473

3472:                                             ; preds = %3459, %3444
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %5) #12
  call void @luaG_forerror(ptr noundef nonnull %0, ptr noundef nonnull %3309, ptr noundef nonnull @.str.8) #13
  unreachable

3473:                                             ; preds = %3470, %3437
  %3474 = phi double [ %3438, %3437 ], [ %3471, %3470 ]
  %3475 = getelementptr inbounds i8, ptr %3307, i32 40
  %3476 = load i8, ptr %3475, align 8, !tbaa !2
  %3477 = icmp eq i8 %3476, 19
  br i1 %3477, label %3478, label %3480

3478:                                             ; preds = %3473
  %3479 = load double, ptr %3310, align 8, !tbaa !6
  br label %3514

3480:                                             ; preds = %3473
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4) #12
  %3481 = icmp eq i8 %3476, 3
  br i1 %3481, label %3482, label %3485

3482:                                             ; preds = %3480
  %3483 = load i64, ptr %3310, align 8, !tbaa !6
  %3484 = sitofp i64 %3483 to double
  br label %3511

3485:                                             ; preds = %3480
  %3486 = and i8 %3476, 15
  %3487 = icmp eq i8 %3486, 4
  br i1 %3487, label %3488, label %3513

3488:                                             ; preds = %3485
  %3489 = load ptr, ptr %3310, align 8, !tbaa !6
  %3490 = getelementptr inbounds i8, ptr %3489, i32 16
  %3491 = call i32 @luaO_str2num(ptr noundef nonnull %3490, ptr noundef nonnull %4) #12
  %3492 = getelementptr inbounds i8, ptr %3489, i32 7
  %3493 = load i8, ptr %3492, align 1, !tbaa !7
  %3494 = icmp eq i8 %3493, -1
  br i1 %3494, label %3497, label %3495

3495:                                             ; preds = %3488
  %3496 = zext i8 %3493 to i32
  br label %3500

3497:                                             ; preds = %3488
  %3498 = getelementptr inbounds i8, ptr %3489, i32 12
  %3499 = load i32, ptr %3498, align 4, !tbaa !6
  br label %3500

3500:                                             ; preds = %3497, %3495
  %3501 = phi i32 [ %3496, %3495 ], [ %3499, %3497 ]
  %3502 = add i32 %3501, 1
  %3503 = icmp eq i32 %3491, %3502
  br i1 %3503, label %3504, label %3513

3504:                                             ; preds = %3500
  %3505 = load i8, ptr %15, align 8, !tbaa !2
  %3506 = icmp eq i8 %3505, 3
  %3507 = load i64, ptr %4, align 8
  %3508 = sitofp i64 %3507 to double
  %3509 = bitcast i64 %3507 to double
  %3510 = select i1 %3506, double %3508, double %3509
  br label %3511

3511:                                             ; preds = %3504, %3482
  %3512 = phi double [ %3510, %3504 ], [ %3484, %3482 ]
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #12
  br label %3514

3513:                                             ; preds = %3500, %3485
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #12
  call void @luaG_forerror(ptr noundef nonnull %0, ptr noundef nonnull %3310, ptr noundef nonnull @.str.9) #13
  unreachable

3514:                                             ; preds = %3511, %3478
  %3515 = phi double [ %3479, %3478 ], [ %3512, %3511 ]
  %3516 = load i8, ptr %3311, align 8, !tbaa !2
  %3517 = icmp eq i8 %3516, 19
  br i1 %3517, label %3518, label %3520

3518:                                             ; preds = %3514
  %3519 = load double, ptr %3307, align 8, !tbaa !6
  br label %3554

3520:                                             ; preds = %3514
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #12
  %3521 = icmp eq i8 %3516, 3
  br i1 %3521, label %3522, label %3525

3522:                                             ; preds = %3520
  %3523 = load i64, ptr %3307, align 8, !tbaa !6
  %3524 = sitofp i64 %3523 to double
  br label %3551

3525:                                             ; preds = %3520
  %3526 = and i8 %3516, 15
  %3527 = icmp eq i8 %3526, 4
  br i1 %3527, label %3528, label %3553

3528:                                             ; preds = %3525
  %3529 = load ptr, ptr %3307, align 8, !tbaa !6
  %3530 = getelementptr inbounds i8, ptr %3529, i32 16
  %3531 = call i32 @luaO_str2num(ptr noundef nonnull %3530, ptr noundef nonnull %3) #12
  %3532 = getelementptr inbounds i8, ptr %3529, i32 7
  %3533 = load i8, ptr %3532, align 1, !tbaa !7
  %3534 = icmp eq i8 %3533, -1
  br i1 %3534, label %3537, label %3535

3535:                                             ; preds = %3528
  %3536 = zext i8 %3533 to i32
  br label %3540

3537:                                             ; preds = %3528
  %3538 = getelementptr inbounds i8, ptr %3529, i32 12
  %3539 = load i32, ptr %3538, align 4, !tbaa !6
  br label %3540

3540:                                             ; preds = %3537, %3535
  %3541 = phi i32 [ %3536, %3535 ], [ %3539, %3537 ]
  %3542 = add i32 %3541, 1
  %3543 = icmp eq i32 %3531, %3542
  br i1 %3543, label %3544, label %3553

3544:                                             ; preds = %3540
  %3545 = load i8, ptr %16, align 8, !tbaa !2
  %3546 = icmp eq i8 %3545, 3
  %3547 = load i64, ptr %3, align 8
  %3548 = sitofp i64 %3547 to double
  %3549 = bitcast i64 %3547 to double
  %3550 = select i1 %3546, double %3548, double %3549
  br label %3551

3551:                                             ; preds = %3544, %3522
  %3552 = phi double [ %3550, %3544 ], [ %3524, %3522 ]
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #12
  br label %3554

3553:                                             ; preds = %3540, %3525
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #12
  call void @luaG_forerror(ptr noundef nonnull %0, ptr noundef nonnull %3307, ptr noundef nonnull @.str.10) #13
  unreachable

3554:                                             ; preds = %3551, %3518
  %3555 = phi double [ %3519, %3518 ], [ %3552, %3551 ]
  %3556 = fcmp oeq double %3515, 0.000000e+00
  br i1 %3556, label %3557, label %3558

3557:                                             ; preds = %3554
  call void (ptr, ptr, ...) @luaG_runerror(ptr noundef nonnull %0, ptr noundef nonnull @.str.7) #13
  unreachable

3558:                                             ; preds = %3554
  %3559 = fcmp ogt double %3515, 0.000000e+00
  br i1 %3559, label %3560, label %3562

3560:                                             ; preds = %3558
  %3561 = fcmp olt double %3474, %3555
  br i1 %3561, label %3567, label %3564

3562:                                             ; preds = %3558
  %3563 = fcmp olt double %3555, %3474
  br i1 %3563, label %3567, label %3564

3564:                                             ; preds = %3562, %3560
  store double %3474, ptr %3309, align 8, !tbaa !6
  store i8 19, ptr %3434, align 8, !tbaa !2
  store double %3515, ptr %3310, align 8, !tbaa !6
  store i8 19, ptr %3475, align 8, !tbaa !2
  store double %3555, ptr %3307, align 8, !tbaa !6
  store i8 19, ptr %3311, align 8, !tbaa !2
  %3565 = getelementptr inbounds i8, ptr %3307, i32 48
  store double %3555, ptr %3565, align 8, !tbaa !6
  %3566 = getelementptr inbounds i8, ptr %3307, i32 56
  store i8 19, ptr %3566, align 8, !tbaa !2
  br label %3571

3567:                                             ; preds = %3560, %3562, %3415, %3412, %3413
  %3568 = lshr i32 %3248, 15
  %3569 = add nuw nsw i32 %3568, 1
  %3570 = getelementptr inbounds i32, ptr %3246, i32 %3569
  br label %3571

3571:                                             ; preds = %3431, %3564, %3567
  %3572 = phi ptr [ %3570, %3567 ], [ %3246, %3564 ], [ %3246, %3431 ]
  %3573 = icmp eq i32 %3245, 0
  br i1 %3573, label %3578, label %3574, !prof !27

3574:                                             ; preds = %3571
  %3575 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %3572) #12
  %3576 = load ptr, ptr %29, align 4, !tbaa !6
  %3577 = getelementptr inbounds i8, ptr %3576, i32 16
  br label %3578

3578:                                             ; preds = %3574, %3571
  %3579 = phi i32 [ %3575, %3574 ], [ 0, %3571 ]
  %3580 = phi ptr [ %3577, %3574 ], [ %3247, %3571 ]
  %3581 = getelementptr inbounds i8, ptr %3572, i32 4
  br label %72

3582:                                             ; preds = %3243
  %3583 = lshr i32 %3248, 7
  %3584 = and i32 %3583, 255
  %3585 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3584
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %3586 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %3586, ptr %12, align 4, !tbaa !6
  %3587 = getelementptr inbounds i8, ptr %3585, i32 48
  call void @luaF_newtbcupval(ptr noundef %0, ptr noundef nonnull %3587) #12
  %3588 = lshr i32 %3248, 15
  %3589 = getelementptr inbounds i32, ptr %3246, i32 %3588
  %3590 = getelementptr inbounds i8, ptr %3589, i32 4
  %3591 = load i32, ptr %3589, align 4, !tbaa !30
  br label %3592

3592:                                             ; preds = %3243, %3582
  %3593 = phi i32 [ %3248, %3243 ], [ %3591, %3582 ]
  %3594 = phi ptr [ %3246, %3243 ], [ %3590, %3582 ]
  %3595 = lshr i32 %3593, 7
  %3596 = and i32 %3595, 255
  %3597 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3596
  %3598 = getelementptr inbounds i8, ptr %3597, i32 64
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 8 dereferenceable(48) %3598, ptr noundef nonnull align 8 dereferenceable(48) %3597, i32 48, i1 false)
  %3599 = getelementptr inbounds i8, ptr %3597, i32 112
  store ptr %3599, ptr %12, align 4, !tbaa !6
  store ptr %3594, ptr %36, align 4, !tbaa !6
  %3600 = lshr i32 %3593, 24
  call void @luaD_call(ptr noundef %0, ptr noundef nonnull %3598, i32 noundef %3600) #12
  %3601 = load volatile i32, ptr %49, align 4, !tbaa !6
  %3602 = icmp eq i32 %3601, 0
  br i1 %3602, label %3606, label %3603, !prof !27

3603:                                             ; preds = %3592
  %3604 = load ptr, ptr %29, align 4, !tbaa !6
  %3605 = getelementptr inbounds i8, ptr %3604, i32 16
  br label %3606

3606:                                             ; preds = %3603, %3592
  %3607 = phi ptr [ %3605, %3603 ], [ %3247, %3592 ]
  %3608 = getelementptr inbounds i8, ptr %3594, i32 4
  %3609 = load i32, ptr %3594, align 4, !tbaa !30
  br label %3610

3610:                                             ; preds = %3243, %3606
  %3611 = phi i32 [ %3248, %3243 ], [ %3609, %3606 ]
  %3612 = phi i32 [ %3245, %3243 ], [ %3601, %3606 ]
  %3613 = phi ptr [ %3246, %3243 ], [ %3608, %3606 ]
  %3614 = phi ptr [ %3247, %3243 ], [ %3607, %3606 ]
  %3615 = lshr i32 %3611, 7
  %3616 = and i32 %3615, 255
  %3617 = getelementptr inbounds %union.StackValue, ptr %3614, i32 %3616
  %3618 = getelementptr inbounds i8, ptr %3617, i32 72
  %3619 = load i8, ptr %3618, align 8, !tbaa !6
  %3620 = and i8 %3619, 15
  %3621 = icmp eq i8 %3620, 0
  br i1 %3621, label %3630, label %3622

3622:                                             ; preds = %3610
  %3623 = getelementptr inbounds i8, ptr %3617, i32 64
  %3624 = getelementptr inbounds i8, ptr %3617, i32 32
  %3625 = load i64, ptr %3623, align 8, !tbaa !6
  store i64 %3625, ptr %3624, align 8, !tbaa !6
  %3626 = getelementptr inbounds i8, ptr %3617, i32 40
  store i8 %3619, ptr %3626, align 8, !tbaa !2
  %3627 = lshr i32 %3611, 15
  %3628 = sub nsw i32 0, %3627
  %3629 = getelementptr inbounds i32, ptr %3613, i32 %3628
  br label %3630

3630:                                             ; preds = %3622, %3610
  %3631 = phi ptr [ %3613, %3610 ], [ %3629, %3622 ]
  %3632 = icmp eq i32 %3612, 0
  br i1 %3632, label %3637, label %3633, !prof !27

3633:                                             ; preds = %3630
  %3634 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef %3631) #12
  %3635 = load ptr, ptr %29, align 4, !tbaa !6
  %3636 = getelementptr inbounds i8, ptr %3635, i32 16
  br label %3637

3637:                                             ; preds = %3633, %3630
  %3638 = phi i32 [ %3634, %3633 ], [ 0, %3630 ]
  %3639 = phi ptr [ %3636, %3633 ], [ %3614, %3630 ]
  %3640 = getelementptr inbounds i8, ptr %3631, i32 4
  br label %72

3641:                                             ; preds = %3243
  %3642 = lshr i32 %3248, 7
  %3643 = and i32 %3642, 255
  %3644 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3643
  %3645 = lshr i32 %3248, 16
  %3646 = and i32 %3645, 255
  %3647 = lshr i32 %3248, 24
  %3648 = load ptr, ptr %3644, align 8, !tbaa !6
  %3649 = icmp eq i32 %3646, 0
  br i1 %3649, label %3650, label %3657

3650:                                             ; preds = %3641
  %3651 = load ptr, ptr %12, align 4, !tbaa !6
  %3652 = ptrtoint ptr %3651 to i32
  %3653 = ptrtoint ptr %3644 to i32
  %3654 = sub i32 %3652, %3653
  %3655 = ashr exact i32 %3654, 4
  %3656 = add nsw i32 %3655, -1
  br label %3659

3657:                                             ; preds = %3641
  %3658 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %3658, ptr %12, align 4, !tbaa !6
  br label %3659

3659:                                             ; preds = %3657, %3650
  %3660 = phi i32 [ %3656, %3650 ], [ %3646, %3657 ]
  %3661 = add nsw i32 %3660, %3647
  %3662 = and i32 %3248, 32768
  %3663 = icmp eq i32 %3662, 0
  br i1 %3663, label %3670, label %3664

3664:                                             ; preds = %3659
  %3665 = load i32, ptr %3246, align 4, !tbaa !30
  %3666 = shl nuw nsw i32 %3665, 1
  %3667 = and i32 %3666, 2147483392
  %3668 = add i32 %3667, %3661
  %3669 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %3670

3670:                                             ; preds = %3664, %3659
  %3671 = phi i32 [ %3668, %3664 ], [ %3661, %3659 ]
  %3672 = phi ptr [ %3669, %3664 ], [ %3246, %3659 ]
  %3673 = call i32 @luaH_realasize(ptr noundef %3648) #12
  %3674 = icmp ugt i32 %3671, %3673
  br i1 %3674, label %3675, label %3676

3675:                                             ; preds = %3670
  call void @luaH_resizearray(ptr noundef nonnull %0, ptr noundef %3648, i32 noundef %3671) #12
  br label %3676

3676:                                             ; preds = %3675, %3670
  %3677 = icmp sgt i32 %3660, 0
  br i1 %3677, label %3678, label %3709

3678:                                             ; preds = %3676
  %3679 = getelementptr inbounds i8, ptr %3648, i32 12
  %3680 = getelementptr inbounds i8, ptr %3648, i32 5
  br label %3681

3681:                                             ; preds = %3678, %3706
  %3682 = phi i32 [ %3671, %3678 ], [ %3692, %3706 ]
  %3683 = phi i32 [ %3660, %3678 ], [ %3707, %3706 ]
  %3684 = getelementptr inbounds %union.StackValue, ptr %3644, i32 %3683
  %3685 = load ptr, ptr %3679, align 4, !tbaa !48
  %3686 = getelementptr %struct.TValue, ptr %3685, i32 %3682
  %3687 = getelementptr i8, ptr %3686, i32 -16
  %3688 = load i64, ptr %3684, align 8, !tbaa !6
  store i64 %3688, ptr %3687, align 8, !tbaa !6
  %3689 = getelementptr inbounds i8, ptr %3684, i32 8
  %3690 = load i8, ptr %3689, align 8, !tbaa !2
  %3691 = getelementptr i8, ptr %3686, i32 -8
  store i8 %3690, ptr %3691, align 8, !tbaa !2
  %3692 = add i32 %3682, -1
  %3693 = and i8 %3690, 64
  %3694 = icmp eq i8 %3693, 0
  br i1 %3694, label %3706, label %3695

3695:                                             ; preds = %3681
  %3696 = load i8, ptr %3680, align 1, !tbaa !6
  %3697 = and i8 %3696, 32
  %3698 = icmp eq i8 %3697, 0
  br i1 %3698, label %3706, label %3699

3699:                                             ; preds = %3695
  %3700 = load ptr, ptr %3684, align 8, !tbaa !6
  %3701 = getelementptr inbounds i8, ptr %3700, i32 5
  %3702 = load i8, ptr %3701, align 1, !tbaa !25
  %3703 = and i8 %3702, 24
  %3704 = icmp eq i8 %3703, 0
  br i1 %3704, label %3706, label %3705

3705:                                             ; preds = %3699
  call void @luaC_barrierback_(ptr noundef %0, ptr noundef nonnull %3648) #12
  br label %3706

3706:                                             ; preds = %3695, %3699, %3705, %3681
  %3707 = add nsw i32 %3683, -1
  %3708 = icmp sgt i32 %3683, 1
  br i1 %3708, label %3681, label %3709

3709:                                             ; preds = %3706, %3676
  %3710 = icmp eq i32 %3245, 0
  br i1 %3710, label %3715, label %3711, !prof !27

3711:                                             ; preds = %3709
  %3712 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef %3672) #12
  %3713 = load ptr, ptr %29, align 4, !tbaa !6
  %3714 = getelementptr inbounds i8, ptr %3713, i32 16
  br label %3715

3715:                                             ; preds = %3711, %3709
  %3716 = phi i32 [ %3712, %3711 ], [ 0, %3709 ]
  %3717 = phi ptr [ %3714, %3711 ], [ %3247, %3709 ]
  %3718 = getelementptr inbounds i8, ptr %3672, i32 4
  br label %72

3719:                                             ; preds = %3243
  %3720 = lshr i32 %3248, 7
  %3721 = and i32 %3720, 255
  %3722 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3721
  %3723 = load ptr, ptr %32, align 4, !tbaa !32
  %3724 = getelementptr inbounds i8, ptr %3723, i32 56
  %3725 = load ptr, ptr %3724, align 4, !tbaa !49
  %3726 = lshr i32 %3248, 15
  %3727 = getelementptr inbounds ptr, ptr %3725, i32 %3726
  %3728 = load ptr, ptr %3727, align 4, !tbaa !23
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %3729 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %3729, ptr %12, align 4, !tbaa !6
  %3730 = getelementptr inbounds i8, ptr %3728, i32 12
  %3731 = load i32, ptr %3730, align 4, !tbaa !50
  %3732 = getelementptr inbounds i8, ptr %3728, i32 60
  %3733 = load ptr, ptr %3732, align 4, !tbaa !51
  %3734 = call ptr @luaF_newLclosure(ptr noundef %0, i32 noundef %3731) #12
  %3735 = getelementptr inbounds i8, ptr %3734, i32 12
  store ptr %3728, ptr %3735, align 4, !tbaa !32
  store ptr %3734, ptr %3722, align 8, !tbaa !6
  %3736 = getelementptr inbounds i8, ptr %3722, i32 8
  store i8 70, ptr %3736, align 8, !tbaa !2
  %3737 = icmp sgt i32 %3731, 0
  br i1 %3737, label %3738, label %3771

3738:                                             ; preds = %3719
  %3739 = getelementptr inbounds i8, ptr %3734, i32 16
  %3740 = getelementptr inbounds i8, ptr %3734, i32 5
  br label %3741

3741:                                             ; preds = %3768, %3738
  %3742 = phi i32 [ 0, %3738 ], [ %3769, %3768 ]
  %3743 = getelementptr inbounds %struct.Upvaldesc, ptr %3733, i32 %3742
  %3744 = getelementptr inbounds i8, ptr %3743, i32 4
  %3745 = load i8, ptr %3744, align 4, !tbaa !52
  %3746 = icmp eq i8 %3745, 0
  %3747 = getelementptr inbounds i8, ptr %3743, i32 5
  %3748 = load i8, ptr %3747, align 1, !tbaa !54
  %3749 = zext i8 %3748 to i32
  %3750 = getelementptr inbounds [1 x ptr], ptr %3739, i32 0, i32 %3742
  br i1 %3746, label %3754, label %3751

3751:                                             ; preds = %3741
  %3752 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3749
  %3753 = call ptr @luaF_findupval(ptr noundef %0, ptr noundef %3752) #12
  br label %3757

3754:                                             ; preds = %3741
  %3755 = getelementptr inbounds ptr, ptr %51, i32 %3749
  %3756 = load ptr, ptr %3755, align 4, !tbaa !23
  br label %3757

3757:                                             ; preds = %3754, %3751
  %3758 = phi ptr [ %3756, %3754 ], [ %3753, %3751 ]
  store ptr %3758, ptr %3750, align 4, !tbaa !23
  %3759 = load i8, ptr %3740, align 1, !tbaa !55
  %3760 = and i8 %3759, 32
  %3761 = icmp eq i8 %3760, 0
  br i1 %3761, label %3768, label %3762

3762:                                             ; preds = %3757
  %3763 = getelementptr inbounds i8, ptr %3758, i32 5
  %3764 = load i8, ptr %3763, align 1, !tbaa !37
  %3765 = and i8 %3764, 24
  %3766 = icmp eq i8 %3765, 0
  br i1 %3766, label %3768, label %3767

3767:                                             ; preds = %3762
  call void @luaC_barrier_(ptr noundef %0, ptr noundef nonnull %3734, ptr noundef nonnull %3758) #12
  br label %3768

3768:                                             ; preds = %3767, %3762, %3757
  %3769 = add nuw nsw i32 %3742, 1
  %3770 = icmp eq i32 %3769, %3731
  br i1 %3770, label %3771, label %3741

3771:                                             ; preds = %3768, %3719
  %3772 = load ptr, ptr %13, align 4, !tbaa !18
  %3773 = getelementptr inbounds i8, ptr %3772, i32 12
  %3774 = load i32, ptr %3773, align 4, !tbaa !39
  %3775 = icmp sgt i32 %3774, 0
  br i1 %3775, label %3776, label %3779

3776:                                             ; preds = %3771
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %3777 = getelementptr inbounds i8, ptr %3722, i32 16
  store ptr %3777, ptr %12, align 4, !tbaa !6
  call void @luaC_step(ptr noundef nonnull %0) #12
  %3778 = load volatile i32, ptr %49, align 4, !tbaa !6
  br label %3779

3779:                                             ; preds = %3776, %3771
  %3780 = phi i32 [ %3778, %3776 ], [ %3245, %3771 ]
  %3781 = icmp eq i32 %3780, 0
  br i1 %3781, label %3786, label %3782, !prof !27

3782:                                             ; preds = %3779
  %3783 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %3246) #12
  %3784 = load ptr, ptr %29, align 4, !tbaa !6
  %3785 = getelementptr inbounds i8, ptr %3784, i32 16
  br label %3786

3786:                                             ; preds = %3782, %3779
  %3787 = phi i32 [ %3783, %3782 ], [ 0, %3779 ]
  %3788 = phi ptr [ %3785, %3782 ], [ %3247, %3779 ]
  %3789 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

3790:                                             ; preds = %3243
  %3791 = lshr i32 %3248, 7
  %3792 = and i32 %3791, 255
  %3793 = getelementptr inbounds %union.StackValue, ptr %3247, i32 %3792
  %3794 = lshr i32 %3248, 24
  %3795 = add nsw i32 %3794, -1
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %3796 = load ptr, ptr %50, align 4, !tbaa !6
  store ptr %3796, ptr %12, align 4, !tbaa !6
  call void @luaT_getvarargs(ptr noundef %0, ptr noundef nonnull %29, ptr noundef %3793, i32 noundef %3795) #12
  %3797 = load volatile i32, ptr %49, align 4, !tbaa !6
  %3798 = icmp eq i32 %3797, 0
  br i1 %3798, label %3803, label %3799, !prof !27

3799:                                             ; preds = %3790
  %3800 = call i32 @luaG_traceexec(ptr noundef nonnull %0, ptr noundef nonnull %3246) #12
  %3801 = load ptr, ptr %29, align 4, !tbaa !6
  %3802 = getelementptr inbounds i8, ptr %3801, i32 16
  br label %3803

3803:                                             ; preds = %3799, %3790
  %3804 = phi i32 [ %3800, %3799 ], [ 0, %3790 ]
  %3805 = phi ptr [ %3802, %3799 ], [ %3247, %3790 ]
  %3806 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

3807:                                             ; preds = %3243
  store ptr %3246, ptr %36, align 4, !tbaa !6
  %3808 = lshr i32 %3248, 7
  %3809 = and i32 %3808, 255
  %3810 = load ptr, ptr %32, align 4, !tbaa !32
  call void @luaT_adjustvarargs(ptr noundef %0, i32 noundef %3809, ptr noundef nonnull %29, ptr noundef %3810) #12
  %3811 = load volatile i32, ptr %49, align 4, !tbaa !6
  %3812 = icmp eq i32 %3811, 0
  br i1 %3812, label %3815, label %3813, !prof !27

3813:                                             ; preds = %3807
  call void @luaD_hookcall(ptr noundef %0, ptr noundef nonnull %29) #12
  store i32 1, ptr %11, align 4, !tbaa !56
  %3814 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  br label %3815

3815:                                             ; preds = %3807, %3813
  %3816 = phi i32 [ %3814, %3813 ], [ 0, %3807 ]
  %3817 = load ptr, ptr %29, align 4, !tbaa !6
  %3818 = getelementptr inbounds i8, ptr %3817, i32 16
  %3819 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72

3820:                                             ; preds = %3243
  %3821 = icmp eq i32 %3245, 0
  br i1 %3821, label %3826, label %3822, !prof !27

3822:                                             ; preds = %3820
  %3823 = call i32 @luaG_traceexec(ptr noundef %0, ptr noundef nonnull %3246) #12
  %3824 = load ptr, ptr %29, align 4, !tbaa !6
  %3825 = getelementptr inbounds i8, ptr %3824, i32 16
  br label %3826

3826:                                             ; preds = %3822, %3820
  %3827 = phi i32 [ %3823, %3822 ], [ 0, %3820 ]
  %3828 = phi ptr [ %3825, %3822 ], [ %3247, %3820 ]
  %3829 = getelementptr inbounds i8, ptr %3246, i32 4
  br label %72
}

declare i32 @luaG_tracecall(ptr noundef) local_unnamed_addr #5

declare i32 @luaG_traceexec(ptr noundef, ptr noundef) local_unnamed_addr #5

declare void @luaC_barrier_(ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #5

declare ptr @luaH_getshortstr(ptr noundef, ptr noundef) local_unnamed_addr #5

declare ptr @luaH_getint(ptr noundef, i64 noundef) local_unnamed_addr #5

declare ptr @luaH_new(ptr noundef) local_unnamed_addr #5

declare void @luaH_resize(ptr noundef, ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

declare void @luaC_step(ptr noundef) local_unnamed_addr #5

declare ptr @luaH_getstr(ptr noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.pow.f64(double, double) #3

declare void @luaT_trybinTM(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

declare void @luaT_trybiniTM(ptr noundef, ptr noundef, i64 noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

declare void @luaT_trybinassocTM(ptr noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

declare ptr @luaF_close(ptr noundef, ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

declare void @luaF_newtbcupval(ptr noundef, ptr noundef) local_unnamed_addr #5

declare i32 @luaT_callorderiTM(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

declare ptr @luaD_precall(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

declare void @luaF_closeupval(ptr noundef, ptr noundef) local_unnamed_addr #5

declare i32 @luaD_pretailcall(ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

declare void @luaD_poscall(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

declare void @luaD_call(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

declare i32 @luaH_realasize(ptr noundef) local_unnamed_addr #5

declare void @luaH_resizearray(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

declare void @luaT_getvarargs(ptr noundef, ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

declare void @luaT_adjustvarargs(ptr noundef, i32 noundef, ptr noundef, ptr noundef) local_unnamed_addr #5

declare void @luaD_hookcall(ptr noundef, ptr noundef) local_unnamed_addr #5

declare i32 @luaO_str2num(ptr noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind memory(read)
define internal fastcc i32 @l_strcmp(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) unnamed_addr #9 {
  %3 = getelementptr inbounds i8, ptr %0, i32 16
  %4 = getelementptr inbounds i8, ptr %0, i32 7
  %5 = load i8, ptr %4, align 1, !tbaa !7
  %6 = icmp eq i8 %5, -1
  br i1 %6, label %9, label %7

7:                                                ; preds = %2
  %8 = zext i8 %5 to i32
  br label %12

9:                                                ; preds = %2
  %10 = getelementptr inbounds i8, ptr %0, i32 12
  %11 = load i32, ptr %10, align 4, !tbaa !6
  br label %12

12:                                               ; preds = %9, %7
  %13 = phi i32 [ %8, %7 ], [ %11, %9 ]
  %14 = getelementptr inbounds i8, ptr %1, i32 16
  %15 = getelementptr inbounds i8, ptr %1, i32 7
  %16 = load i8, ptr %15, align 1, !tbaa !7
  %17 = icmp eq i8 %16, -1
  br i1 %17, label %20, label %18

18:                                               ; preds = %12
  %19 = zext i8 %16 to i32
  br label %23

20:                                               ; preds = %12
  %21 = getelementptr inbounds i8, ptr %1, i32 12
  %22 = load i32, ptr %21, align 4, !tbaa !6
  br label %23

23:                                               ; preds = %20, %18
  %24 = phi i32 [ %19, %18 ], [ %22, %20 ]
  %25 = tail call i32 @strcoll(ptr noundef nonnull %3, ptr noundef nonnull %14)
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %49

27:                                               ; preds = %23, %40
  %28 = phi i32 [ %46, %40 ], [ %24, %23 ]
  %29 = phi ptr [ %45, %40 ], [ %14, %23 ]
  %30 = phi i32 [ %44, %40 ], [ %13, %23 ]
  %31 = phi ptr [ %43, %40 ], [ %3, %23 ]
  %32 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %31) #12
  %33 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %29) #12
  %34 = icmp eq i32 %33, %28
  br i1 %34, label %35, label %38

35:                                               ; preds = %27
  %36 = icmp ne i32 %32, %30
  %37 = zext i1 %36 to i32
  br label %49

38:                                               ; preds = %27
  %39 = icmp eq i32 %32, %30
  br i1 %39, label %49, label %40

40:                                               ; preds = %38
  %41 = add i32 %32, 1
  %42 = add i32 %33, 1
  %43 = getelementptr inbounds i8, ptr %31, i32 %41
  %44 = sub i32 %30, %41
  %45 = getelementptr inbounds i8, ptr %29, i32 %42
  %46 = sub i32 %28, %42
  %47 = tail call i32 @strcoll(ptr noundef %43, ptr noundef %45)
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %27, label %49

49:                                               ; preds = %38, %40, %23, %35
  %50 = phi i32 [ %37, %35 ], [ %25, %23 ], [ -1, %38 ], [ %47, %40 ]
  ret i32 %50
}

declare i32 @luaT_callorderTM(ptr noundef, ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nofree nounwind willreturn memory(read)
declare i32 @strcoll(ptr nocapture noundef, ptr nocapture noundef) local_unnamed_addr #10

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @strlen(ptr nocapture noundef) local_unnamed_addr #11

; Function Attrs: noreturn
declare void @luaG_forerror(ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #6

declare ptr @luaF_newLclosure(ptr noundef, i32 noundef) local_unnamed_addr #5

declare ptr @luaF_findupval(ptr noundef, ptr noundef) local_unnamed_addr #5

attributes #0 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+multivalue,+mutable-globals,+reference-types,+sign-ext" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+multivalue,+mutable-globals,+reference-types,+sign-ext" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+multivalue,+mutable-globals,+reference-types,+sign-ext" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+multivalue,+mutable-globals,+reference-types,+sign-ext" }
attributes #6 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+multivalue,+mutable-globals,+reference-types,+sign-ext" }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+multivalue,+mutable-globals,+reference-types,+sign-ext" }
attributes #9 = { nofree nounwind memory(read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+multivalue,+mutable-globals,+reference-types,+sign-ext" }
attributes #10 = { mustprogress nofree nounwind willreturn memory(read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+multivalue,+mutable-globals,+reference-types,+sign-ext" }
attributes #11 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+multivalue,+mutable-globals,+reference-types,+sign-ext" }
attributes #12 = { nounwind }
attributes #13 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 19.1.0"}
!2 = !{!3, !4, i64 8}
!3 = !{!"TValue", !4, i64 0, !4, i64 8}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!4, !4, i64 0}
!7 = !{!8, !4, i64 7}
!8 = !{!"TString", !9, i64 0, !4, i64 4, !4, i64 5, !4, i64 6, !4, i64 7, !10, i64 8, !4, i64 12, !4, i64 16}
!9 = !{!"any pointer", !4, i64 0}
!10 = !{!"int", !4, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !4, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"long long", !4, i64 0}
!15 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!16 = !{!17, !4, i64 6}
!17 = !{!"Table", !9, i64 0, !4, i64 4, !4, i64 5, !4, i64 6, !4, i64 7, !10, i64 8, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28}
!18 = !{!19, !9, i64 16}
!19 = !{!"lua_State", !9, i64 0, !4, i64 4, !4, i64 5, !4, i64 6, !4, i64 7, !20, i64 8, !4, i64 12, !9, i64 16, !9, i64 20, !4, i64 24, !4, i64 28, !9, i64 32, !4, i64 36, !9, i64 40, !9, i64 44, !9, i64 48, !21, i64 52, !9, i64 88, !22, i64 92, !10, i64 96, !10, i64 100, !10, i64 104, !10, i64 108, !10, i64 112}
!20 = !{!"short", !4, i64 0}
!21 = !{!"CallInfo", !4, i64 0, !4, i64 4, !9, i64 8, !9, i64 12, !4, i64 16, !4, i64 28, !20, i64 32, !20, i64 34}
!22 = !{!"long", !4, i64 0}
!23 = !{!9, !9, i64 0}
!24 = !{!17, !9, i64 24}
!25 = !{!26, !4, i64 5}
!26 = !{!"GCObject", !9, i64 0, !4, i64 4, !4, i64 5}
!27 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!28 = !{!8, !4, i64 4}
!29 = !{!19, !9, i64 20}
!30 = !{!10, !10, i64 0}
!31 = !{!19, !10, i64 112}
!32 = !{!33, !9, i64 12}
!33 = !{!"LClosure", !9, i64 0, !4, i64 4, !4, i64 5, !4, i64 6, !9, i64 8, !9, i64 12, !4, i64 16}
!34 = !{!35, !9, i64 48}
!35 = !{!"Proto", !9, i64 0, !4, i64 4, !4, i64 5, !4, i64 6, !4, i64 7, !4, i64 8, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !10, i64 32, !10, i64 36, !10, i64 40, !10, i64 44, !9, i64 48, !9, i64 52, !9, i64 56, !9, i64 60, !9, i64 64, !9, i64 68, !9, i64 72, !9, i64 76, !9, i64 80}
!36 = !{!"branch_weights", !"expected", i32 0, i32 -2147483648}
!37 = !{!38, !4, i64 5}
!38 = !{!"UpVal", !9, i64 0, !4, i64 4, !4, i64 5, !4, i64 8, !4, i64 16}
!39 = !{!40, !22, i64 12}
!40 = !{!"global_State", !9, i64 0, !9, i64 4, !22, i64 8, !22, i64 12, !22, i64 16, !22, i64 20, !41, i64 24, !3, i64 40, !3, i64 56, !10, i64 72, !4, i64 76, !4, i64 77, !4, i64 78, !4, i64 79, !4, i64 80, !4, i64 81, !4, i64 82, !4, i64 83, !4, i64 84, !4, i64 85, !4, i64 86, !9, i64 88, !9, i64 92, !9, i64 96, !9, i64 100, !9, i64 104, !9, i64 108, !9, i64 112, !9, i64 116, !9, i64 120, !9, i64 124, !9, i64 128, !9, i64 132, !9, i64 136, !9, i64 140, !9, i64 144, !9, i64 148, !9, i64 152, !9, i64 156, !9, i64 160, !9, i64 164, !9, i64 168, !4, i64 172, !4, i64 272, !4, i64 308, !9, i64 732, !9, i64 736}
!41 = !{!"stringtable", !9, i64 0, !10, i64 4, !10, i64 8}
!42 = !{!"branch_weights", i32 1, i32 4000, i32 1}
!43 = !{!21, !9, i64 8}
!44 = !{!21, !20, i64 32}
!45 = !{!"branch_weights", i32 1, i32 1999}
!46 = !{!"branch_weights", i32 0, i32 1}
!47 = !{!21, !20, i64 34}
!48 = !{!17, !9, i64 12}
!49 = !{!35, !9, i64 56}
!50 = !{!35, !10, i64 12}
!51 = !{!35, !9, i64 60}
!52 = !{!53, !4, i64 4}
!53 = !{!"Upvaldesc", !9, i64 0, !4, i64 4, !4, i64 5, !4, i64 6}
!54 = !{!53, !4, i64 5}
!55 = !{!33, !4, i64 5}
!56 = !{!19, !10, i64 100}
