; ModuleID = 'pping_kern.c'
source_filename = "pping_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.5 = type { [4 x i32]*, [4 x i32]*, [4 x i32]* }
%struct.anon.6 = type { [1 x i32]*, %struct.network_tuple*, %struct.dual_flow_state*, [16384 x i32]* }
%struct.network_tuple = type { %struct.flow_address, %struct.flow_address, i16, i8, i8 }
%struct.flow_address = type { %struct.in6_addr, i16, i16 }
%struct.in6_addr = type { %union.anon.3 }
%union.anon.3 = type { [4 x i32] }
%struct.dual_flow_state = type { %struct.flow_state, %struct.flow_state }
%struct.flow_state = type { i64, i64, i64, i64, i64, i64, i64, i32, i32, i8, i8, i8, [5 x i8] }
%struct.anon.7 = type { [1 x i32]*, %struct.packet_id*, i64*, [16384 x i32]* }
%struct.packet_id = type { %struct.network_tuple, i32 }
%struct.bpf_config = type { i64, i64, i8, i8, i8, i8, i8, [3 x i8] }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }
%struct.packet_info = type { i64, i32, %struct.packet_id, %struct.packet_id, i32, %union.anon.4, i16, i8, i8, i8, i8, i8, i8, i8 }
%union.anon.4 = type { i32 }
%struct.parsing_context = type { i8*, i8*, %struct.hdr_cursor, i32 }
%struct.hdr_cursor = type { i8* }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.collect_vlans = type { [2 x i16] }
%struct.icmp6hdr = type { i8, i8, i16, %union.anon.13 }
%union.anon.13 = type { [1 x i32] }
%struct.icmphdr = type { i8, i8, i16, %union.anon.10 }
%union.anon.10 = type { i32 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.protocol_info = type { i32, i32, i8, i8, i8, i8, i8 }
%struct.icmpv6_echo = type { i16, i16 }
%struct.anon.11 = type { i16, i16 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.bpf_iter__bpf_map_elem = type { %struct.bpf_iter_meta*, %struct.bpf_map*, i8*, i8* }
%struct.bpf_iter_meta = type { %struct.seq_file*, i64, i64 }
%struct.seq_file = type opaque
%struct.bpf_map = type opaque
%struct.flow_event = type { i64, i64, %struct.network_tuple, i8, i8, i8, i8 }
%struct.rtt_event = type { i64, i64, %struct.network_tuple, i32, i64, i64, i64, i64, i64, i64, i8, [7 x i8] }
%struct.bpf_fib_lookup = type { i8, i8, i16, i16, i16, i32, %union.anon.14, %union.anon.15, %union.anon.16, i16, i16, [6 x i8], [6 x i8] }
%union.anon.14 = type { i32 }
%union.anon.15 = type { [4 x i32] }
%union.anon.16 = type { [4 x i32] }
%struct.map_full_event = type { i64, i64, %struct.network_tuple, i8, [3 x i8] }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@events = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !204
@flow_state = dso_local global %struct.anon.6 zeroinitializer, section ".maps", align 8, !dbg !172
@packet_ts = dso_local global %struct.anon.7 zeroinitializer, section ".maps", align 8, !dbg !147
@config = internal constant %struct.bpf_config zeroinitializer, align 8, !dbg !213
@last_warn_time = internal global [2 x i64] zeroinitializer, align 8, !dbg !239
@llvm.used = appending global [9 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.5* @events to i8*), i8* bitcast (%struct.anon.6* @flow_state to i8*), i8* bitcast (i32 (%struct.bpf_iter__bpf_map_elem*)* @flowmap_cleanup to i8*), i8* bitcast (%struct.anon.7* @packet_ts to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @pping_tc_egress to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @pping_tc_ingress to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @pping_xdp_ingress to i8*), i8* bitcast (i32 (%struct.bpf_iter__bpf_map_elem*)* @tsmap_cleanup to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind
define dso_local i32 @parse_packet_identifer_tc(%struct.__sk_buff* nocapture readonly %0, %struct.packet_info* %1) local_unnamed_addr #0 !dbg !308 {
  %3 = alloca %struct.parsing_context, align 8
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !421, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !422, metadata !DIExpression()), !dbg !434
  %4 = icmp eq %struct.packet_info* %1, null, !dbg !435
  br i1 %4, label %22, label %5, !dbg !437

5:                                                ; preds = %2
  %6 = bitcast %struct.parsing_context* %3 to i8*, !dbg !438
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #6, !dbg !438
  call void @llvm.dbg.declare(metadata %struct.parsing_context* %3, metadata !423, metadata !DIExpression()), !dbg !439
  %7 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 0, !dbg !440
  %8 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !441
  %9 = load i32, i32* %8, align 4, !dbg !441, !tbaa !442
  %10 = zext i32 %9 to i64, !dbg !448
  %11 = inttoptr i64 %10 to i8*, !dbg !449
  store i8* %11, i8** %7, align 8, !dbg !440, !tbaa !450
  %12 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 1, !dbg !440
  %13 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !454
  %14 = load i32, i32* %13, align 8, !dbg !454, !tbaa !455
  %15 = zext i32 %14 to i64, !dbg !456
  %16 = inttoptr i64 %15 to i8*, !dbg !457
  store i8* %16, i8** %12, align 8, !dbg !440, !tbaa !458
  %17 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 2, i32 0, !dbg !459
  store i8* %11, i8** %17, align 8, !dbg !459, !tbaa !460
  %18 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 3, !dbg !440
  %19 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 0, !dbg !461
  %20 = load i32, i32* %19, align 8, !dbg !461, !tbaa !462
  store i32 %20, i32* %18, align 8, !dbg !440, !tbaa !463
  %21 = call fastcc i32 @parse_packet_identifier(%struct.parsing_context* nonnull %3, %struct.packet_info* nonnull %1), !dbg !464
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #6, !dbg !465
  br label %22

22:                                               ; preds = %2, %5
  %23 = phi i32 [ %21, %5 ], [ -1, %2 ], !dbg !434
  ret i32 %23, !dbg !465
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
define internal fastcc i32 @parse_packet_identifier(%struct.parsing_context* nocapture %0, %struct.packet_info* %1) unnamed_addr #3 !dbg !466 {
  %3 = alloca i8, align 1
  call void @llvm.dbg.declare(metadata [3 x i8]* undef, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 104, 24)), !dbg !615
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !471, metadata !DIExpression()), !dbg !616
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !472, metadata !DIExpression()), !dbg !616
  %4 = tail call i64 inttoptr (i64 5 to i64 ()*)() #6, !dbg !617
  %5 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !618
  store i64 %4, i64* %5, align 8, !dbg !619, !tbaa !620
  %6 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 1, !dbg !628
  %7 = load i8*, i8** %6, align 8, !dbg !628, !tbaa !458
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !475, metadata !DIExpression(DW_OP_deref)), !dbg !616
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !629, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !638
  call void @llvm.dbg.value(metadata i8* %7, metadata !636, metadata !DIExpression()), !dbg !638
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !637, metadata !DIExpression()), !dbg !638
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !640, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !663
  call void @llvm.dbg.value(metadata i8* %7, metadata !650, metadata !DIExpression()), !dbg !663
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !651, metadata !DIExpression()), !dbg !663
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !652, metadata !DIExpression()), !dbg !663
  %8 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 2, i32 0, !dbg !665
  %9 = load i8*, i8** %8, align 8, !dbg !665, !tbaa !460
  call void @llvm.dbg.value(metadata i8* %9, metadata !653, metadata !DIExpression()), !dbg !663
  call void @llvm.dbg.value(metadata i32 14, metadata !654, metadata !DIExpression()), !dbg !663
  %10 = getelementptr i8, i8* %9, i64 14, !dbg !666
  %11 = icmp ugt i8* %10, %7, !dbg !668
  %12 = bitcast i8* %7 to %struct.icmp6hdr*, !dbg !669
  %13 = bitcast i8* %7 to %struct.icmphdr*, !dbg !669
  br i1 %11, label %663, label %14, !dbg !669

14:                                               ; preds = %2
  call void @llvm.dbg.value(metadata i8* %9, metadata !653, metadata !DIExpression()), !dbg !663
  call void @llvm.dbg.value(metadata i8* %10, metadata !655, metadata !DIExpression()), !dbg !663
  %15 = getelementptr inbounds i8, i8* %9, i64 12, !dbg !670
  %16 = bitcast i8* %15 to i16*, !dbg !670
  call void @llvm.dbg.value(metadata i16 undef, metadata !661, metadata !DIExpression()), !dbg !663
  call void @llvm.dbg.value(metadata i32 0, metadata !662, metadata !DIExpression()), !dbg !663
  %17 = load i16, i16* %16, align 1, !dbg !663, !tbaa !671
  call void @llvm.dbg.value(metadata i16 %17, metadata !661, metadata !DIExpression()), !dbg !663
  %18 = getelementptr i8, i8* %9, i64 22, !dbg !672
  switch i16 %17, label %32 [
    i16 -22392, label %19
    i16 129, label %19
  ], !dbg !674

19:                                               ; preds = %14, %14
  %20 = getelementptr i8, i8* %9, i64 18, !dbg !677
  %21 = icmp ugt i8* %20, %7, !dbg !679
  br i1 %21, label %32, label %22, !dbg !680

22:                                               ; preds = %19
  call void @llvm.dbg.value(metadata i16 undef, metadata !661, metadata !DIExpression()), !dbg !663
  %23 = getelementptr i8, i8* %9, i64 16, !dbg !681
  %24 = bitcast i8* %23 to i16*, !dbg !681
  call void @llvm.dbg.value(metadata i8* %20, metadata !655, metadata !DIExpression()), !dbg !663
  call void @llvm.dbg.value(metadata i32 1, metadata !662, metadata !DIExpression()), !dbg !663
  %25 = load i16, i16* %24, align 1, !dbg !663, !tbaa !671
  call void @llvm.dbg.value(metadata i16 %25, metadata !661, metadata !DIExpression()), !dbg !663
  switch i16 %25, label %32 [
    i16 -22392, label %26
    i16 129, label %26
  ], !dbg !674

26:                                               ; preds = %22, %22
  %27 = icmp ugt i8* %18, %7, !dbg !679
  br i1 %27, label %32, label %28, !dbg !680

28:                                               ; preds = %26
  call void @llvm.dbg.value(metadata i16 undef, metadata !661, metadata !DIExpression()), !dbg !663
  %29 = getelementptr i8, i8* %9, i64 20, !dbg !681
  %30 = bitcast i8* %29 to i16*, !dbg !681
  call void @llvm.dbg.value(metadata i8* %18, metadata !655, metadata !DIExpression()), !dbg !663
  call void @llvm.dbg.value(metadata i32 2, metadata !662, metadata !DIExpression()), !dbg !663
  %31 = load i16, i16* %30, align 1, !dbg !663, !tbaa !671
  call void @llvm.dbg.value(metadata i16 %31, metadata !661, metadata !DIExpression()), !dbg !663
  br label %32

32:                                               ; preds = %14, %19, %22, %26, %28
  %33 = phi i8* [ %10, %14 ], [ %10, %19 ], [ %20, %22 ], [ %20, %26 ], [ %18, %28 ]
  %34 = phi i16 [ %17, %14 ], [ %17, %19 ], [ %25, %22 ], [ %25, %26 ], [ %31, %28 ], !dbg !663
  store i8* %33, i8** %8, align 8, !dbg !682, !tbaa !460
  call void @llvm.dbg.value(metadata i16 %34, metadata !473, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !616
  %35 = bitcast i8* %33 to %struct.icmp6hdr*, !dbg !683
  %36 = bitcast i8* %33 to %struct.icmphdr*, !dbg !683
  switch i16 %34, label %663 [
    i16 8, label %37
    i16 -8826, label %60
  ], !dbg !683

37:                                               ; preds = %32
  %38 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 3, !dbg !684
  store i8 2, i8* %38, align 2, !dbg !687, !tbaa !688
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !689, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !699
  call void @llvm.dbg.value(metadata i8* %7, metadata !695, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !696, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.value(metadata i8* %33, metadata !697, metadata !DIExpression()), !dbg !699
  %39 = getelementptr inbounds i8, i8* %33, i64 20, !dbg !701
  %40 = icmp ugt i8* %39, %7, !dbg !703
  br i1 %40, label %146, label %41, !dbg !704

41:                                               ; preds = %37
  %42 = load i8, i8* %33, align 4, !dbg !705
  %43 = and i8 %42, -16, !dbg !707
  %44 = icmp eq i8 %43, 64, !dbg !707
  br i1 %44, label %45, label %146, !dbg !708

45:                                               ; preds = %41
  %46 = shl i8 %42, 2, !dbg !709
  %47 = and i8 %46, 60, !dbg !709
  call void @llvm.dbg.value(metadata i8 %47, metadata !698, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !699
  %48 = icmp ult i8 %47, 20, !dbg !710
  br i1 %48, label %146, label %49, !dbg !712

49:                                               ; preds = %45
  %50 = zext i8 %47 to i64
  call void @llvm.dbg.value(metadata i64 %50, metadata !698, metadata !DIExpression()), !dbg !699
  %51 = getelementptr i8, i8* %33, i64 %50, !dbg !713
  %52 = icmp ugt i8* %51, %7, !dbg !715
  br i1 %52, label %146, label %53, !dbg !716

53:                                               ; preds = %49
  store i8* %51, i8** %8, align 8, !dbg !717, !tbaa !460
  %54 = bitcast i8* %33 to %struct.iphdr*, !dbg !718
  call void @llvm.dbg.value(metadata %struct.iphdr* %54, metadata !494, metadata !DIExpression()), !dbg !616
  %55 = getelementptr inbounds i8, i8* %33, i64 9, !dbg !719
  %56 = load i8, i8* %55, align 1, !dbg !719, !tbaa !720
  %57 = zext i8 %56 to i16, !dbg !722
  %58 = bitcast i8* %51 to %struct.icmp6hdr*, !dbg !723
  %59 = bitcast i8* %51 to %struct.icmphdr*, !dbg !723
  br label %146, !dbg !723

60:                                               ; preds = %32
  %61 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 3, !dbg !724
  store i8 10, i8* %61, align 2, !dbg !727, !tbaa !688
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !728, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !737
  call void @llvm.dbg.value(metadata i8* %7, metadata !734, metadata !DIExpression()), !dbg !737
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !735, metadata !DIExpression()), !dbg !737
  call void @llvm.dbg.value(metadata i8* %33, metadata !736, metadata !DIExpression()), !dbg !737
  %62 = getelementptr inbounds i8, i8* %33, i64 40, !dbg !739
  %63 = icmp ugt i8* %62, %7, !dbg !741
  br i1 %63, label %146, label %64, !dbg !742

64:                                               ; preds = %60
  %65 = load i8, i8* %33, align 4, !dbg !743
  %66 = and i8 %65, -16, !dbg !745
  %67 = icmp eq i8 %66, 96, !dbg !745
  br i1 %67, label %68, label %146, !dbg !746

68:                                               ; preds = %64
  store i8* %62, i8** %8, align 8, !dbg !747, !tbaa !460
  %69 = bitcast i8* %33 to %struct.iphdr*, !dbg !748
  call void @llvm.dbg.value(metadata %struct.iphdr* %69, metadata !494, metadata !DIExpression()), !dbg !616
  %70 = getelementptr inbounds i8, i8* %33, i64 6, !dbg !749
  %71 = load i8, i8* %70, align 2, !dbg !749, !tbaa !750
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !752, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !769
  call void @llvm.dbg.value(metadata i8* %7, metadata !757, metadata !DIExpression()), !dbg !769
  call void @llvm.dbg.value(metadata i32 0, metadata !759, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata i8 %71, metadata !758, metadata !DIExpression()), !dbg !769
  call void @llvm.dbg.value(metadata i8* %62, metadata !761, metadata !DIExpression()), !dbg !772
  %72 = getelementptr inbounds i8, i8* %33, i64 42, !dbg !773
  %73 = icmp ugt i8* %72, %7, !dbg !775
  %74 = bitcast i8* %62 to %struct.icmp6hdr*, !dbg !776
  %75 = bitcast i8* %62 to %struct.icmphdr*, !dbg !776
  br i1 %73, label %146, label %76, !dbg !776

76:                                               ; preds = %68
  switch i8 %71, label %93 [
    i8 0, label %77
    i8 60, label %77
    i8 43, label %77
    i8 -121, label %77
    i8 51, label %84
    i8 44, label %91
  ], !dbg !777

77:                                               ; preds = %76, %76, %76, %76
  %78 = getelementptr inbounds i8, i8* %33, i64 41, !dbg !778
  %79 = load i8, i8* %78, align 1, !dbg !778, !tbaa !780
  %80 = zext i8 %79 to i64, !dbg !782
  %81 = shl nuw nsw i64 %80, 3, !dbg !783
  %82 = add nuw nsw i64 %81, 8, !dbg !783
  %83 = getelementptr inbounds i8, i8* %62, i64 %82, !dbg !784
  call void @llvm.dbg.value(metadata i8 undef, metadata !758, metadata !DIExpression()), !dbg !769
  br label %99, !dbg !785

84:                                               ; preds = %76
  %85 = getelementptr inbounds i8, i8* %33, i64 41, !dbg !786
  %86 = load i8, i8* %85, align 1, !dbg !786, !tbaa !780
  %87 = zext i8 %86 to i64, !dbg !787
  %88 = shl nuw nsw i64 %87, 2, !dbg !788
  %89 = add nuw nsw i64 %88, 8, !dbg !788
  %90 = getelementptr inbounds i8, i8* %62, i64 %89, !dbg !789
  call void @llvm.dbg.value(metadata i8 undef, metadata !758, metadata !DIExpression()), !dbg !769
  br label %99, !dbg !790

91:                                               ; preds = %76
  %92 = getelementptr inbounds i8, i8* %33, i64 48, !dbg !791
  call void @llvm.dbg.value(metadata i8 undef, metadata !758, metadata !DIExpression()), !dbg !769
  br label %99, !dbg !792

93:                                               ; preds = %123, %106, %76
  %94 = phi %struct.icmphdr* [ %75, %76 ], [ %102, %106 ], [ %119, %123 ]
  %95 = phi %struct.icmp6hdr* [ %74, %76 ], [ %101, %106 ], [ %118, %123 ]
  %96 = phi i8* [ %62, %76 ], [ %100, %106 ], [ %117, %123 ]
  %97 = phi i8 [ %71, %76 ], [ %103, %106 ], [ %120, %123 ]
  %98 = zext i8 %97 to i16, !dbg !793
  br label %146, !dbg !794

99:                                               ; preds = %91, %84, %77
  %100 = phi i8* [ %92, %91 ], [ %90, %84 ], [ %83, %77 ]
  store i8* %100, i8** %8, align 8, !dbg !795, !tbaa !460
  %101 = bitcast i8* %100 to %struct.icmp6hdr*, !dbg !795
  %102 = bitcast i8* %100 to %struct.icmphdr*, !dbg !795
  %103 = load i8, i8* %62, align 1, !dbg !795, !tbaa !796
  call void @llvm.dbg.value(metadata i32 1, metadata !759, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata i8 %103, metadata !758, metadata !DIExpression()), !dbg !769
  call void @llvm.dbg.value(metadata i8* %100, metadata !761, metadata !DIExpression()), !dbg !772
  %104 = getelementptr inbounds i8, i8* %100, i64 2, !dbg !773
  %105 = icmp ugt i8* %104, %7, !dbg !775
  br i1 %105, label %146, label %106, !dbg !776

106:                                              ; preds = %99
  switch i8 %103, label %93 [
    i8 0, label %107
    i8 60, label %107
    i8 43, label %107
    i8 -121, label %107
    i8 51, label %108
    i8 44, label %115
  ], !dbg !777

107:                                              ; preds = %106, %106, %106, %106
  call void @llvm.dbg.value(metadata i8 undef, metadata !758, metadata !DIExpression()), !dbg !769
  br label %108, !dbg !785

108:                                              ; preds = %106, %107
  %109 = phi i64 [ 3, %107 ], [ 2, %106 ]
  %110 = getelementptr inbounds i8, i8* %100, i64 1, !dbg !795
  %111 = load i8, i8* %110, align 1, !dbg !795, !tbaa !780
  %112 = zext i8 %111 to i64, !dbg !795
  %113 = shl nuw nsw i64 %112, %109, !dbg !795
  %114 = add nuw nsw i64 %113, 8, !dbg !795
  br label %115, !dbg !795

115:                                              ; preds = %108, %106
  %116 = phi i64 [ 8, %106 ], [ %114, %108 ]
  %117 = getelementptr inbounds i8, i8* %100, i64 %116, !dbg !795
  store i8* %117, i8** %8, align 8, !dbg !795, !tbaa !460
  %118 = bitcast i8* %117 to %struct.icmp6hdr*, !dbg !795
  %119 = bitcast i8* %117 to %struct.icmphdr*, !dbg !795
  %120 = load i8, i8* %100, align 1, !dbg !795, !tbaa !796
  call void @llvm.dbg.value(metadata i32 2, metadata !759, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata i8 %120, metadata !758, metadata !DIExpression()), !dbg !769
  call void @llvm.dbg.value(metadata i8* %117, metadata !761, metadata !DIExpression()), !dbg !772
  %121 = getelementptr inbounds i8, i8* %117, i64 2, !dbg !773
  %122 = icmp ugt i8* %121, %7, !dbg !775
  br i1 %122, label %146, label %123, !dbg !776

123:                                              ; preds = %115
  switch i8 %120, label %93 [
    i8 0, label %137
    i8 60, label %137
    i8 43, label %137
    i8 -121, label %137
    i8 51, label %128
    i8 44, label %124
  ], !dbg !777

124:                                              ; preds = %123
  %125 = getelementptr inbounds i8, i8* %117, i64 8, !dbg !791
  store i8* %125, i8** %8, align 8, !dbg !797, !tbaa !460
  call void @llvm.dbg.value(metadata i8 undef, metadata !758, metadata !DIExpression()), !dbg !769
  %126 = bitcast i8* %125 to %struct.icmp6hdr*, !dbg !792
  %127 = bitcast i8* %125 to %struct.icmphdr*, !dbg !792
  br label %146, !dbg !792

128:                                              ; preds = %123
  %129 = getelementptr inbounds i8, i8* %117, i64 1, !dbg !786
  %130 = load i8, i8* %129, align 1, !dbg !786, !tbaa !780
  %131 = zext i8 %130 to i64, !dbg !787
  %132 = shl nuw nsw i64 %131, 2, !dbg !788
  %133 = add nuw nsw i64 %132, 8, !dbg !788
  %134 = getelementptr inbounds i8, i8* %117, i64 %133, !dbg !789
  store i8* %134, i8** %8, align 8, !dbg !798, !tbaa !460
  call void @llvm.dbg.value(metadata i8 undef, metadata !758, metadata !DIExpression()), !dbg !769
  %135 = bitcast i8* %134 to %struct.icmp6hdr*, !dbg !790
  %136 = bitcast i8* %134 to %struct.icmphdr*, !dbg !790
  br label %146, !dbg !790

137:                                              ; preds = %123, %123, %123, %123
  %138 = getelementptr inbounds i8, i8* %117, i64 1, !dbg !778
  %139 = load i8, i8* %138, align 1, !dbg !778, !tbaa !780
  %140 = zext i8 %139 to i64, !dbg !782
  %141 = shl nuw nsw i64 %140, 3, !dbg !783
  %142 = add nuw nsw i64 %141, 8, !dbg !783
  %143 = getelementptr inbounds i8, i8* %117, i64 %142, !dbg !784
  store i8* %143, i8** %8, align 8, !dbg !799, !tbaa !460
  call void @llvm.dbg.value(metadata i8 undef, metadata !758, metadata !DIExpression()), !dbg !769
  %144 = bitcast i8* %143 to %struct.icmp6hdr*, !dbg !785
  %145 = bitcast i8* %143 to %struct.icmphdr*, !dbg !785
  br label %146, !dbg !785

146:                                              ; preds = %137, %128, %124, %115, %99, %93, %68, %64, %60, %53, %49, %45, %41, %37
  %147 = phi i16 [ -1, %37 ], [ -1, %45 ], [ -1, %49 ], [ %57, %53 ], [ -1, %41 ], [ -1, %60 ], [ -1, %68 ], [ %98, %93 ], [ -1, %99 ], [ -1, %115 ], [ -1, %124 ], [ -1, %128 ], [ -1, %137 ], [ -1, %64 ]
  %148 = phi %struct.icmphdr* [ %36, %37 ], [ %36, %45 ], [ %36, %49 ], [ %59, %53 ], [ %36, %41 ], [ %36, %60 ], [ %75, %68 ], [ %94, %93 ], [ %102, %99 ], [ %119, %115 ], [ %127, %124 ], [ %136, %128 ], [ %145, %137 ], [ %36, %64 ]
  %149 = phi %struct.icmp6hdr* [ %35, %37 ], [ %35, %45 ], [ %35, %49 ], [ %58, %53 ], [ %35, %41 ], [ %35, %60 ], [ %74, %68 ], [ %95, %93 ], [ %101, %99 ], [ %118, %115 ], [ %126, %124 ], [ %135, %128 ], [ %144, %137 ], [ %35, %64 ]
  %150 = phi i1 [ true, %37 ], [ true, %45 ], [ true, %49 ], [ true, %53 ], [ true, %41 ], [ false, %60 ], [ false, %68 ], [ false, %93 ], [ false, %99 ], [ false, %115 ], [ false, %124 ], [ false, %128 ], [ false, %137 ], [ false, %64 ]
  %151 = phi i8 [ 2, %37 ], [ 2, %45 ], [ 2, %49 ], [ 2, %53 ], [ 2, %41 ], [ 10, %60 ], [ 10, %68 ], [ 10, %93 ], [ 10, %99 ], [ 10, %115 ], [ 10, %124 ], [ 10, %128 ], [ 10, %137 ], [ 10, %64 ]
  %152 = phi i8* [ %33, %37 ], [ %33, %45 ], [ %33, %49 ], [ %51, %53 ], [ %33, %41 ], [ %33, %60 ], [ %62, %68 ], [ %96, %93 ], [ %100, %99 ], [ %117, %115 ], [ %125, %124 ], [ %134, %128 ], [ %143, %137 ], [ %33, %64 ]
  %153 = phi %struct.iphdr* [ undef, %37 ], [ undef, %45 ], [ undef, %49 ], [ %54, %53 ], [ undef, %41 ], [ undef, %60 ], [ %69, %68 ], [ %69, %93 ], [ %69, %99 ], [ %69, %115 ], [ %69, %124 ], [ %69, %128 ], [ %69, %137 ], [ undef, %64 ]
  %154 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 2, !dbg !800
  store i16 %147, i16* %154, align 4, !dbg !800, !tbaa !801
  call void @llvm.dbg.value(metadata %struct.iphdr* %153, metadata !494, metadata !DIExpression()), !dbg !616
  %155 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 3), align 1, !dbg !802, !tbaa !804, !range !806
  %156 = icmp ne i8 %155, 0, !dbg !802
  %157 = icmp eq i16 %147, 6
  %158 = and i1 %156, %157, !dbg !807
  br i1 %158, label %159, label %501, !dbg !807

159:                                              ; preds = %146
  %160 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 0, i32 1, !dbg !808
  %161 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 1, i32 1, !dbg !809
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !810, metadata !DIExpression()) #6, !dbg !823
  call void @llvm.dbg.value(metadata %struct.tcphdr** undef, metadata !818, metadata !DIExpression()) #6, !dbg !823
  call void @llvm.dbg.value(metadata i16* %160, metadata !819, metadata !DIExpression()) #6, !dbg !823
  call void @llvm.dbg.value(metadata i16* %161, metadata !820, metadata !DIExpression()) #6, !dbg !823
  call void @llvm.dbg.value(metadata %struct.protocol_info* undef, metadata !821, metadata !DIExpression()) #6, !dbg !823
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !825, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)) #6, !dbg !834
  call void @llvm.dbg.value(metadata i8* %7, metadata !830, metadata !DIExpression()) #6, !dbg !834
  call void @llvm.dbg.value(metadata %struct.tcphdr** undef, metadata !831, metadata !DIExpression()) #6, !dbg !834
  %162 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 2, i32 0, !dbg !837
  call void @llvm.dbg.value(metadata i8* %152, metadata !833, metadata !DIExpression()) #6, !dbg !834
  %163 = getelementptr inbounds i8, i8* %152, i64 20, !dbg !838
  %164 = icmp ugt i8* %163, %7, !dbg !840
  br i1 %164, label %663, label %165, !dbg !841

165:                                              ; preds = %159
  %166 = getelementptr inbounds i8, i8* %152, i64 12, !dbg !842
  %167 = bitcast i8* %166 to i16*, !dbg !842
  %168 = load i16, i16* %167, align 4, !dbg !842
  %169 = lshr i16 %168, 2, !dbg !843
  %170 = and i16 %169, 60, !dbg !843
  call void @llvm.dbg.value(metadata i16 %170, metadata !832, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !834
  %171 = icmp ult i16 %170, 20, !dbg !844
  br i1 %171, label %663, label %172, !dbg !846

172:                                              ; preds = %165
  %173 = zext i16 %170 to i64
  %174 = getelementptr i8, i8* %152, i64 %173, !dbg !847
  %175 = icmp ugt i8* %174, %7, !dbg !849
  br i1 %175, label %663, label %176, !dbg !850

176:                                              ; preds = %172
  store i8* %174, i8** %162, align 8, !dbg !851, !tbaa !460
  %177 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 6), align 4, !dbg !852, !tbaa !854, !range !806
  %178 = icmp eq i8 %177, 0, !dbg !852
  %179 = load i16, i16* %167, align 4, !dbg !823
  %180 = and i16 %179, 512
  %181 = icmp eq i16 %180, 0
  %182 = or i1 %178, %181, !dbg !855
  call void @llvm.dbg.value(metadata i8* %152, metadata !822, metadata !DIExpression()) #6, !dbg !823
  br i1 %182, label %183, label %663, !dbg !855

183:                                              ; preds = %176
  call void @llvm.dbg.value(metadata i8* %152, metadata !822, metadata !DIExpression()) #6, !dbg !823
  call void @llvm.dbg.value(metadata i8* %152, metadata !856, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %7, metadata !861, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i32* undef, metadata !862, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i32* undef, metadata !863, metadata !DIExpression()) #6, !dbg !871
  %184 = lshr i16 %179, 2, !dbg !874
  %185 = and i16 %184, 60, !dbg !874
  call void @llvm.dbg.value(metadata i16 %185, metadata !864, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !871
  %186 = zext i16 %185 to i64
  %187 = getelementptr i8, i8* %152, i64 %186, !dbg !875
  call void @llvm.dbg.value(metadata i8* %187, metadata !865, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %163, metadata !866, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %3), !dbg !876
  call void @llvm.dbg.declare(metadata i8* %3, metadata !869, metadata !DIExpression()) #6, !dbg !877
  %188 = icmp ult i16 %185, 21
  br i1 %188, label %454, label %189, !dbg !878

189:                                              ; preds = %183
  call void @llvm.dbg.value(metadata i8 0, metadata !867, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %163, metadata !866, metadata !DIExpression()) #6, !dbg !871
  %190 = getelementptr inbounds i8, i8* %152, i64 21, !dbg !880
  %191 = icmp ugt i8* %190, %187, !dbg !885
  %192 = icmp ugt i8* %190, %7
  %193 = or i1 %192, %191, !dbg !886
  br i1 %193, label %454, label %194, !dbg !886

194:                                              ; preds = %189
  %195 = load i8, i8* %163, align 1, !dbg !887, !tbaa !888
  call void @llvm.dbg.value(metadata i8 %195, metadata !868, metadata !DIExpression()) #6, !dbg !871
  switch i8 %195, label %196 [
    i8 0, label %454
    i8 1, label %221
  ], !dbg !889

196:                                              ; preds = %194
  %197 = getelementptr inbounds i8, i8* %152, i64 22, !dbg !890
  %198 = icmp ult i8* %187, %197, !dbg !892
  %199 = icmp ugt i8* %197, %7
  %200 = or i1 %199, %198, !dbg !893
  br i1 %200, label %454, label %201, !dbg !893

201:                                              ; preds = %196
  %202 = load i8, i8* %190, align 1, !dbg !894, !tbaa !888
  store volatile i8 %202, i8* %3, align 1, !dbg !895, !tbaa !888
  %203 = load volatile i8, i8* %3, align 1, !dbg !896, !tbaa !888
  %204 = icmp ult i8 %203, 2, !dbg !898
  br i1 %204, label %454, label %205, !dbg !899

205:                                              ; preds = %201
  %206 = icmp eq i8 %195, 8, !dbg !900
  br i1 %206, label %207, label %217, !dbg !902

207:                                              ; preds = %205
  %208 = load volatile i8, i8* %3, align 1, !dbg !903, !tbaa !888
  %209 = icmp eq i8 %208, 10, !dbg !904
  br i1 %209, label %210, label %217, !dbg !905

210:                                              ; preds = %449, %422, %396, %370, %344, %318, %292, %266, %240, %207
  %211 = phi i8* [ %163, %207 ], [ %222, %240 ], [ %248, %266 ], [ %274, %292 ], [ %300, %318 ], [ %326, %344 ], [ %352, %370 ], [ %378, %396 ], [ %404, %422 ], [ %430, %449 ]
  %212 = phi i8* [ %197, %207 ], [ %230, %240 ], [ %256, %266 ], [ %282, %292 ], [ %308, %318 ], [ %334, %344 ], [ %360, %370 ], [ %386, %396 ], [ %412, %422 ], [ %439, %449 ], !dbg !890
  %213 = getelementptr inbounds i8, i8* %211, i64 10, !dbg !906
  %214 = icmp ugt i8* %213, %187, !dbg !909
  %215 = icmp ugt i8* %213, %7
  %216 = or i1 %214, %215, !dbg !910
  br i1 %216, label %454, label %455, !dbg !910

217:                                              ; preds = %207, %205
  %218 = load volatile i8, i8* %3, align 1, !dbg !911, !tbaa !888
  %219 = zext i8 %218 to i64, !dbg !912
  %220 = getelementptr inbounds i8, i8* %163, i64 %219, !dbg !912
  call void @llvm.dbg.value(metadata i8* %220, metadata !866, metadata !DIExpression()) #6, !dbg !871
  br label %221, !dbg !913

221:                                              ; preds = %217, %194
  %222 = phi i8* [ %220, %217 ], [ %190, %194 ], !dbg !914
  call void @llvm.dbg.value(metadata i8 1, metadata !867, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %222, metadata !866, metadata !DIExpression()) #6, !dbg !871
  %223 = getelementptr inbounds i8, i8* %222, i64 1, !dbg !880
  %224 = icmp ugt i8* %223, %187, !dbg !885
  %225 = icmp ugt i8* %223, %7
  %226 = or i1 %224, %225, !dbg !886
  br i1 %226, label %454, label %227, !dbg !886

227:                                              ; preds = %221
  %228 = load i8, i8* %222, align 1, !dbg !887, !tbaa !888
  call void @llvm.dbg.value(metadata i8 %228, metadata !868, metadata !DIExpression()) #6, !dbg !871
  switch i8 %228, label %229 [
    i8 0, label %454
    i8 1, label %247
  ], !dbg !889

229:                                              ; preds = %227
  %230 = getelementptr inbounds i8, i8* %222, i64 2, !dbg !890
  %231 = icmp ugt i8* %230, %187, !dbg !892
  %232 = icmp ugt i8* %230, %7
  %233 = or i1 %231, %232, !dbg !893
  br i1 %233, label %454, label %234, !dbg !893

234:                                              ; preds = %229
  %235 = load i8, i8* %223, align 1, !dbg !894, !tbaa !888
  store volatile i8 %235, i8* %3, align 1, !dbg !895, !tbaa !888
  %236 = load volatile i8, i8* %3, align 1, !dbg !896, !tbaa !888
  %237 = icmp ult i8 %236, 2, !dbg !898
  br i1 %237, label %454, label %238, !dbg !899

238:                                              ; preds = %234
  %239 = icmp eq i8 %228, 8, !dbg !900
  br i1 %239, label %240, label %243, !dbg !902

240:                                              ; preds = %238
  %241 = load volatile i8, i8* %3, align 1, !dbg !903, !tbaa !888
  %242 = icmp eq i8 %241, 10, !dbg !904
  br i1 %242, label %210, label %243, !dbg !905

243:                                              ; preds = %240, %238
  %244 = load volatile i8, i8* %3, align 1, !dbg !911, !tbaa !888
  %245 = zext i8 %244 to i64, !dbg !912
  %246 = getelementptr inbounds i8, i8* %222, i64 %245, !dbg !912
  call void @llvm.dbg.value(metadata i8* %246, metadata !866, metadata !DIExpression()) #6, !dbg !871
  br label %247, !dbg !913

247:                                              ; preds = %243, %227
  %248 = phi i8* [ %246, %243 ], [ %223, %227 ], !dbg !914
  call void @llvm.dbg.value(metadata i8 2, metadata !867, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %248, metadata !866, metadata !DIExpression()) #6, !dbg !871
  %249 = getelementptr inbounds i8, i8* %248, i64 1, !dbg !880
  %250 = icmp ugt i8* %249, %187, !dbg !885
  %251 = icmp ugt i8* %249, %7
  %252 = or i1 %250, %251, !dbg !886
  br i1 %252, label %454, label %253, !dbg !886

253:                                              ; preds = %247
  %254 = load i8, i8* %248, align 1, !dbg !887, !tbaa !888
  call void @llvm.dbg.value(metadata i8 %254, metadata !868, metadata !DIExpression()) #6, !dbg !871
  switch i8 %254, label %255 [
    i8 0, label %454
    i8 1, label %273
  ], !dbg !889

255:                                              ; preds = %253
  %256 = getelementptr inbounds i8, i8* %248, i64 2, !dbg !890
  %257 = icmp ugt i8* %256, %187, !dbg !892
  %258 = icmp ugt i8* %256, %7
  %259 = or i1 %257, %258, !dbg !893
  br i1 %259, label %454, label %260, !dbg !893

260:                                              ; preds = %255
  %261 = load i8, i8* %249, align 1, !dbg !894, !tbaa !888
  store volatile i8 %261, i8* %3, align 1, !dbg !895, !tbaa !888
  %262 = load volatile i8, i8* %3, align 1, !dbg !896, !tbaa !888
  %263 = icmp ult i8 %262, 2, !dbg !898
  br i1 %263, label %454, label %264, !dbg !899

264:                                              ; preds = %260
  %265 = icmp eq i8 %254, 8, !dbg !900
  br i1 %265, label %266, label %269, !dbg !902

266:                                              ; preds = %264
  %267 = load volatile i8, i8* %3, align 1, !dbg !903, !tbaa !888
  %268 = icmp eq i8 %267, 10, !dbg !904
  br i1 %268, label %210, label %269, !dbg !905

269:                                              ; preds = %266, %264
  %270 = load volatile i8, i8* %3, align 1, !dbg !911, !tbaa !888
  %271 = zext i8 %270 to i64, !dbg !912
  %272 = getelementptr inbounds i8, i8* %248, i64 %271, !dbg !912
  call void @llvm.dbg.value(metadata i8* %272, metadata !866, metadata !DIExpression()) #6, !dbg !871
  br label %273, !dbg !913

273:                                              ; preds = %269, %253
  %274 = phi i8* [ %272, %269 ], [ %249, %253 ], !dbg !914
  call void @llvm.dbg.value(metadata i8 3, metadata !867, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %274, metadata !866, metadata !DIExpression()) #6, !dbg !871
  %275 = getelementptr inbounds i8, i8* %274, i64 1, !dbg !880
  %276 = icmp ugt i8* %275, %187, !dbg !885
  %277 = icmp ugt i8* %275, %7
  %278 = or i1 %276, %277, !dbg !886
  br i1 %278, label %454, label %279, !dbg !886

279:                                              ; preds = %273
  %280 = load i8, i8* %274, align 1, !dbg !887, !tbaa !888
  call void @llvm.dbg.value(metadata i8 %280, metadata !868, metadata !DIExpression()) #6, !dbg !871
  switch i8 %280, label %281 [
    i8 0, label %454
    i8 1, label %299
  ], !dbg !889

281:                                              ; preds = %279
  %282 = getelementptr inbounds i8, i8* %274, i64 2, !dbg !890
  %283 = icmp ugt i8* %282, %187, !dbg !892
  %284 = icmp ugt i8* %282, %7
  %285 = or i1 %283, %284, !dbg !893
  br i1 %285, label %454, label %286, !dbg !893

286:                                              ; preds = %281
  %287 = load i8, i8* %275, align 1, !dbg !894, !tbaa !888
  store volatile i8 %287, i8* %3, align 1, !dbg !895, !tbaa !888
  %288 = load volatile i8, i8* %3, align 1, !dbg !896, !tbaa !888
  %289 = icmp ult i8 %288, 2, !dbg !898
  br i1 %289, label %454, label %290, !dbg !899

290:                                              ; preds = %286
  %291 = icmp eq i8 %280, 8, !dbg !900
  br i1 %291, label %292, label %295, !dbg !902

292:                                              ; preds = %290
  %293 = load volatile i8, i8* %3, align 1, !dbg !903, !tbaa !888
  %294 = icmp eq i8 %293, 10, !dbg !904
  br i1 %294, label %210, label %295, !dbg !905

295:                                              ; preds = %292, %290
  %296 = load volatile i8, i8* %3, align 1, !dbg !911, !tbaa !888
  %297 = zext i8 %296 to i64, !dbg !912
  %298 = getelementptr inbounds i8, i8* %274, i64 %297, !dbg !912
  call void @llvm.dbg.value(metadata i8* %298, metadata !866, metadata !DIExpression()) #6, !dbg !871
  br label %299, !dbg !913

299:                                              ; preds = %295, %279
  %300 = phi i8* [ %298, %295 ], [ %275, %279 ], !dbg !914
  call void @llvm.dbg.value(metadata i8 4, metadata !867, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %300, metadata !866, metadata !DIExpression()) #6, !dbg !871
  %301 = getelementptr inbounds i8, i8* %300, i64 1, !dbg !880
  %302 = icmp ugt i8* %301, %187, !dbg !885
  %303 = icmp ugt i8* %301, %7
  %304 = or i1 %302, %303, !dbg !886
  br i1 %304, label %454, label %305, !dbg !886

305:                                              ; preds = %299
  %306 = load i8, i8* %300, align 1, !dbg !887, !tbaa !888
  call void @llvm.dbg.value(metadata i8 %306, metadata !868, metadata !DIExpression()) #6, !dbg !871
  switch i8 %306, label %307 [
    i8 0, label %454
    i8 1, label %325
  ], !dbg !889

307:                                              ; preds = %305
  %308 = getelementptr inbounds i8, i8* %300, i64 2, !dbg !890
  %309 = icmp ugt i8* %308, %187, !dbg !892
  %310 = icmp ugt i8* %308, %7
  %311 = or i1 %309, %310, !dbg !893
  br i1 %311, label %454, label %312, !dbg !893

312:                                              ; preds = %307
  %313 = load i8, i8* %301, align 1, !dbg !894, !tbaa !888
  store volatile i8 %313, i8* %3, align 1, !dbg !895, !tbaa !888
  %314 = load volatile i8, i8* %3, align 1, !dbg !896, !tbaa !888
  %315 = icmp ult i8 %314, 2, !dbg !898
  br i1 %315, label %454, label %316, !dbg !899

316:                                              ; preds = %312
  %317 = icmp eq i8 %306, 8, !dbg !900
  br i1 %317, label %318, label %321, !dbg !902

318:                                              ; preds = %316
  %319 = load volatile i8, i8* %3, align 1, !dbg !903, !tbaa !888
  %320 = icmp eq i8 %319, 10, !dbg !904
  br i1 %320, label %210, label %321, !dbg !905

321:                                              ; preds = %318, %316
  %322 = load volatile i8, i8* %3, align 1, !dbg !911, !tbaa !888
  %323 = zext i8 %322 to i64, !dbg !912
  %324 = getelementptr inbounds i8, i8* %300, i64 %323, !dbg !912
  call void @llvm.dbg.value(metadata i8* %324, metadata !866, metadata !DIExpression()) #6, !dbg !871
  br label %325, !dbg !913

325:                                              ; preds = %321, %305
  %326 = phi i8* [ %324, %321 ], [ %301, %305 ], !dbg !914
  call void @llvm.dbg.value(metadata i8 5, metadata !867, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %326, metadata !866, metadata !DIExpression()) #6, !dbg !871
  %327 = getelementptr inbounds i8, i8* %326, i64 1, !dbg !880
  %328 = icmp ugt i8* %327, %187, !dbg !885
  %329 = icmp ugt i8* %327, %7
  %330 = or i1 %328, %329, !dbg !886
  br i1 %330, label %454, label %331, !dbg !886

331:                                              ; preds = %325
  %332 = load i8, i8* %326, align 1, !dbg !887, !tbaa !888
  call void @llvm.dbg.value(metadata i8 %332, metadata !868, metadata !DIExpression()) #6, !dbg !871
  switch i8 %332, label %333 [
    i8 0, label %454
    i8 1, label %351
  ], !dbg !889

333:                                              ; preds = %331
  %334 = getelementptr inbounds i8, i8* %326, i64 2, !dbg !890
  %335 = icmp ugt i8* %334, %187, !dbg !892
  %336 = icmp ugt i8* %334, %7
  %337 = or i1 %335, %336, !dbg !893
  br i1 %337, label %454, label %338, !dbg !893

338:                                              ; preds = %333
  %339 = load i8, i8* %327, align 1, !dbg !894, !tbaa !888
  store volatile i8 %339, i8* %3, align 1, !dbg !895, !tbaa !888
  %340 = load volatile i8, i8* %3, align 1, !dbg !896, !tbaa !888
  %341 = icmp ult i8 %340, 2, !dbg !898
  br i1 %341, label %454, label %342, !dbg !899

342:                                              ; preds = %338
  %343 = icmp eq i8 %332, 8, !dbg !900
  br i1 %343, label %344, label %347, !dbg !902

344:                                              ; preds = %342
  %345 = load volatile i8, i8* %3, align 1, !dbg !903, !tbaa !888
  %346 = icmp eq i8 %345, 10, !dbg !904
  br i1 %346, label %210, label %347, !dbg !905

347:                                              ; preds = %344, %342
  %348 = load volatile i8, i8* %3, align 1, !dbg !911, !tbaa !888
  %349 = zext i8 %348 to i64, !dbg !912
  %350 = getelementptr inbounds i8, i8* %326, i64 %349, !dbg !912
  call void @llvm.dbg.value(metadata i8* %350, metadata !866, metadata !DIExpression()) #6, !dbg !871
  br label %351, !dbg !913

351:                                              ; preds = %347, %331
  %352 = phi i8* [ %350, %347 ], [ %327, %331 ], !dbg !914
  call void @llvm.dbg.value(metadata i8 6, metadata !867, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %352, metadata !866, metadata !DIExpression()) #6, !dbg !871
  %353 = getelementptr inbounds i8, i8* %352, i64 1, !dbg !880
  %354 = icmp ugt i8* %353, %187, !dbg !885
  %355 = icmp ugt i8* %353, %7
  %356 = or i1 %354, %355, !dbg !886
  br i1 %356, label %454, label %357, !dbg !886

357:                                              ; preds = %351
  %358 = load i8, i8* %352, align 1, !dbg !887, !tbaa !888
  call void @llvm.dbg.value(metadata i8 %358, metadata !868, metadata !DIExpression()) #6, !dbg !871
  switch i8 %358, label %359 [
    i8 0, label %454
    i8 1, label %377
  ], !dbg !889

359:                                              ; preds = %357
  %360 = getelementptr inbounds i8, i8* %352, i64 2, !dbg !890
  %361 = icmp ugt i8* %360, %187, !dbg !892
  %362 = icmp ugt i8* %360, %7
  %363 = or i1 %361, %362, !dbg !893
  br i1 %363, label %454, label %364, !dbg !893

364:                                              ; preds = %359
  %365 = load i8, i8* %353, align 1, !dbg !894, !tbaa !888
  store volatile i8 %365, i8* %3, align 1, !dbg !895, !tbaa !888
  %366 = load volatile i8, i8* %3, align 1, !dbg !896, !tbaa !888
  %367 = icmp ult i8 %366, 2, !dbg !898
  br i1 %367, label %454, label %368, !dbg !899

368:                                              ; preds = %364
  %369 = icmp eq i8 %358, 8, !dbg !900
  br i1 %369, label %370, label %373, !dbg !902

370:                                              ; preds = %368
  %371 = load volatile i8, i8* %3, align 1, !dbg !903, !tbaa !888
  %372 = icmp eq i8 %371, 10, !dbg !904
  br i1 %372, label %210, label %373, !dbg !905

373:                                              ; preds = %370, %368
  %374 = load volatile i8, i8* %3, align 1, !dbg !911, !tbaa !888
  %375 = zext i8 %374 to i64, !dbg !912
  %376 = getelementptr inbounds i8, i8* %352, i64 %375, !dbg !912
  call void @llvm.dbg.value(metadata i8* %376, metadata !866, metadata !DIExpression()) #6, !dbg !871
  br label %377, !dbg !913

377:                                              ; preds = %373, %357
  %378 = phi i8* [ %376, %373 ], [ %353, %357 ], !dbg !914
  call void @llvm.dbg.value(metadata i8 7, metadata !867, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %378, metadata !866, metadata !DIExpression()) #6, !dbg !871
  %379 = getelementptr inbounds i8, i8* %378, i64 1, !dbg !880
  %380 = icmp ugt i8* %379, %187, !dbg !885
  %381 = icmp ugt i8* %379, %7
  %382 = or i1 %380, %381, !dbg !886
  br i1 %382, label %454, label %383, !dbg !886

383:                                              ; preds = %377
  %384 = load i8, i8* %378, align 1, !dbg !887, !tbaa !888
  call void @llvm.dbg.value(metadata i8 %384, metadata !868, metadata !DIExpression()) #6, !dbg !871
  switch i8 %384, label %385 [
    i8 0, label %454
    i8 1, label %403
  ], !dbg !889

385:                                              ; preds = %383
  %386 = getelementptr inbounds i8, i8* %378, i64 2, !dbg !890
  %387 = icmp ugt i8* %386, %187, !dbg !892
  %388 = icmp ugt i8* %386, %7
  %389 = or i1 %387, %388, !dbg !893
  br i1 %389, label %454, label %390, !dbg !893

390:                                              ; preds = %385
  %391 = load i8, i8* %379, align 1, !dbg !894, !tbaa !888
  store volatile i8 %391, i8* %3, align 1, !dbg !895, !tbaa !888
  %392 = load volatile i8, i8* %3, align 1, !dbg !896, !tbaa !888
  %393 = icmp ult i8 %392, 2, !dbg !898
  br i1 %393, label %454, label %394, !dbg !899

394:                                              ; preds = %390
  %395 = icmp eq i8 %384, 8, !dbg !900
  br i1 %395, label %396, label %399, !dbg !902

396:                                              ; preds = %394
  %397 = load volatile i8, i8* %3, align 1, !dbg !903, !tbaa !888
  %398 = icmp eq i8 %397, 10, !dbg !904
  br i1 %398, label %210, label %399, !dbg !905

399:                                              ; preds = %396, %394
  %400 = load volatile i8, i8* %3, align 1, !dbg !911, !tbaa !888
  %401 = zext i8 %400 to i64, !dbg !912
  %402 = getelementptr inbounds i8, i8* %378, i64 %401, !dbg !912
  call void @llvm.dbg.value(metadata i8* %402, metadata !866, metadata !DIExpression()) #6, !dbg !871
  br label %403, !dbg !913

403:                                              ; preds = %399, %383
  %404 = phi i8* [ %402, %399 ], [ %379, %383 ], !dbg !914
  call void @llvm.dbg.value(metadata i8 8, metadata !867, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %404, metadata !866, metadata !DIExpression()) #6, !dbg !871
  %405 = getelementptr inbounds i8, i8* %404, i64 1, !dbg !880
  %406 = icmp ugt i8* %405, %187, !dbg !885
  %407 = icmp ugt i8* %405, %7
  %408 = or i1 %406, %407, !dbg !886
  br i1 %408, label %454, label %409, !dbg !886

409:                                              ; preds = %403
  %410 = load i8, i8* %404, align 1, !dbg !887, !tbaa !888
  call void @llvm.dbg.value(metadata i8 %410, metadata !868, metadata !DIExpression()) #6, !dbg !871
  switch i8 %410, label %411 [
    i8 0, label %454
    i8 1, label %429
  ], !dbg !889

411:                                              ; preds = %409
  %412 = getelementptr inbounds i8, i8* %404, i64 2, !dbg !890
  %413 = icmp ugt i8* %412, %187, !dbg !892
  %414 = icmp ugt i8* %412, %7
  %415 = or i1 %413, %414, !dbg !893
  br i1 %415, label %454, label %416, !dbg !893

416:                                              ; preds = %411
  %417 = load i8, i8* %405, align 1, !dbg !894, !tbaa !888
  store volatile i8 %417, i8* %3, align 1, !dbg !895, !tbaa !888
  %418 = load volatile i8, i8* %3, align 1, !dbg !896, !tbaa !888
  %419 = icmp ult i8 %418, 2, !dbg !898
  br i1 %419, label %454, label %420, !dbg !899

420:                                              ; preds = %416
  %421 = icmp eq i8 %410, 8, !dbg !900
  br i1 %421, label %422, label %425, !dbg !902

422:                                              ; preds = %420
  %423 = load volatile i8, i8* %3, align 1, !dbg !903, !tbaa !888
  %424 = icmp eq i8 %423, 10, !dbg !904
  br i1 %424, label %210, label %425, !dbg !905

425:                                              ; preds = %422, %420
  %426 = load volatile i8, i8* %3, align 1, !dbg !911, !tbaa !888
  %427 = zext i8 %426 to i64, !dbg !912
  %428 = getelementptr inbounds i8, i8* %404, i64 %427, !dbg !912
  call void @llvm.dbg.value(metadata i8* %428, metadata !866, metadata !DIExpression()) #6, !dbg !871
  br label %429, !dbg !913

429:                                              ; preds = %425, %409
  %430 = phi i8* [ %428, %425 ], [ %405, %409 ], !dbg !914
  call void @llvm.dbg.value(metadata i8 9, metadata !867, metadata !DIExpression()) #6, !dbg !871
  call void @llvm.dbg.value(metadata i8* %430, metadata !866, metadata !DIExpression()) #6, !dbg !871
  %431 = getelementptr inbounds i8, i8* %430, i64 1, !dbg !880
  %432 = icmp ugt i8* %431, %187, !dbg !885
  %433 = icmp ugt i8* %431, %7
  %434 = or i1 %432, %433, !dbg !886
  br i1 %434, label %454, label %435, !dbg !886

435:                                              ; preds = %429
  %436 = load i8, i8* %430, align 1, !dbg !887, !tbaa !888
  call void @llvm.dbg.value(metadata i8 %436, metadata !868, metadata !DIExpression()) #6, !dbg !871
  %437 = icmp ult i8 %436, 2, !dbg !889
  br i1 %437, label %454, label %438, !dbg !889

438:                                              ; preds = %435
  %439 = getelementptr inbounds i8, i8* %430, i64 2, !dbg !890
  %440 = icmp ugt i8* %439, %187, !dbg !892
  %441 = icmp ugt i8* %439, %7
  %442 = or i1 %440, %441, !dbg !893
  br i1 %442, label %454, label %443, !dbg !893

443:                                              ; preds = %438
  %444 = load i8, i8* %431, align 1, !dbg !894, !tbaa !888
  store volatile i8 %444, i8* %3, align 1, !dbg !895, !tbaa !888
  %445 = load volatile i8, i8* %3, align 1, !dbg !896, !tbaa !888
  %446 = icmp ult i8 %445, 2, !dbg !898
  br i1 %446, label %454, label %447, !dbg !899

447:                                              ; preds = %443
  %448 = icmp eq i8 %436, 8, !dbg !900
  br i1 %448, label %449, label %452, !dbg !902

449:                                              ; preds = %447
  %450 = load volatile i8, i8* %3, align 1, !dbg !903, !tbaa !888
  %451 = icmp eq i8 %450, 10, !dbg !904
  br i1 %451, label %210, label %452, !dbg !905

452:                                              ; preds = %449, %447
  %453 = load volatile i8, i8* %3, align 1, !dbg !911, !tbaa !888
  call void @llvm.dbg.value(metadata i8* undef, metadata !866, metadata !DIExpression()) #6, !dbg !871
  br label %454, !dbg !913

454:                                              ; preds = %452, %443, %438, %435, %429, %416, %411, %409, %403, %390, %385, %383, %377, %364, %359, %357, %351, %338, %333, %331, %325, %312, %307, %305, %299, %286, %281, %279, %273, %260, %255, %253, %247, %234, %229, %227, %221, %210, %201, %196, %194, %189, %183
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %3), !dbg !915
  br label %663, !dbg !916

455:                                              ; preds = %210
  %456 = bitcast i8* %212 to i32*, !dbg !917
  %457 = load i32, i32* %456, align 4, !dbg !917, !tbaa !918
  %458 = tail call i32 @llvm.bswap.i32(i32 %457) #6, !dbg !917
  call void @llvm.dbg.value(metadata i32 %458, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !616
  %459 = getelementptr inbounds i8, i8* %211, i64 6, !dbg !919
  %460 = bitcast i8* %459 to i32*, !dbg !919
  %461 = load i32, i32* %460, align 4, !dbg !919, !tbaa !918
  %462 = tail call i32 @llvm.bswap.i32(i32 %461) #6, !dbg !919
  call void @llvm.dbg.value(metadata i32 %462, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !616
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %3), !dbg !915
  %463 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 0, !dbg !920
  %464 = load i8*, i8** %463, align 8, !dbg !920, !tbaa !450
  %465 = ptrtoint i8* %174 to i64, !dbg !921
  %466 = ptrtoint i8* %464 to i64, !dbg !921
  %467 = sub i64 %465, %466, !dbg !921
  %468 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 3, !dbg !922
  %469 = load i32, i32* %468, align 8, !dbg !922, !tbaa !463
  %470 = zext i32 %469 to i64, !dbg !923
  %471 = icmp slt i64 %467, %470, !dbg !924
  %472 = icmp ne i16 %180, 0
  %473 = or i1 %471, %472, !dbg !925
  %474 = zext i1 %473 to i8, !dbg !926
  call void @llvm.dbg.value(metadata i8 %474, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8* %152, metadata !822, metadata !DIExpression()) #6, !dbg !823
  %475 = lshr i16 %179, 12, !dbg !927
  %476 = trunc i16 %475 to i8, !dbg !927
  %477 = and i8 %476, 1, !dbg !927
  call void @llvm.dbg.value(metadata i8 %477, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !616
  %478 = and i16 %179, 1024, !dbg !928
  %479 = icmp eq i16 %478, 0, !dbg !928
  br i1 %479, label %480, label %492, !dbg !930

480:                                              ; preds = %455
  %481 = and i16 %179, 256, !dbg !931
  %482 = and i16 %179, 768, !dbg !933
  %483 = icmp eq i16 %482, 512, !dbg !933
  %484 = lshr exact i16 %481, 6, !dbg !933
  %485 = trunc i16 %484 to i8, !dbg !933
  %486 = lshr exact i16 %481, 7, !dbg !933
  %487 = trunc i16 %486 to i8, !dbg !933
  br i1 %483, label %488, label %492, !dbg !933

488:                                              ; preds = %480
  call void @llvm.dbg.value(metadata i8 1, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8* %152, metadata !822, metadata !DIExpression()) #6, !dbg !823
  %489 = and i16 %179, 4096, !dbg !934
  %490 = icmp eq i16 %489, 0, !dbg !934
  %491 = select i1 %490, i8 1, i8 2, !dbg !934
  call void @llvm.dbg.value(metadata i8 %491, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !616
  br label %492, !dbg !937

492:                                              ; preds = %480, %455, %488
  %493 = phi i8 [ 0, %488 ], [ undef, %455 ], [ 1, %480 ]
  %494 = phi i8 [ %491, %488 ], [ 5, %455 ], [ %485, %480 ], !dbg !938
  %495 = phi i8 [ 1, %488 ], [ 3, %455 ], [ %487, %480 ], !dbg !938
  call void @llvm.dbg.value(metadata i8 %495, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 %494, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 %493, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8* %152, metadata !822, metadata !DIExpression()) #6, !dbg !823
  %496 = bitcast i8* %152 to i16*, !dbg !939
  %497 = load i16, i16* %496, align 4, !dbg !939, !tbaa !940
  store i16 %497, i16* %160, align 2, !dbg !942, !tbaa !671
  %498 = getelementptr inbounds i8, i8* %152, i64 2, !dbg !943
  %499 = bitcast i8* %498 to i16*, !dbg !943
  %500 = load i16, i16* %499, align 2, !dbg !943, !tbaa !944
  store i16 %500, i16* %161, align 2, !dbg !945, !tbaa !671
  call void @llvm.dbg.value(metadata i8* %152, metadata !527, metadata !DIExpression()), !dbg !616
  br label %582, !dbg !946

501:                                              ; preds = %146
  %502 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 4), align 2, !dbg !947, !tbaa !949, !range !806
  %503 = icmp eq i8 %502, 0, !dbg !947
  %504 = icmp ne i16 %147, 58
  %505 = or i1 %503, %504, !dbg !950
  %506 = or i1 %505, %150, !dbg !950
  br i1 %506, label %541, label %507, !dbg !950

507:                                              ; preds = %501
  %508 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 0, i32 1, !dbg !951
  %509 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 1, i32 1, !dbg !952
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !953, metadata !DIExpression()), !dbg !964
  call void @llvm.dbg.value(metadata %struct.icmp6hdr** undef, metadata !959, metadata !DIExpression()), !dbg !964
  call void @llvm.dbg.value(metadata i16* %508, metadata !960, metadata !DIExpression()), !dbg !964
  call void @llvm.dbg.value(metadata i16* %509, metadata !961, metadata !DIExpression()), !dbg !964
  call void @llvm.dbg.value(metadata %struct.protocol_info* undef, metadata !962, metadata !DIExpression()), !dbg !964
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !966, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !974
  call void @llvm.dbg.value(metadata i8* undef, metadata !971, metadata !DIExpression()), !dbg !974
  call void @llvm.dbg.value(metadata %struct.icmp6hdr** undef, metadata !972, metadata !DIExpression()), !dbg !974
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %149, metadata !973, metadata !DIExpression()), !dbg !974
  %510 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %149, i64 1, !dbg !977
  %511 = icmp ugt %struct.icmp6hdr* %510, %12, !dbg !979
  br i1 %511, label %663, label %512, !dbg !980

512:                                              ; preds = %507
  %513 = getelementptr %struct.icmp6hdr, %struct.icmp6hdr* %510, i64 0, i32 0, !dbg !981
  store i8* %513, i8** %8, align 8, !dbg !982, !tbaa !460
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %149, metadata !963, metadata !DIExpression()), !dbg !964
  %514 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %149, i64 0, i32 1, !dbg !983
  %515 = load i8, i8* %514, align 1, !dbg !983, !tbaa !985
  %516 = icmp eq i8 %515, 0, !dbg !987
  br i1 %516, label %517, label %663, !dbg !988

517:                                              ; preds = %512
  %518 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %149, i64 0, i32 0, !dbg !989
  %519 = load i8, i8* %518, align 4, !dbg !989, !tbaa !991
  switch i8 %519, label %663 [
    i8 -128, label %520
    i8 -127, label %526
  ], !dbg !992

520:                                              ; preds = %517
  %521 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %149, i64 0, i32 3, !dbg !993
  %522 = bitcast %union.anon.13* %521 to %struct.icmpv6_echo*, !dbg !993
  %523 = getelementptr inbounds %struct.icmpv6_echo, %struct.icmpv6_echo* %522, i64 0, i32 1, !dbg !993
  %524 = load i16, i16* %523, align 2, !dbg !993, !tbaa !888
  %525 = zext i16 %524 to i32, !dbg !995
  call void @llvm.dbg.value(metadata i32 %525, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i8 1, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i32 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i8 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !616
  br label %532, !dbg !996

526:                                              ; preds = %517
  %527 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %149, i64 0, i32 3, !dbg !997
  %528 = bitcast %union.anon.13* %527 to %struct.icmpv6_echo*, !dbg !997
  %529 = getelementptr inbounds %struct.icmpv6_echo, %struct.icmpv6_echo* %528, i64 0, i32 1, !dbg !997
  %530 = load i16, i16* %529, align 2, !dbg !997, !tbaa !888
  %531 = zext i16 %530 to i32, !dbg !1000
  call void @llvm.dbg.value(metadata i32 %531, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i8 1, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i32 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i8 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !616
  br label %532

532:                                              ; preds = %526, %520
  %533 = phi i8 [ 1, %526 ], [ 0, %520 ], !dbg !1001
  %534 = phi i8 [ 0, %526 ], [ 1, %520 ], !dbg !1001
  %535 = phi i32 [ %531, %526 ], [ 0, %520 ], !dbg !1001
  %536 = phi i32 [ 0, %526 ], [ %525, %520 ], !dbg !1001
  call void @llvm.dbg.value(metadata i32 %536, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i32 %535, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i8 %534, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 %533, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !616
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %149, metadata !963, metadata !DIExpression()), !dbg !964
  %537 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %149, i64 0, i32 3, !dbg !1002
  %538 = bitcast %union.anon.13* %537 to i16*, !dbg !1002
  %539 = load i16, i16* %538, align 4, !dbg !1002, !tbaa !888
  store i16 %539, i16* %508, align 2, !dbg !1003, !tbaa !671
  %540 = load i16, i16* %538, align 4, !dbg !1004, !tbaa !888
  store i16 %540, i16* %509, align 2, !dbg !1005, !tbaa !671
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %149, metadata !527, metadata !DIExpression()), !dbg !616
  br label %582, !dbg !1006

541:                                              ; preds = %501
  %542 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 4), align 2, !dbg !1007, !tbaa !949, !range !806
  %543 = icmp eq i8 %542, 0, !dbg !1007
  %544 = icmp ne i16 %147, 1
  %545 = or i1 %543, %544, !dbg !1009
  %546 = xor i1 %150, true, !dbg !1009
  %547 = or i1 %545, %546, !dbg !1009
  br i1 %547, label %663, label %548, !dbg !1009

548:                                              ; preds = %541
  %549 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 0, i32 1, !dbg !1010
  %550 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 1, i32 1, !dbg !1011
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !1012, metadata !DIExpression()), !dbg !1023
  call void @llvm.dbg.value(metadata %struct.icmphdr** undef, metadata !1018, metadata !DIExpression()), !dbg !1023
  call void @llvm.dbg.value(metadata i16* %549, metadata !1019, metadata !DIExpression()), !dbg !1023
  call void @llvm.dbg.value(metadata i16* %550, metadata !1020, metadata !DIExpression()), !dbg !1023
  call void @llvm.dbg.value(metadata %struct.protocol_info* undef, metadata !1021, metadata !DIExpression()), !dbg !1023
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !1025, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !1033
  call void @llvm.dbg.value(metadata i8* undef, metadata !1030, metadata !DIExpression()), !dbg !1033
  call void @llvm.dbg.value(metadata %struct.icmphdr** undef, metadata !1031, metadata !DIExpression()), !dbg !1033
  call void @llvm.dbg.value(metadata %struct.icmphdr* %148, metadata !1032, metadata !DIExpression()), !dbg !1033
  %551 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %148, i64 1, !dbg !1036
  %552 = icmp ugt %struct.icmphdr* %551, %13, !dbg !1038
  br i1 %552, label %663, label %553, !dbg !1039

553:                                              ; preds = %548
  %554 = getelementptr %struct.icmphdr, %struct.icmphdr* %551, i64 0, i32 0, !dbg !1040
  store i8* %554, i8** %8, align 8, !dbg !1041, !tbaa !460
  call void @llvm.dbg.value(metadata %struct.icmphdr* %148, metadata !1022, metadata !DIExpression()), !dbg !1023
  %555 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %148, i64 0, i32 1, !dbg !1042
  %556 = load i8, i8* %555, align 1, !dbg !1042, !tbaa !1044
  %557 = icmp eq i8 %556, 0, !dbg !1046
  br i1 %557, label %558, label %663, !dbg !1047

558:                                              ; preds = %553
  %559 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %148, i64 0, i32 0, !dbg !1048
  %560 = load i8, i8* %559, align 4, !dbg !1048, !tbaa !1050
  switch i8 %560, label %663 [
    i8 8, label %561
    i8 0, label %567
  ], !dbg !1051

561:                                              ; preds = %558
  %562 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %148, i64 0, i32 3, !dbg !1052
  %563 = bitcast %union.anon.10* %562 to %struct.anon.11*, !dbg !1054
  %564 = getelementptr inbounds %struct.anon.11, %struct.anon.11* %563, i64 0, i32 1, !dbg !1055
  %565 = load i16, i16* %564, align 2, !dbg !1055, !tbaa !888
  %566 = zext i16 %565 to i32, !dbg !1056
  call void @llvm.dbg.value(metadata i32 %566, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i8 1, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i32 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i8 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !616
  br label %573, !dbg !1057

567:                                              ; preds = %558
  %568 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %148, i64 0, i32 3, !dbg !1058
  %569 = bitcast %union.anon.10* %568 to %struct.anon.11*, !dbg !1061
  %570 = getelementptr inbounds %struct.anon.11, %struct.anon.11* %569, i64 0, i32 1, !dbg !1062
  %571 = load i16, i16* %570, align 2, !dbg !1062, !tbaa !888
  %572 = zext i16 %571 to i32, !dbg !1063
  call void @llvm.dbg.value(metadata i32 %572, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i8 1, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i32 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i8 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !616
  br label %573

573:                                              ; preds = %567, %561
  %574 = phi i8 [ 1, %567 ], [ 0, %561 ], !dbg !1064
  %575 = phi i8 [ 0, %567 ], [ 1, %561 ], !dbg !1064
  %576 = phi i32 [ %572, %567 ], [ 0, %561 ], !dbg !1064
  %577 = phi i32 [ 0, %567 ], [ %566, %561 ], !dbg !1064
  call void @llvm.dbg.value(metadata i32 %577, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i32 %576, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i8 %575, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 %574, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 0, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !616
  call void @llvm.dbg.value(metadata %struct.icmphdr* %148, metadata !1022, metadata !DIExpression()), !dbg !1023
  %578 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %148, i64 0, i32 3, !dbg !1065
  %579 = bitcast %union.anon.10* %578 to i16*, !dbg !1066
  %580 = load i16, i16* %579, align 4, !dbg !1066, !tbaa !888
  store i16 %580, i16* %549, align 2, !dbg !1067, !tbaa !671
  %581 = load i16, i16* %579, align 4, !dbg !1068, !tbaa !888
  store i16 %581, i16* %550, align 2, !dbg !1069, !tbaa !671
  call void @llvm.dbg.value(metadata %struct.icmphdr* %148, metadata !527, metadata !DIExpression()), !dbg !616
  br label %582, !dbg !1070

582:                                              ; preds = %492, %532, %573
  %583 = phi i8 [ %493, %492 ], [ 0, %532 ], [ 0, %573 ]
  %584 = phi i8 [ %494, %492 ], [ 0, %532 ], [ 0, %573 ]
  %585 = phi i8 [ %495, %492 ], [ 0, %532 ], [ 0, %573 ]
  %586 = phi i8 [ %477, %492 ], [ %533, %532 ], [ %574, %573 ]
  %587 = phi i8 [ %474, %492 ], [ %534, %532 ], [ %575, %573 ]
  %588 = phi i32 [ %462, %492 ], [ %535, %532 ], [ %576, %573 ]
  %589 = phi i32 [ %458, %492 ], [ %536, %532 ], [ %577, %573 ]
  call void @llvm.dbg.value(metadata i32 %589, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i32 %588, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !616
  call void @llvm.dbg.value(metadata i8 %587, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 %586, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 %585, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 %584, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i8 %583, metadata !484, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !616
  call void @llvm.dbg.value(metadata i32 0, metadata !474, metadata !DIExpression()), !dbg !616
  %590 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 1, !dbg !1071
  store i32 %589, i32* %590, align 4, !dbg !1072, !tbaa !1073
  %591 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 9, !dbg !1074
  store i8 %587, i8* %591, align 8, !dbg !1075, !tbaa !1076
  %592 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 1, !dbg !1077
  store i32 %588, i32* %592, align 4, !dbg !1078, !tbaa !1079
  %593 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 10, !dbg !1080
  store i8 %586, i8* %593, align 1, !dbg !1081, !tbaa !1082
  %594 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 11, !dbg !1083
  store i8 %585, i8* %594, align 2, !dbg !1084, !tbaa !1085
  %595 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 12, !dbg !1086
  store i8 %584, i8* %595, align 1, !dbg !1087, !tbaa !1088
  %596 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 13, !dbg !1089
  store i8 %583, i8* %596, align 4, !dbg !1090, !tbaa !1091
  %597 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, !dbg !1092
  br i1 %150, label %598, label %621, !dbg !1094

598:                                              ; preds = %582
  %599 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %153, i64 0, i32 8, !dbg !1095
  %600 = load i32, i32* %599, align 4, !dbg !1095, !tbaa !1097
  call void @llvm.dbg.value(metadata %struct.network_tuple* %597, metadata !1098, metadata !DIExpression()) #6, !dbg !1104
  call void @llvm.dbg.value(metadata i32 %600, metadata !1103, metadata !DIExpression()) #6, !dbg !1104
  %601 = bitcast %struct.network_tuple* %597 to [16 x i8]*, !dbg !1106
  %602 = bitcast %struct.network_tuple* %597 to i8*, !dbg !1107
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(10) %602, i8 0, i64 10, i1 false) #6, !dbg !1108
  %603 = getelementptr inbounds [16 x i8], [16 x i8]* %601, i64 0, i64 10, !dbg !1109
  %604 = bitcast i8* %603 to i16*, !dbg !1110
  store i16 -1, i16* %604, align 2, !dbg !1110
  %605 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !1111
  store i32 %600, i32* %605, align 4, !dbg !1112, !tbaa !888
  %606 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 1, i32 0, !dbg !1113
  %607 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %153, i64 0, i32 9, !dbg !1114
  %608 = load i32, i32* %607, align 4, !dbg !1114, !tbaa !1115
  call void @llvm.dbg.value(metadata %struct.in6_addr* %606, metadata !1098, metadata !DIExpression()) #6, !dbg !1116
  call void @llvm.dbg.value(metadata i32 %608, metadata !1103, metadata !DIExpression()) #6, !dbg !1116
  %609 = bitcast %struct.in6_addr* %606 to [16 x i8]*, !dbg !1118
  %610 = bitcast %struct.in6_addr* %606 to i8*, !dbg !1119
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(10) %610, i8 0, i64 10, i1 false) #6, !dbg !1120
  %611 = getelementptr inbounds [16 x i8], [16 x i8]* %609, i64 0, i64 10, !dbg !1121
  %612 = bitcast i8* %611 to i16*, !dbg !1122
  store i16 -1, i16* %612, align 2, !dbg !1122
  %613 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 1, i32 0, i32 0, i32 0, i64 3, !dbg !1123
  store i32 %608, i32* %613, align 4, !dbg !1124, !tbaa !888
  %614 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %153, i64 0, i32 2, !dbg !1125
  %615 = load i16, i16* %614, align 2, !dbg !1125, !tbaa !1126
  %616 = tail call i16 @llvm.bswap.i16(i16 %615), !dbg !1125
  %617 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %153, i64 0, i32 1, !dbg !1127
  %618 = load i8, i8* %617, align 1, !dbg !1127, !tbaa !1128
  %619 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 5, !dbg !1129
  %620 = bitcast %union.anon.4* %619 to i8*, !dbg !1130
  store i8 %618, i8* %620, align 8, !dbg !1131, !tbaa !888
  br label %635, !dbg !1132

621:                                              ; preds = %582
  %622 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %153, i64 0, i32 5, !dbg !1133
  %623 = bitcast %struct.network_tuple* %597 to i8*, !dbg !1133
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %623, i8* nonnull align 4 dereferenceable(16) %622, i64 16, i1 false), !dbg !1133, !tbaa.struct !1135
  %624 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 1, i32 0, !dbg !1136
  %625 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %153, i64 1, i32 3, !dbg !1137
  %626 = bitcast %struct.in6_addr* %624 to i8*, !dbg !1137
  %627 = bitcast i16* %625 to i8*, !dbg !1137
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %626, i8* nonnull align 4 dereferenceable(16) %627, i64 16, i1 false), !dbg !1137, !tbaa.struct !1135
  %628 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %153, i64 0, i32 3, !dbg !1138
  %629 = load i16, i16* %628, align 4, !dbg !1138, !tbaa !1139
  %630 = tail call i16 @llvm.bswap.i16(i16 %629), !dbg !1138
  %631 = bitcast %struct.iphdr* %153 to i32*, !dbg !1140
  %632 = load i32, i32* %631, align 4, !dbg !1141, !tbaa !918
  %633 = and i32 %632, -241, !dbg !1142
  %634 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 5, i32 0, !dbg !1143
  store i32 %633, i32* %634, align 8, !dbg !1144, !tbaa !888
  br label %635

635:                                              ; preds = %621, %598
  %636 = phi i8* [ %623, %621 ], [ %602, %598 ], !dbg !1145
  %637 = phi i16 [ %630, %621 ], [ %616, %598 ], !dbg !1153
  %638 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 6, !dbg !1154
  store i16 %637, i16* %638, align 4, !dbg !1155
  %639 = tail call fastcc zeroext i1 @is_dualflow_key(%struct.network_tuple* nonnull %597), !dbg !1156
  %640 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 8, !dbg !1157
  %641 = zext i1 %639 to i8, !dbg !1158
  store i8 %641, i8* %640, align 1, !dbg !1158, !tbaa !1159
  %642 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, !dbg !1160
  call void @llvm.dbg.value(metadata %struct.network_tuple* %642, metadata !1150, metadata !DIExpression()) #6, !dbg !1161
  call void @llvm.dbg.value(metadata %struct.network_tuple* %597, metadata !1151, metadata !DIExpression()) #6, !dbg !1161
  %643 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 3, !dbg !1162
  store i8 %151, i8* %643, align 2, !dbg !1163, !tbaa !1164
  %644 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 2, !dbg !1165
  store i16 %147, i16* %644, align 4, !dbg !1166, !tbaa !1167
  %645 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 1, !dbg !1168
  %646 = bitcast %struct.network_tuple* %642 to i8*, !dbg !1168
  %647 = bitcast %struct.flow_address* %645 to i8*, !dbg !1168
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(20) %646, i8* nonnull align 4 dereferenceable(20) %647, i64 20, i1 false) #6, !dbg !1168, !tbaa.struct !1169
  %648 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 1, !dbg !1170
  %649 = bitcast %struct.flow_address* %648 to i8*, !dbg !1145
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(20) %649, i8* nonnull align 4 dereferenceable(20) %636, i64 20, i1 false) #6, !dbg !1145, !tbaa.struct !1169
  %650 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 4, !dbg !1171
  store i8 0, i8* %650, align 1, !dbg !1172, !tbaa !1173
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !1174, metadata !DIExpression()) #6, !dbg !1180
  %651 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 2, i32 0, !dbg !1182
  %652 = load i8*, i8** %651, align 8, !dbg !1182, !tbaa !1183
  %653 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 0, !dbg !1184
  %654 = load i8*, i8** %653, align 8, !dbg !1184, !tbaa !450
  %655 = ptrtoint i8* %652 to i64, !dbg !1185
  %656 = ptrtoint i8* %654 to i64, !dbg !1185
  %657 = sub i64 %655, %656, !dbg !1185
  %658 = trunc i64 %657 to i32, !dbg !1186
  call void @llvm.dbg.value(metadata i32 %658, metadata !1179, metadata !DIExpression()) #6, !dbg !1180
  %659 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 3, !dbg !1187
  %660 = load i32, i32* %659, align 8, !dbg !1187, !tbaa !463
  %661 = tail call i32 @llvm.usub.sat.i32(i32 %660, i32 %658) #6, !dbg !1188
  %662 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 1, !dbg !1189
  store i32 %661, i32* %662, align 8, !dbg !1190, !tbaa !1191
  br label %663, !dbg !1192

663:                                              ; preds = %541, %548, %558, %553, %507, %517, %512, %176, %172, %165, %159, %454, %2, %32, %635
  %664 = phi i32 [ 0, %635 ], [ -1, %32 ], [ -1, %541 ], [ -1, %2 ], [ -1, %454 ], [ -1, %159 ], [ -1, %165 ], [ -1, %172 ], [ -1, %176 ], [ -1, %512 ], [ -1, %517 ], [ -1, %507 ], [ -1, %553 ], [ -1, %558 ], [ -1, %548 ], !dbg !616
  ret i32 %664, !dbg !1193
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noinline nounwind
define dso_local i32 @parse_packet_identifer_xdp(%struct.xdp_md* nocapture readonly %0, %struct.packet_info* %1) local_unnamed_addr #0 !dbg !1194 {
  %3 = alloca %struct.parsing_context, align 8
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1207, metadata !DIExpression()), !dbg !1210
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1208, metadata !DIExpression()), !dbg !1210
  %4 = icmp eq %struct.packet_info* %1, null, !dbg !1211
  br i1 %4, label %21, label %5, !dbg !1213

5:                                                ; preds = %2
  %6 = bitcast %struct.parsing_context* %3 to i8*, !dbg !1214
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #6, !dbg !1214
  call void @llvm.dbg.declare(metadata %struct.parsing_context* %3, metadata !1209, metadata !DIExpression()), !dbg !1215
  %7 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 0, !dbg !1216
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !1217
  %9 = load i32, i32* %8, align 4, !dbg !1217, !tbaa !1218
  %10 = zext i32 %9 to i64, !dbg !1220
  %11 = inttoptr i64 %10 to i8*, !dbg !1221
  store i8* %11, i8** %7, align 8, !dbg !1216, !tbaa !450
  %12 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 1, !dbg !1216
  %13 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !1222
  %14 = load i32, i32* %13, align 4, !dbg !1222, !tbaa !1223
  %15 = zext i32 %14 to i64, !dbg !1224
  %16 = inttoptr i64 %15 to i8*, !dbg !1225
  store i8* %16, i8** %12, align 8, !dbg !1216, !tbaa !458
  %17 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 2, i32 0, !dbg !1226
  store i8* %11, i8** %17, align 8, !dbg !1226, !tbaa !460
  %18 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 3, !dbg !1216
  %19 = sub i32 %14, %9, !dbg !1227
  store i32 %19, i32* %18, align 8, !dbg !1216, !tbaa !463
  %20 = call fastcc i32 @parse_packet_identifier(%struct.parsing_context* nonnull %3, %struct.packet_info* nonnull %1), !dbg !1228
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #6, !dbg !1229
  br label %21

21:                                               ; preds = %2, %5
  %22 = phi i32 [ %20, %5 ], [ -1, %2 ], !dbg !1210
  ret i32 %22, !dbg !1229
}

; Function Attrs: nounwind
define dso_local i32 @pping_tc_egress(%struct.__sk_buff* %0) #3 section "tc" !dbg !1230 {
  %2 = alloca %struct.packet_info, align 8
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1234, metadata !DIExpression()), !dbg !1235
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1236, metadata !DIExpression()) #6, !dbg !1243
  call void @llvm.dbg.value(metadata i1 false, metadata !1241, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1243
  %3 = bitcast %struct.packet_info* %2 to i8*, !dbg !1245
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %3) #6, !dbg !1245
  call void @llvm.dbg.declare(metadata %struct.packet_info* %2, metadata !1242, metadata !DIExpression()) #6, !dbg !1246
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(128) %3, i8 0, i64 128, i1 false) #6, !dbg !1246
  %4 = call i32 @parse_packet_identifer_tc(%struct.__sk_buff* %0, %struct.packet_info* nonnull %2) #6, !dbg !1247
  %5 = icmp slt i32 %4, 0, !dbg !1249
  br i1 %5, label %10, label %6, !dbg !1250

6:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i8 0, metadata !1241, metadata !DIExpression()) #6, !dbg !1243
  %7 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %2, i64 0, i32 7, !dbg !1251
  store i8 0, i8* %7, align 2, !dbg !1252, !tbaa !1253
  %8 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %2, i64 0, i32 4, !dbg !1254
  store i32 0, i32* %8, align 4, !dbg !1255, !tbaa !1256
  %9 = bitcast %struct.__sk_buff* %0 to i8*, !dbg !1257
  call fastcc void @pping_parsed_packet(i8* %9, %struct.packet_info* nonnull %2) #6, !dbg !1258
  br label %10, !dbg !1259

10:                                               ; preds = %1, %6
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %3) #6, !dbg !1259
  ret i32 -1, !dbg !1260
}

; Function Attrs: nounwind
define dso_local i32 @pping_tc_ingress(%struct.__sk_buff* %0) #3 section "tc" !dbg !1261 {
  %2 = alloca %struct.packet_info, align 8
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1263, metadata !DIExpression()), !dbg !1264
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1236, metadata !DIExpression()) #6, !dbg !1265
  call void @llvm.dbg.value(metadata i1 true, metadata !1241, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1265
  %3 = bitcast %struct.packet_info* %2 to i8*, !dbg !1267
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %3) #6, !dbg !1267
  call void @llvm.dbg.declare(metadata %struct.packet_info* %2, metadata !1242, metadata !DIExpression()) #6, !dbg !1268
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(128) %3, i8 0, i64 128, i1 false) #6, !dbg !1268
  %4 = call i32 @parse_packet_identifer_tc(%struct.__sk_buff* %0, %struct.packet_info* nonnull %2) #6, !dbg !1269
  %5 = icmp slt i32 %4, 0, !dbg !1270
  br i1 %5, label %12, label %6, !dbg !1271

6:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i8 1, metadata !1241, metadata !DIExpression()) #6, !dbg !1265
  %7 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %2, i64 0, i32 7, !dbg !1272
  store i8 1, i8* %7, align 2, !dbg !1273, !tbaa !1253
  %8 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 9, !dbg !1274
  %9 = load i32, i32* %8, align 4, !dbg !1274, !tbaa !1275
  %10 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %2, i64 0, i32 4, !dbg !1276
  store i32 %9, i32* %10, align 4, !dbg !1277, !tbaa !1256
  %11 = bitcast %struct.__sk_buff* %0 to i8*, !dbg !1278
  call fastcc void @pping_parsed_packet(i8* %11, %struct.packet_info* nonnull %2) #6, !dbg !1279
  br label %12, !dbg !1280

12:                                               ; preds = %1, %6
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %3) #6, !dbg !1280
  ret i32 -1, !dbg !1281
}

; Function Attrs: nounwind
define dso_local i32 @pping_xdp_ingress(%struct.xdp_md* %0) #3 section "xdp" !dbg !1282 {
  %2 = alloca %struct.packet_info, align 8
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1286, metadata !DIExpression()), !dbg !1287
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1288, metadata !DIExpression()) #6, !dbg !1294
  %3 = bitcast %struct.packet_info* %2 to i8*, !dbg !1296
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %3) #6, !dbg !1296
  call void @llvm.dbg.declare(metadata %struct.packet_info* %2, metadata !1293, metadata !DIExpression()) #6, !dbg !1297
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(128) %3, i8 0, i64 128, i1 false) #6, !dbg !1297
  %4 = call i32 @parse_packet_identifer_xdp(%struct.xdp_md* %0, %struct.packet_info* nonnull %2) #6, !dbg !1298
  %5 = icmp slt i32 %4, 0, !dbg !1300
  br i1 %5, label %12, label %6, !dbg !1301

6:                                                ; preds = %1
  %7 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %2, i64 0, i32 7, !dbg !1302
  store i8 1, i8* %7, align 2, !dbg !1303, !tbaa !1253
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 3, !dbg !1304
  %9 = load i32, i32* %8, align 4, !dbg !1304, !tbaa !1305
  %10 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %2, i64 0, i32 4, !dbg !1306
  store i32 %9, i32* %10, align 4, !dbg !1307, !tbaa !1256
  %11 = bitcast %struct.xdp_md* %0 to i8*, !dbg !1308
  call fastcc void @pping_parsed_packet(i8* %11, %struct.packet_info* nonnull %2) #6, !dbg !1309
  br label %12, !dbg !1310

12:                                               ; preds = %1, %6
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %3) #6, !dbg !1310
  ret i32 2, !dbg !1311
}

; Function Attrs: nounwind
define dso_local i32 @tsmap_cleanup(%struct.bpf_iter__bpf_map_elem* nocapture readonly %0) #3 section "iter/bpf_map_elem" !dbg !1312 {
  %2 = alloca %struct.packet_id, align 4
  %3 = alloca %struct.network_tuple, align 4
  call void @llvm.dbg.value(metadata %struct.bpf_iter__bpf_map_elem* %0, metadata !1333, metadata !DIExpression()), !dbg !1343
  %4 = bitcast %struct.packet_id* %2 to i8*, !dbg !1344
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %4) #6, !dbg !1344
  call void @llvm.dbg.declare(metadata %struct.packet_id* %2, metadata !1334, metadata !DIExpression()), !dbg !1345
  call void @llvm.dbg.value(metadata %struct.flow_state* null, metadata !1335, metadata !DIExpression()), !dbg !1343
  %5 = bitcast %struct.network_tuple* %3 to i8*, !dbg !1346
  call void @llvm.lifetime.start.p0i8(i64 44, i8* nonnull %5) #6, !dbg !1346
  call void @llvm.dbg.declare(metadata %struct.network_tuple* %3, metadata !1338, metadata !DIExpression()), !dbg !1347
  %6 = getelementptr inbounds %struct.bpf_iter__bpf_map_elem, %struct.bpf_iter__bpf_map_elem* %0, i64 0, i32 2, !dbg !1348
  %7 = load i8*, i8** %6, align 8, !dbg !1348, !tbaa !1349
  call void @llvm.dbg.value(metadata i8* %7, metadata !1339, metadata !DIExpression()), !dbg !1343
  %8 = getelementptr inbounds %struct.bpf_iter__bpf_map_elem, %struct.bpf_iter__bpf_map_elem* %0, i64 0, i32 3, !dbg !1351
  %9 = bitcast i8** %8 to i64**, !dbg !1351
  %10 = load i64*, i64** %9, align 8, !dbg !1351, !tbaa !1352
  call void @llvm.dbg.value(metadata i64* %10, metadata !1340, metadata !DIExpression()), !dbg !1343
  %11 = tail call i64 inttoptr (i64 5 to i64 ()*)() #6, !dbg !1353
  call void @llvm.dbg.value(metadata i64 %11, metadata !1341, metadata !DIExpression()), !dbg !1343
  %12 = icmp ne i8* %7, null, !dbg !1354
  %13 = icmp ne i64* %10, null
  %14 = and i1 %12, %13, !dbg !1356
  br i1 %14, label %15, label %66, !dbg !1356

15:                                               ; preds = %1
  %16 = load i64, i64* %10, align 8, !dbg !1357, !tbaa !1359
  %17 = icmp ugt i64 %11, %16, !dbg !1360
  br i1 %17, label %18, label %66, !dbg !1361

18:                                               ; preds = %15
  %19 = bitcast i8* %7 to %struct.network_tuple*, !dbg !1362
  call void @llvm.dbg.value(metadata %struct.network_tuple* %3, metadata !1363, metadata !DIExpression()) #6, !dbg !1367
  call void @llvm.dbg.value(metadata %struct.network_tuple* %19, metadata !1366, metadata !DIExpression()) #6, !dbg !1367
  %20 = tail call fastcc zeroext i1 @is_dualflow_key(%struct.network_tuple* nonnull %19) #6, !dbg !1369
  br i1 %20, label %21, label %22, !dbg !1371

21:                                               ; preds = %18
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(44) %5, i8* nonnull align 4 dereferenceable(44) %7, i64 44, i1 false) #6, !dbg !1372, !tbaa.struct !1373
  br label %34, !dbg !1374

22:                                               ; preds = %18
  call void @llvm.dbg.value(metadata %struct.network_tuple* %3, metadata !1150, metadata !DIExpression()) #6, !dbg !1375
  call void @llvm.dbg.value(metadata %struct.network_tuple* %19, metadata !1151, metadata !DIExpression()) #6, !dbg !1375
  %23 = getelementptr inbounds i8, i8* %7, i64 42, !dbg !1377
  %24 = load i8, i8* %23, align 2, !dbg !1377, !tbaa !1164
  %25 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %3, i64 0, i32 3, !dbg !1378
  store i8 %24, i8* %25, align 2, !dbg !1379, !tbaa !1164
  %26 = getelementptr inbounds i8, i8* %7, i64 40, !dbg !1380
  %27 = bitcast i8* %26 to i16*, !dbg !1380
  %28 = load i16, i16* %27, align 4, !dbg !1380, !tbaa !1167
  %29 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %3, i64 0, i32 2, !dbg !1381
  store i16 %28, i16* %29, align 4, !dbg !1382, !tbaa !1167
  %30 = getelementptr inbounds i8, i8* %7, i64 20, !dbg !1383
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(20) %5, i8* nonnull align 4 dereferenceable(20) %30, i64 20, i1 false) #6, !dbg !1383, !tbaa.struct !1169
  %31 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %3, i64 0, i32 1, !dbg !1384
  %32 = bitcast %struct.flow_address* %31 to i8*, !dbg !1385
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(20) %32, i8* nonnull align 4 dereferenceable(20) %7, i64 20, i1 false) #6, !dbg !1385, !tbaa.struct !1169
  %33 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %3, i64 0, i32 4, !dbg !1386
  store i8 0, i8* %33, align 1, !dbg !1387, !tbaa !1173
  br label %34

34:                                               ; preds = %21, %22
  %35 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.6* @flow_state to i8*), i8* nonnull %5) #6, !dbg !1388
  call void @llvm.dbg.value(metadata i8* %35, metadata !1337, metadata !DIExpression()), !dbg !1343
  %36 = icmp eq i8* %35, null, !dbg !1389
  br i1 %36, label %51, label %37, !dbg !1391

37:                                               ; preds = %34
  call void @llvm.dbg.value(metadata i8* %35, metadata !1337, metadata !DIExpression()), !dbg !1343
  call void @llvm.dbg.value(metadata i8* %35, metadata !1392, metadata !DIExpression()) #6, !dbg !1398
  call void @llvm.dbg.value(metadata %struct.network_tuple* %19, metadata !1397, metadata !DIExpression()) #6, !dbg !1398
  %38 = call fastcc zeroext i1 @is_dualflow_key(%struct.network_tuple* nonnull %19) #6, !dbg !1400
  call void @llvm.dbg.value(metadata i8* %35, metadata !1401, metadata !DIExpression()) #6, !dbg !1407
  call void @llvm.dbg.value(metadata i1 %38, metadata !1406, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1407
  %39 = getelementptr inbounds i8, i8* %35, i64 72, !dbg !1409
  call void @llvm.dbg.value(metadata %struct.flow_state* undef, metadata !1335, metadata !DIExpression()), !dbg !1343
  %40 = select i1 %38, i8* %35, i8* %39
  %41 = bitcast i8* %40 to %struct.flow_state*, !dbg !1409
  %42 = getelementptr inbounds i8, i8* %40, i64 8, !dbg !1410
  %43 = bitcast i8* %42 to i64*, !dbg !1410
  %44 = load i64, i64* %43, align 8, !dbg !1410, !tbaa !1411
  call void @llvm.dbg.value(metadata i64 %44, metadata !1342, metadata !DIExpression()), !dbg !1343
  %45 = icmp eq i64 %44, 0, !dbg !1413
  br i1 %45, label %51, label %46, !dbg !1415

46:                                               ; preds = %37
  %47 = load i64, i64* %10, align 8, !dbg !1416, !tbaa !1359
  %48 = sub i64 %11, %47, !dbg !1417
  %49 = shl i64 %44, 3, !dbg !1418
  %50 = icmp ugt i64 %48, %49, !dbg !1419
  br i1 %50, label %57, label %51, !dbg !1420

51:                                               ; preds = %34, %46, %37
  %52 = phi %struct.flow_state* [ %41, %46 ], [ %41, %37 ], [ null, %34 ]
  %53 = phi i1 [ false, %46 ], [ false, %37 ], [ true, %34 ]
  %54 = load i64, i64* %10, align 8, !dbg !1421, !tbaa !1359
  %55 = sub i64 %11, %54, !dbg !1422
  %56 = icmp ugt i64 %55, 10000000000, !dbg !1423
  br i1 %56, label %57, label %66, !dbg !1424

57:                                               ; preds = %51, %46
  %58 = phi %struct.flow_state* [ %52, %51 ], [ %41, %46 ]
  %59 = phi i1 [ %53, %51 ], [ false, %46 ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(48) %4, i8* nonnull align 4 dereferenceable(48) %7, i64 48, i1 false), !dbg !1425
  %60 = call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* bitcast (%struct.anon.7* @packet_ts to i8*), i8* nonnull %4) #6, !dbg !1427
  %61 = icmp ne i64 %60, 0, !dbg !1429
  %62 = or i1 %59, %61, !dbg !1430
  br i1 %62, label %66, label %63, !dbg !1430

63:                                               ; preds = %57
  %64 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %58, i64 0, i32 8, !dbg !1431
  %65 = atomicrmw add i32* %64, i32 -1 seq_cst, !dbg !1434
  br label %66, !dbg !1434

66:                                               ; preds = %57, %51, %63, %15, %1
  call void @llvm.lifetime.end.p0i8(i64 44, i8* nonnull %5) #6, !dbg !1435
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %4) #6, !dbg !1435
  ret i32 0, !dbg !1435
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
define dso_local i32 @flowmap_cleanup(%struct.bpf_iter__bpf_map_elem* %0) #3 section "iter/bpf_map_elem" !dbg !1436 {
  %2 = alloca %struct.flow_event, align 8
  %3 = alloca %struct.flow_event, align 8
  %4 = alloca %struct.network_tuple, align 4
  call void @llvm.dbg.value(metadata %struct.bpf_iter__bpf_map_elem* %0, metadata !1438, metadata !DIExpression()), !dbg !1449
  %5 = bitcast %struct.network_tuple* %4 to i8*, !dbg !1450
  call void @llvm.lifetime.start.p0i8(i64 44, i8* nonnull %5) #6, !dbg !1450
  call void @llvm.dbg.declare(metadata %struct.network_tuple* %4, metadata !1439, metadata !DIExpression()), !dbg !1451
  %6 = tail call i64 inttoptr (i64 5 to i64 ()*)() #6, !dbg !1452
  call void @llvm.dbg.value(metadata i64 %6, metadata !1444, metadata !DIExpression()), !dbg !1449
  %7 = bitcast %struct.bpf_iter__bpf_map_elem* %0 to i8*, !dbg !1453
  %8 = getelementptr inbounds %struct.bpf_iter__bpf_map_elem, %struct.bpf_iter__bpf_map_elem* %0, i64 0, i32 2, !dbg !1454
  %9 = load i8*, i8** %8, align 8, !dbg !1454, !tbaa !1349
  %10 = icmp eq i8* %9, null, !dbg !1455
  br i1 %10, label %344, label %11, !dbg !1457

11:                                               ; preds = %1
  %12 = getelementptr inbounds %struct.bpf_iter__bpf_map_elem, %struct.bpf_iter__bpf_map_elem* %0, i64 0, i32 3, !dbg !1458
  %13 = load i8*, i8** %12, align 8, !dbg !1458, !tbaa !1352
  %14 = icmp eq i8* %13, null, !dbg !1459
  br i1 %14, label %344, label %15, !dbg !1460

15:                                               ; preds = %11
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(44) %5, i8* nonnull align 4 dereferenceable(44) %9, i64 44, i1 false), !dbg !1461, !tbaa.struct !1373
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1150, metadata !DIExpression()) #6, !dbg !1462
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1151, metadata !DIExpression()) #6, !dbg !1462
  %16 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 3, !dbg !1464
  %17 = load i8, i8* %16, align 2, !dbg !1464, !tbaa !1164
  call void @llvm.dbg.value(metadata i8 %17, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 336, 8)), !dbg !1449
  %18 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 2, !dbg !1465
  %19 = load i16, i16* %18, align 4, !dbg !1465, !tbaa !1167
  call void @llvm.dbg.value(metadata i16 %19, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 320, 16)), !dbg !1449
  %20 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, !dbg !1466
  %21 = bitcast %struct.flow_address* %20 to i8*, !dbg !1466
  %22 = load i8, i8* %21, align 4, !dbg !1466, !tbaa.struct !1169
  call void @llvm.dbg.value(metadata i8 %22, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !1449
  %23 = getelementptr inbounds i8, i8* %5, i64 21, !dbg !1466
  %24 = load i8, i8* %23, align 1, !dbg !1466, !tbaa.struct !1467
  call void @llvm.dbg.value(metadata i8 %24, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !1449
  %25 = getelementptr inbounds i8, i8* %5, i64 22, !dbg !1466
  %26 = load i8, i8* %25, align 2, !dbg !1466, !tbaa.struct !1468
  call void @llvm.dbg.value(metadata i8 %26, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 8)), !dbg !1449
  %27 = getelementptr inbounds i8, i8* %5, i64 23, !dbg !1466
  %28 = load i8, i8* %27, align 1, !dbg !1466, !tbaa.struct !1469
  call void @llvm.dbg.value(metadata i8 %28, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 24, 8)), !dbg !1449
  %29 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, i32 0, i32 0, i32 0, i64 1, !dbg !1466
  %30 = bitcast i32* %29 to i8*, !dbg !1466
  %31 = load i8, i8* %30, align 4, !dbg !1466, !tbaa.struct !1470
  call void @llvm.dbg.value(metadata i8 %31, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !1449
  %32 = getelementptr inbounds i8, i8* %5, i64 25, !dbg !1466
  %33 = load i8, i8* %32, align 1, !dbg !1466, !tbaa.struct !1471
  call void @llvm.dbg.value(metadata i8 %33, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 40, 8)), !dbg !1449
  %34 = getelementptr inbounds i8, i8* %5, i64 26, !dbg !1466
  %35 = load i8, i8* %34, align 2, !dbg !1466, !tbaa.struct !1472
  call void @llvm.dbg.value(metadata i8 %35, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 48, 8)), !dbg !1449
  %36 = getelementptr inbounds i8, i8* %5, i64 27, !dbg !1466
  %37 = load i8, i8* %36, align 1, !dbg !1466, !tbaa.struct !1473
  call void @llvm.dbg.value(metadata i8 %37, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 56, 8)), !dbg !1449
  %38 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, i32 0, i32 0, i32 0, i64 2, !dbg !1466
  %39 = bitcast i32* %38 to i8*, !dbg !1466
  %40 = load i8, i8* %39, align 4, !dbg !1466, !tbaa.struct !1474
  call void @llvm.dbg.value(metadata i8 %40, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !1449
  %41 = getelementptr inbounds i8, i8* %5, i64 29, !dbg !1466
  %42 = load i8, i8* %41, align 1, !dbg !1466, !tbaa.struct !1475
  call void @llvm.dbg.value(metadata i8 %42, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !1449
  %43 = getelementptr inbounds i8, i8* %5, i64 30, !dbg !1466
  %44 = load i8, i8* %43, align 2, !dbg !1466, !tbaa.struct !1476
  call void @llvm.dbg.value(metadata i8 %44, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !1449
  %45 = getelementptr inbounds i8, i8* %5, i64 31, !dbg !1466
  %46 = load i8, i8* %45, align 1, !dbg !1466, !tbaa.struct !1477
  call void @llvm.dbg.value(metadata i8 %46, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !1449
  %47 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, i32 0, i32 0, i32 0, i64 3, !dbg !1466
  %48 = bitcast i32* %47 to i8*, !dbg !1466
  %49 = load i8, i8* %48, align 4, !dbg !1466, !tbaa.struct !1478
  call void @llvm.dbg.value(metadata i8 %49, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !1449
  %50 = getelementptr inbounds i8, i8* %5, i64 33, !dbg !1466
  %51 = load i8, i8* %50, align 1, !dbg !1466, !tbaa.struct !1479
  call void @llvm.dbg.value(metadata i8 %51, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 104, 8)), !dbg !1449
  %52 = getelementptr inbounds i8, i8* %5, i64 34, !dbg !1466
  %53 = load i8, i8* %52, align 2, !dbg !1466, !tbaa.struct !1480
  call void @llvm.dbg.value(metadata i8 %53, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 112, 8)), !dbg !1449
  %54 = getelementptr inbounds i8, i8* %5, i64 35, !dbg !1466
  %55 = load i8, i8* %54, align 1, !dbg !1466, !tbaa.struct !1481
  call void @llvm.dbg.value(metadata i8 %55, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 120, 8)), !dbg !1449
  %56 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, i32 1, !dbg !1466
  %57 = bitcast i16* %56 to i8*, !dbg !1466
  %58 = load i8, i8* %57, align 4, !dbg !1466, !tbaa.struct !1482
  call void @llvm.dbg.value(metadata i8 %58, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 8)), !dbg !1449
  %59 = getelementptr inbounds i8, i8* %5, i64 37, !dbg !1466
  %60 = load i8, i8* %59, align 1, !dbg !1466, !tbaa.struct !1483
  call void @llvm.dbg.value(metadata i8 %60, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 136, 8)), !dbg !1449
  %61 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, i32 2, !dbg !1466
  %62 = bitcast i16* %61 to i8*, !dbg !1466
  %63 = load i8, i8* %62, align 2, !dbg !1466, !tbaa.struct !1484
  call void @llvm.dbg.value(metadata i8 %63, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 144, 8)), !dbg !1449
  %64 = getelementptr inbounds i8, i8* %5, i64 39, !dbg !1466
  %65 = load i8, i8* %64, align 1, !dbg !1466, !tbaa.struct !1485
  call void @llvm.dbg.value(metadata i8 %65, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 152, 8)), !dbg !1449
  %66 = load i8, i8* %5, align 4, !dbg !1486, !tbaa.struct !1169
  call void @llvm.dbg.value(metadata i8 %66, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 160, 8)), !dbg !1449
  %67 = getelementptr inbounds i8, i8* %5, i64 1, !dbg !1486
  %68 = load i8, i8* %67, align 1, !dbg !1486, !tbaa.struct !1467
  call void @llvm.dbg.value(metadata i8 %68, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 168, 8)), !dbg !1449
  %69 = getelementptr inbounds i8, i8* %5, i64 2, !dbg !1486
  %70 = load i8, i8* %69, align 2, !dbg !1486, !tbaa.struct !1468
  call void @llvm.dbg.value(metadata i8 %70, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 176, 8)), !dbg !1449
  %71 = getelementptr inbounds i8, i8* %5, i64 3, !dbg !1486
  %72 = load i8, i8* %71, align 1, !dbg !1486, !tbaa.struct !1469
  call void @llvm.dbg.value(metadata i8 %72, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 184, 8)), !dbg !1449
  %73 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1, !dbg !1486
  %74 = bitcast i32* %73 to i8*, !dbg !1486
  %75 = load i8, i8* %74, align 4, !dbg !1486, !tbaa.struct !1470
  call void @llvm.dbg.value(metadata i8 %75, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 192, 8)), !dbg !1449
  %76 = getelementptr inbounds i8, i8* %5, i64 5, !dbg !1486
  %77 = load i8, i8* %76, align 1, !dbg !1486, !tbaa.struct !1471
  call void @llvm.dbg.value(metadata i8 %77, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 200, 8)), !dbg !1449
  %78 = getelementptr inbounds i8, i8* %5, i64 6, !dbg !1486
  %79 = load i8, i8* %78, align 2, !dbg !1486, !tbaa.struct !1472
  call void @llvm.dbg.value(metadata i8 %79, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 208, 8)), !dbg !1449
  %80 = getelementptr inbounds i8, i8* %5, i64 7, !dbg !1486
  %81 = load i8, i8* %80, align 1, !dbg !1486, !tbaa.struct !1473
  call void @llvm.dbg.value(metadata i8 %81, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 216, 8)), !dbg !1449
  %82 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2, !dbg !1486
  %83 = bitcast i32* %82 to i8*, !dbg !1486
  %84 = load i8, i8* %83, align 4, !dbg !1486, !tbaa.struct !1474
  call void @llvm.dbg.value(metadata i8 %84, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 224, 8)), !dbg !1449
  %85 = getelementptr inbounds i8, i8* %5, i64 9, !dbg !1486
  %86 = load i8, i8* %85, align 1, !dbg !1486, !tbaa.struct !1475
  call void @llvm.dbg.value(metadata i8 %86, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 232, 8)), !dbg !1449
  %87 = getelementptr inbounds i8, i8* %5, i64 10, !dbg !1486
  %88 = load i8, i8* %87, align 2, !dbg !1486, !tbaa.struct !1476
  call void @llvm.dbg.value(metadata i8 %88, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 240, 8)), !dbg !1449
  %89 = getelementptr inbounds i8, i8* %5, i64 11, !dbg !1486
  %90 = load i8, i8* %89, align 1, !dbg !1486, !tbaa.struct !1477
  call void @llvm.dbg.value(metadata i8 %90, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 248, 8)), !dbg !1449
  %91 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !1486
  %92 = bitcast i32* %91 to i8*, !dbg !1486
  %93 = load i8, i8* %92, align 4, !dbg !1486, !tbaa.struct !1478
  call void @llvm.dbg.value(metadata i8 %93, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 256, 8)), !dbg !1449
  %94 = getelementptr inbounds i8, i8* %5, i64 13, !dbg !1486
  %95 = load i8, i8* %94, align 1, !dbg !1486, !tbaa.struct !1479
  call void @llvm.dbg.value(metadata i8 %95, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 264, 8)), !dbg !1449
  %96 = getelementptr inbounds i8, i8* %5, i64 14, !dbg !1486
  %97 = load i8, i8* %96, align 2, !dbg !1486, !tbaa.struct !1480
  call void @llvm.dbg.value(metadata i8 %97, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 272, 8)), !dbg !1449
  %98 = getelementptr inbounds i8, i8* %5, i64 15, !dbg !1486
  %99 = load i8, i8* %98, align 1, !dbg !1486, !tbaa.struct !1481
  call void @llvm.dbg.value(metadata i8 %99, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 280, 8)), !dbg !1449
  %100 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 0, i32 1, !dbg !1486
  %101 = bitcast i16* %100 to i8*, !dbg !1486
  %102 = load i8, i8* %101, align 4, !dbg !1486, !tbaa.struct !1482
  call void @llvm.dbg.value(metadata i8 %102, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 288, 8)), !dbg !1449
  %103 = getelementptr inbounds i8, i8* %5, i64 17, !dbg !1486
  %104 = load i8, i8* %103, align 1, !dbg !1486, !tbaa.struct !1483
  call void @llvm.dbg.value(metadata i8 %104, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 296, 8)), !dbg !1449
  %105 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 0, i32 2, !dbg !1486
  %106 = bitcast i16* %105 to i8*, !dbg !1486
  %107 = load i8, i8* %106, align 2, !dbg !1486, !tbaa.struct !1484
  call void @llvm.dbg.value(metadata i8 %107, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 304, 8)), !dbg !1449
  %108 = getelementptr inbounds i8, i8* %5, i64 19, !dbg !1486
  %109 = load i8, i8* %108, align 1, !dbg !1486, !tbaa.struct !1485
  call void @llvm.dbg.value(metadata i8 %109, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 312, 8)), !dbg !1449
  call void @llvm.dbg.value(metadata i8 0, metadata !1440, metadata !DIExpression(DW_OP_LLVM_fragment, 344, 8)), !dbg !1449
  call void @llvm.dbg.value(metadata i8* %13, metadata !1443, metadata !DIExpression()), !dbg !1449
  call void @llvm.dbg.value(metadata i8* %13, metadata !1392, metadata !DIExpression()) #6, !dbg !1487
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1397, metadata !DIExpression()) #6, !dbg !1487
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1489, metadata !DIExpression()), !dbg !1494
  call void @llvm.dbg.value(metadata i8* %5, metadata !1496, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i8* %21, metadata !1501, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i32 20, metadata !1502, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i8* %5, metadata !1503, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i8* %21, metadata !1506, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i32 0, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 0, metadata !1507, metadata !DIExpression()), !dbg !1508
  %110 = icmp eq i8 %66, %22, !dbg !1510
  call void @llvm.dbg.value(metadata i64 0, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %110, label %111, label %153, !dbg !1515

111:                                              ; preds = %15
  call void @llvm.dbg.value(metadata i64 1, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 0, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 1, metadata !1507, metadata !DIExpression()), !dbg !1508
  %112 = icmp eq i8 %68, %24, !dbg !1510
  call void @llvm.dbg.value(metadata i64 1, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %112, label %113, label %153, !dbg !1515

113:                                              ; preds = %111
  call void @llvm.dbg.value(metadata i64 2, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 1, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 2, metadata !1507, metadata !DIExpression()), !dbg !1508
  %114 = icmp eq i8 %70, %26, !dbg !1510
  call void @llvm.dbg.value(metadata i64 2, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %114, label %115, label %153, !dbg !1515

115:                                              ; preds = %113
  call void @llvm.dbg.value(metadata i64 3, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 2, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 3, metadata !1507, metadata !DIExpression()), !dbg !1508
  %116 = icmp eq i8 %72, %28, !dbg !1510
  call void @llvm.dbg.value(metadata i64 3, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %116, label %117, label %153, !dbg !1515

117:                                              ; preds = %115
  call void @llvm.dbg.value(metadata i64 4, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 3, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 4, metadata !1507, metadata !DIExpression()), !dbg !1508
  %118 = icmp eq i8 %75, %31, !dbg !1510
  call void @llvm.dbg.value(metadata i64 4, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %118, label %119, label %153, !dbg !1515

119:                                              ; preds = %117
  call void @llvm.dbg.value(metadata i64 5, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 4, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 5, metadata !1507, metadata !DIExpression()), !dbg !1508
  %120 = icmp eq i8 %77, %33, !dbg !1510
  call void @llvm.dbg.value(metadata i64 5, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %120, label %121, label %153, !dbg !1515

121:                                              ; preds = %119
  call void @llvm.dbg.value(metadata i64 6, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 5, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 6, metadata !1507, metadata !DIExpression()), !dbg !1508
  %122 = icmp eq i8 %79, %35, !dbg !1510
  call void @llvm.dbg.value(metadata i64 6, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %122, label %123, label %153, !dbg !1515

123:                                              ; preds = %121
  call void @llvm.dbg.value(metadata i64 7, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 6, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 7, metadata !1507, metadata !DIExpression()), !dbg !1508
  %124 = icmp eq i8 %81, %37, !dbg !1510
  call void @llvm.dbg.value(metadata i64 7, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %124, label %125, label %153, !dbg !1515

125:                                              ; preds = %123
  call void @llvm.dbg.value(metadata i64 8, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 7, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 8, metadata !1507, metadata !DIExpression()), !dbg !1508
  %126 = icmp eq i8 %84, %40, !dbg !1510
  call void @llvm.dbg.value(metadata i64 8, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %126, label %127, label %153, !dbg !1515

127:                                              ; preds = %125
  call void @llvm.dbg.value(metadata i64 9, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 8, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 9, metadata !1507, metadata !DIExpression()), !dbg !1508
  %128 = icmp eq i8 %86, %42, !dbg !1510
  call void @llvm.dbg.value(metadata i64 9, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %128, label %129, label %153, !dbg !1515

129:                                              ; preds = %127
  call void @llvm.dbg.value(metadata i64 10, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 9, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 10, metadata !1507, metadata !DIExpression()), !dbg !1508
  %130 = icmp eq i8 %88, %44, !dbg !1510
  call void @llvm.dbg.value(metadata i64 10, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %130, label %131, label %153, !dbg !1515

131:                                              ; preds = %129
  call void @llvm.dbg.value(metadata i64 11, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 10, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 11, metadata !1507, metadata !DIExpression()), !dbg !1508
  %132 = icmp eq i8 %90, %46, !dbg !1510
  call void @llvm.dbg.value(metadata i64 11, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %132, label %133, label %153, !dbg !1515

133:                                              ; preds = %131
  call void @llvm.dbg.value(metadata i64 12, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 11, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 12, metadata !1507, metadata !DIExpression()), !dbg !1508
  %134 = icmp eq i8 %93, %49, !dbg !1510
  call void @llvm.dbg.value(metadata i64 12, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %134, label %135, label %153, !dbg !1515

135:                                              ; preds = %133
  call void @llvm.dbg.value(metadata i64 13, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 12, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 13, metadata !1507, metadata !DIExpression()), !dbg !1508
  %136 = icmp eq i8 %95, %51, !dbg !1510
  call void @llvm.dbg.value(metadata i64 13, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %136, label %137, label %153, !dbg !1515

137:                                              ; preds = %135
  call void @llvm.dbg.value(metadata i64 14, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 13, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 14, metadata !1507, metadata !DIExpression()), !dbg !1508
  %138 = icmp eq i8 %97, %53, !dbg !1510
  call void @llvm.dbg.value(metadata i64 14, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %138, label %139, label %153, !dbg !1515

139:                                              ; preds = %137
  call void @llvm.dbg.value(metadata i64 15, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 14, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 15, metadata !1507, metadata !DIExpression()), !dbg !1508
  %140 = icmp eq i8 %99, %55, !dbg !1510
  call void @llvm.dbg.value(metadata i64 15, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %140, label %141, label %153, !dbg !1515

141:                                              ; preds = %139
  call void @llvm.dbg.value(metadata i64 16, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 15, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 16, metadata !1507, metadata !DIExpression()), !dbg !1508
  %142 = icmp eq i8 %102, %58, !dbg !1510
  call void @llvm.dbg.value(metadata i64 16, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %142, label %143, label %153, !dbg !1515

143:                                              ; preds = %141
  call void @llvm.dbg.value(metadata i64 17, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 16, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 17, metadata !1507, metadata !DIExpression()), !dbg !1508
  %144 = icmp eq i8 %104, %60, !dbg !1510
  call void @llvm.dbg.value(metadata i64 17, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %144, label %145, label %153, !dbg !1515

145:                                              ; preds = %143
  call void @llvm.dbg.value(metadata i64 18, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 17, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 18, metadata !1507, metadata !DIExpression()), !dbg !1508
  %146 = icmp eq i8 %107, %63, !dbg !1510
  call void @llvm.dbg.value(metadata i64 18, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %146, label %147, label %153, !dbg !1515

147:                                              ; preds = %145
  call void @llvm.dbg.value(metadata i64 19, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i64 18, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  call void @llvm.dbg.value(metadata i64 19, metadata !1507, metadata !DIExpression()), !dbg !1508
  %148 = icmp eq i8 %109, %65, !dbg !1510
  call void @llvm.dbg.value(metadata i64 19, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1508
  br i1 %148, label %149, label %153, !dbg !1515

149:                                              ; preds = %147
  call void @llvm.dbg.value(metadata i8* %13, metadata !1401, metadata !DIExpression()) #6, !dbg !1516
  call void @llvm.dbg.value(metadata i1 %156, metadata !1406, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1516
  %150 = bitcast i8* %13 to %struct.flow_state*, !dbg !1518
  %151 = getelementptr inbounds i8, i8* %13, i64 72, !dbg !1518
  %152 = bitcast i8* %151 to %struct.flow_state*, !dbg !1518
  br label %160, !dbg !1518

153:                                              ; preds = %15, %111, %113, %115, %117, %119, %121, %123, %125, %127, %129, %131, %133, %135, %137, %139, %141, %143, %145, %147
  %154 = phi i8 [ %66, %15 ], [ %68, %111 ], [ %70, %113 ], [ %72, %115 ], [ %75, %117 ], [ %77, %119 ], [ %79, %121 ], [ %81, %123 ], [ %84, %125 ], [ %86, %127 ], [ %88, %129 ], [ %90, %131 ], [ %93, %133 ], [ %95, %135 ], [ %97, %137 ], [ %99, %139 ], [ %102, %141 ], [ %104, %143 ], [ %107, %145 ], [ %109, %147 ], !dbg !1519
  %155 = phi i8 [ %22, %15 ], [ %24, %111 ], [ %26, %113 ], [ %28, %115 ], [ %31, %117 ], [ %33, %119 ], [ %35, %121 ], [ %37, %123 ], [ %40, %125 ], [ %42, %127 ], [ %44, %129 ], [ %46, %131 ], [ %49, %133 ], [ %51, %135 ], [ %53, %137 ], [ %55, %139 ], [ %58, %141 ], [ %60, %143 ], [ %63, %145 ], [ %65, %147 ], !dbg !1520
  %156 = icmp ugt i8 %154, %155, !dbg !1521
  call void @llvm.dbg.value(metadata i8* %13, metadata !1401, metadata !DIExpression()) #6, !dbg !1516
  call void @llvm.dbg.value(metadata i1 %156, metadata !1406, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1516
  %157 = bitcast i8* %13 to %struct.flow_state*, !dbg !1518
  %158 = getelementptr inbounds i8, i8* %13, i64 72, !dbg !1518
  %159 = bitcast i8* %158 to %struct.flow_state*, !dbg !1518
  br i1 %156, label %163, label %160, !dbg !1518

160:                                              ; preds = %149, %153
  %161 = phi %struct.flow_state* [ %152, %149 ], [ %159, %153 ]
  %162 = phi %struct.flow_state* [ %150, %149 ], [ %157, %153 ]
  br label %163, !dbg !1518

163:                                              ; preds = %153, %160
  %164 = phi %struct.flow_state* [ %161, %160 ], [ %159, %153 ]
  %165 = phi %struct.flow_state* [ %162, %160 ], [ %157, %153 ]
  %166 = phi %struct.flow_state* [ %162, %160 ], [ %159, %153 ]
  call void @llvm.dbg.value(metadata %struct.flow_state* %166, metadata !1441, metadata !DIExpression()), !dbg !1449
  call void @llvm.dbg.value(metadata i8* %13, metadata !1392, metadata !DIExpression()) #6, !dbg !1522
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1397, metadata !DIExpression()) #6, !dbg !1522
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1489, metadata !DIExpression()), !dbg !1524
  call void @llvm.dbg.value(metadata i8* undef, metadata !1496, metadata !DIExpression()), !dbg !1526
  call void @llvm.dbg.value(metadata i8* undef, metadata !1501, metadata !DIExpression()), !dbg !1526
  call void @llvm.dbg.value(metadata i32 20, metadata !1502, metadata !DIExpression()), !dbg !1526
  call void @llvm.dbg.value(metadata i8* undef, metadata !1503, metadata !DIExpression()), !dbg !1526
  call void @llvm.dbg.value(metadata i8* undef, metadata !1506, metadata !DIExpression()), !dbg !1526
  call void @llvm.dbg.value(metadata i64 0, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %110, label %167, label %205, !dbg !1528

167:                                              ; preds = %163
  call void @llvm.dbg.value(metadata i64 1, metadata !1507, metadata !DIExpression()), !dbg !1526
  %168 = icmp eq i8 %24, %68, !dbg !1529
  call void @llvm.dbg.value(metadata i64 1, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %168, label %169, label %205, !dbg !1528

169:                                              ; preds = %167
  call void @llvm.dbg.value(metadata i64 2, metadata !1507, metadata !DIExpression()), !dbg !1526
  %170 = icmp eq i8 %26, %70, !dbg !1529
  call void @llvm.dbg.value(metadata i64 2, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %170, label %171, label %205, !dbg !1528

171:                                              ; preds = %169
  call void @llvm.dbg.value(metadata i64 3, metadata !1507, metadata !DIExpression()), !dbg !1526
  %172 = icmp eq i8 %28, %72, !dbg !1529
  call void @llvm.dbg.value(metadata i64 3, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %172, label %173, label %205, !dbg !1528

173:                                              ; preds = %171
  call void @llvm.dbg.value(metadata i64 4, metadata !1507, metadata !DIExpression()), !dbg !1526
  %174 = icmp eq i8 %31, %75, !dbg !1529
  call void @llvm.dbg.value(metadata i64 4, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %174, label %175, label %205, !dbg !1528

175:                                              ; preds = %173
  call void @llvm.dbg.value(metadata i64 5, metadata !1507, metadata !DIExpression()), !dbg !1526
  %176 = icmp eq i8 %33, %77, !dbg !1529
  call void @llvm.dbg.value(metadata i64 5, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %176, label %177, label %205, !dbg !1528

177:                                              ; preds = %175
  call void @llvm.dbg.value(metadata i64 6, metadata !1507, metadata !DIExpression()), !dbg !1526
  %178 = icmp eq i8 %35, %79, !dbg !1529
  call void @llvm.dbg.value(metadata i64 6, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %178, label %179, label %205, !dbg !1528

179:                                              ; preds = %177
  call void @llvm.dbg.value(metadata i64 7, metadata !1507, metadata !DIExpression()), !dbg !1526
  %180 = icmp eq i8 %37, %81, !dbg !1529
  call void @llvm.dbg.value(metadata i64 7, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %180, label %181, label %205, !dbg !1528

181:                                              ; preds = %179
  call void @llvm.dbg.value(metadata i64 8, metadata !1507, metadata !DIExpression()), !dbg !1526
  %182 = icmp eq i8 %40, %84, !dbg !1529
  call void @llvm.dbg.value(metadata i64 8, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %182, label %183, label %205, !dbg !1528

183:                                              ; preds = %181
  call void @llvm.dbg.value(metadata i64 9, metadata !1507, metadata !DIExpression()), !dbg !1526
  %184 = icmp eq i8 %42, %86, !dbg !1529
  call void @llvm.dbg.value(metadata i64 9, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %184, label %185, label %205, !dbg !1528

185:                                              ; preds = %183
  call void @llvm.dbg.value(metadata i64 10, metadata !1507, metadata !DIExpression()), !dbg !1526
  %186 = icmp eq i8 %44, %88, !dbg !1529
  call void @llvm.dbg.value(metadata i64 10, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %186, label %187, label %205, !dbg !1528

187:                                              ; preds = %185
  call void @llvm.dbg.value(metadata i64 11, metadata !1507, metadata !DIExpression()), !dbg !1526
  %188 = icmp eq i8 %46, %90, !dbg !1529
  call void @llvm.dbg.value(metadata i64 11, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %188, label %189, label %205, !dbg !1528

189:                                              ; preds = %187
  call void @llvm.dbg.value(metadata i64 12, metadata !1507, metadata !DIExpression()), !dbg !1526
  %190 = icmp eq i8 %49, %93, !dbg !1529
  call void @llvm.dbg.value(metadata i64 12, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %190, label %191, label %205, !dbg !1528

191:                                              ; preds = %189
  call void @llvm.dbg.value(metadata i64 13, metadata !1507, metadata !DIExpression()), !dbg !1526
  %192 = icmp eq i8 %51, %95, !dbg !1529
  call void @llvm.dbg.value(metadata i64 13, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %192, label %193, label %205, !dbg !1528

193:                                              ; preds = %191
  call void @llvm.dbg.value(metadata i64 14, metadata !1507, metadata !DIExpression()), !dbg !1526
  %194 = icmp eq i8 %53, %97, !dbg !1529
  call void @llvm.dbg.value(metadata i64 14, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %194, label %195, label %205, !dbg !1528

195:                                              ; preds = %193
  call void @llvm.dbg.value(metadata i64 15, metadata !1507, metadata !DIExpression()), !dbg !1526
  %196 = icmp eq i8 %55, %99, !dbg !1529
  call void @llvm.dbg.value(metadata i64 15, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %196, label %197, label %205, !dbg !1528

197:                                              ; preds = %195
  call void @llvm.dbg.value(metadata i64 16, metadata !1507, metadata !DIExpression()), !dbg !1526
  %198 = icmp eq i8 %58, %102, !dbg !1529
  call void @llvm.dbg.value(metadata i64 16, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %198, label %199, label %205, !dbg !1528

199:                                              ; preds = %197
  call void @llvm.dbg.value(metadata i64 17, metadata !1507, metadata !DIExpression()), !dbg !1526
  %200 = icmp eq i8 %60, %104, !dbg !1529
  call void @llvm.dbg.value(metadata i64 17, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %200, label %201, label %205, !dbg !1528

201:                                              ; preds = %199
  call void @llvm.dbg.value(metadata i64 18, metadata !1507, metadata !DIExpression()), !dbg !1526
  %202 = icmp eq i8 %63, %107, !dbg !1529
  call void @llvm.dbg.value(metadata i64 18, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %202, label %203, label %205, !dbg !1528

203:                                              ; preds = %201
  call void @llvm.dbg.value(metadata i64 19, metadata !1507, metadata !DIExpression()), !dbg !1526
  %204 = icmp eq i8 %65, %109, !dbg !1529
  call void @llvm.dbg.value(metadata i64 19, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1526
  br i1 %204, label %209, label %205, !dbg !1528

205:                                              ; preds = %163, %167, %169, %171, %173, %175, %177, %179, %181, %183, %185, %187, %189, %191, %193, %195, %197, %199, %201, %203
  %206 = phi i8 [ %22, %163 ], [ %24, %167 ], [ %26, %169 ], [ %28, %171 ], [ %31, %173 ], [ %33, %175 ], [ %35, %177 ], [ %37, %179 ], [ %40, %181 ], [ %42, %183 ], [ %44, %185 ], [ %46, %187 ], [ %49, %189 ], [ %51, %191 ], [ %53, %193 ], [ %55, %195 ], [ %58, %197 ], [ %60, %199 ], [ %63, %201 ], [ %65, %203 ], !dbg !1530
  %207 = phi i8 [ %66, %163 ], [ %68, %167 ], [ %70, %169 ], [ %72, %171 ], [ %75, %173 ], [ %77, %175 ], [ %79, %177 ], [ %81, %179 ], [ %84, %181 ], [ %86, %183 ], [ %88, %185 ], [ %90, %187 ], [ %93, %189 ], [ %95, %191 ], [ %97, %193 ], [ %99, %195 ], [ %102, %197 ], [ %104, %199 ], [ %107, %201 ], [ %109, %203 ], !dbg !1531
  %208 = icmp ugt i8 %206, %207, !dbg !1532
  call void @llvm.dbg.value(metadata i8* %13, metadata !1401, metadata !DIExpression()) #6, !dbg !1533
  call void @llvm.dbg.value(metadata i1 %208, metadata !1406, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1533
  br i1 %208, label %210, label %209, !dbg !1535

209:                                              ; preds = %203, %205
  br label %210, !dbg !1535

210:                                              ; preds = %209, %205
  %211 = phi %struct.flow_state* [ %165, %209 ], [ %164, %205 ]
  call void @llvm.dbg.value(metadata %struct.flow_state* %211, metadata !1442, metadata !DIExpression()), !dbg !1449
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1536, metadata !DIExpression()), !dbg !1545
  call void @llvm.dbg.value(metadata %struct.flow_state* %166, metadata !1541, metadata !DIExpression()), !dbg !1545
  call void @llvm.dbg.value(metadata i64 %6, metadata !1542, metadata !DIExpression()), !dbg !1545
  call void @llvm.dbg.value(metadata %struct.flow_state* %166, metadata !1547, metadata !DIExpression()), !dbg !1552
  %212 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %166, i64 0, i32 9, !dbg !1555
  %213 = load i8, i8* %212, align 8, !dbg !1555, !tbaa !1556
  switch i8 %213, label %214 [
    i8 3, label %227
    i8 0, label %227
  ], !dbg !1557

214:                                              ; preds = %210
  %215 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %166, i64 0, i32 2, !dbg !1558
  %216 = load i64, i64* %215, align 8, !dbg !1558, !tbaa !1559
  call void @llvm.dbg.value(metadata i64 %216, metadata !1544, metadata !DIExpression()), !dbg !1545
  %217 = icmp ult i64 %6, %216, !dbg !1560
  br i1 %217, label %227, label %218, !dbg !1562

218:                                              ; preds = %214
  %219 = sub i64 %6, %216, !dbg !1563
  call void @llvm.dbg.value(metadata i64 %219, metadata !1543, metadata !DIExpression()), !dbg !1545
  %220 = icmp eq i8 %213, 1, !dbg !1564
  %221 = icmp ugt i64 %219, 30000000000
  %222 = and i1 %220, %221, !dbg !1565
  br i1 %222, label %227, label %223, !dbg !1565

223:                                              ; preds = %218
  switch i16 %19, label %225 [
    i16 1, label %224
    i16 58, label %224
  ], !dbg !1566

224:                                              ; preds = %223, %223
  br i1 %221, label %227, label %225, !dbg !1567

225:                                              ; preds = %224, %223
  %226 = icmp ugt i64 %219, 300000000000, !dbg !1568
  br label %227, !dbg !1567

227:                                              ; preds = %225, %224, %218, %214, %210, %210
  %228 = phi i1 [ false, %210 ], [ false, %214 ], [ true, %224 ], [ %226, %225 ], [ true, %218 ], [ false, %210 ], !dbg !1545
  call void @llvm.dbg.value(metadata i1 %228, metadata !1447, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1449
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1536, metadata !DIExpression()), !dbg !1569
  call void @llvm.dbg.value(metadata %struct.flow_state* %211, metadata !1541, metadata !DIExpression()), !dbg !1569
  call void @llvm.dbg.value(metadata i64 %6, metadata !1542, metadata !DIExpression()), !dbg !1569
  call void @llvm.dbg.value(metadata %struct.flow_state* %211, metadata !1547, metadata !DIExpression()), !dbg !1571
  %229 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %211, i64 0, i32 9, !dbg !1573
  %230 = load i8, i8* %229, align 8, !dbg !1573, !tbaa !1556
  switch i8 %230, label %231 [
    i8 3, label %244
    i8 0, label %244
  ], !dbg !1574

231:                                              ; preds = %227
  %232 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %211, i64 0, i32 2, !dbg !1575
  %233 = load i64, i64* %232, align 8, !dbg !1575, !tbaa !1559
  call void @llvm.dbg.value(metadata i64 %233, metadata !1544, metadata !DIExpression()), !dbg !1569
  %234 = icmp ult i64 %6, %233, !dbg !1576
  br i1 %234, label %244, label %235, !dbg !1577

235:                                              ; preds = %231
  %236 = sub i64 %6, %233, !dbg !1578
  call void @llvm.dbg.value(metadata i64 %236, metadata !1543, metadata !DIExpression()), !dbg !1569
  %237 = icmp eq i8 %230, 1, !dbg !1579
  %238 = icmp ugt i64 %236, 30000000000
  %239 = and i1 %237, %238, !dbg !1580
  br i1 %239, label %244, label %240, !dbg !1580

240:                                              ; preds = %235
  switch i16 %19, label %242 [
    i16 1, label %241
    i16 58, label %241
  ], !dbg !1581

241:                                              ; preds = %240, %240
  br i1 %238, label %244, label %242, !dbg !1582

242:                                              ; preds = %241, %240
  %243 = icmp ugt i64 %236, 300000000000, !dbg !1583
  br label %244, !dbg !1582

244:                                              ; preds = %227, %227, %231, %235, %241, %242
  %245 = phi i1 [ false, %227 ], [ false, %231 ], [ true, %241 ], [ %243, %242 ], [ true, %235 ], [ false, %227 ], !dbg !1569
  call void @llvm.dbg.value(metadata i1 %245, metadata !1448, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1449
  call void @llvm.dbg.value(metadata %struct.flow_state* %166, metadata !1547, metadata !DIExpression()), !dbg !1584
  %246 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %166, i64 0, i32 9, !dbg !1587
  %247 = load i8, i8* %246, align 8, !dbg !1587, !tbaa !1556
  br i1 %228, label %249, label %248, !dbg !1588

248:                                              ; preds = %244
  switch i8 %247, label %344 [
    i8 3, label %249
    i8 0, label %249
  ], !dbg !1588

249:                                              ; preds = %248, %248, %244
  call void @llvm.dbg.value(metadata %struct.flow_state* %211, metadata !1547, metadata !DIExpression()), !dbg !1589
  %250 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %211, i64 0, i32 9, !dbg !1591
  %251 = load i8, i8* %250, align 8, !dbg !1591, !tbaa !1556
  br i1 %245, label %253, label %252, !dbg !1592

252:                                              ; preds = %249
  switch i8 %251, label %344 [
    i8 3, label %253
    i8 0, label %253
  ], !dbg !1592

253:                                              ; preds = %252, %252, %249
  call void @llvm.dbg.value(metadata %struct.flow_state* %166, metadata !1593, metadata !DIExpression()), !dbg !1596
  call void @llvm.dbg.value(metadata i1 undef, metadata !1445, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1449
  call void @llvm.dbg.value(metadata %struct.flow_state* %211, metadata !1593, metadata !DIExpression()), !dbg !1599
  %254 = icmp eq i8 %251, 2, !dbg !1601
  %255 = and i1 %245, %254, !dbg !1602
  call void @llvm.dbg.value(metadata i1 %255, metadata !1446, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1449
  %256 = call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* bitcast (%struct.anon.6* @flow_state to i8*), i8* nonnull %5) #6, !dbg !1603
  %257 = icmp eq i64 %256, 0, !dbg !1605
  br i1 %257, label %258, label %344, !dbg !1606

258:                                              ; preds = %253
  %259 = icmp eq i8 %247, 2, !dbg !1607
  %260 = and i1 %228, %259, !dbg !1608
  call void @llvm.dbg.value(metadata i1 %260, metadata !1445, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1449
  br i1 %260, label %261, label %279, !dbg !1609

261:                                              ; preds = %258
  call void @llvm.dbg.value(metadata i8* %7, metadata !1611, metadata !DIExpression()) #6, !dbg !1628
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1616, metadata !DIExpression()) #6, !dbg !1628
  call void @llvm.dbg.value(metadata i64 %6, metadata !1617, metadata !DIExpression()) #6, !dbg !1628
  %262 = bitcast %struct.flow_event* %2 to i8*, !dbg !1631
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %262) #6, !dbg !1631
  call void @llvm.dbg.declare(metadata %struct.flow_event* %2, metadata !1618, metadata !DIExpression()) #6, !dbg !1632
  %263 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 0, !dbg !1633
  store i64 1, i64* %263, align 8, !dbg !1633, !tbaa !1634
  %264 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 1, !dbg !1633
  store i64 %6, i64* %264, align 8, !dbg !1633, !tbaa !1636
  %265 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, !dbg !1633
  %266 = bitcast %struct.network_tuple* %265 to i8*, !dbg !1633
  %267 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 3, !dbg !1633
  store i8 2, i8* %267, align 4, !dbg !1633, !tbaa !1637
  %268 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 4, !dbg !1633
  store i8 6, i8* %268, align 1, !dbg !1633, !tbaa !1638
  %269 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 5, !dbg !1633
  store i8 2, i8* %269, align 2, !dbg !1633, !tbaa !1639
  %270 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 6, !dbg !1633
  store i8 0, i8* %270, align 1, !dbg !1633, !tbaa !1640
  call void @llvm.dbg.value(metadata %struct.network_tuple* %265, metadata !1150, metadata !DIExpression()) #6, !dbg !1641
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1151, metadata !DIExpression()) #6, !dbg !1641
  %271 = load i8, i8* %16, align 2, !dbg !1643, !tbaa !1164
  %272 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 3, !dbg !1644
  store i8 %271, i8* %272, align 2, !dbg !1645, !tbaa !1164
  %273 = load i16, i16* %18, align 4, !dbg !1646, !tbaa !1167
  %274 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 2, !dbg !1647
  store i16 %273, i16* %274, align 8, !dbg !1648, !tbaa !1167
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(20) %266, i8* nonnull align 4 dereferenceable(20) %21, i64 20, i1 false) #6, !dbg !1649, !tbaa.struct !1169
  %275 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 1, !dbg !1650
  %276 = bitcast %struct.flow_address* %275 to i8*, !dbg !1651
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(20) %276, i8* nonnull align 4 dereferenceable(20) %5, i64 20, i1 false) #6, !dbg !1651, !tbaa.struct !1169
  %277 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 4, !dbg !1652
  store i8 0, i8* %277, align 1, !dbg !1653, !tbaa !1173
  %278 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* nonnull %7, i8* bitcast (%struct.anon.5* @events to i8*), i64 4294967295, i8* nonnull %262, i64 64) #6, !dbg !1654
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %262) #6, !dbg !1655
  br label %279, !dbg !1656

279:                                              ; preds = %261, %258
  br i1 %255, label %280, label %344, !dbg !1657

280:                                              ; preds = %279
  call void @llvm.dbg.value(metadata i8* %7, metadata !1611, metadata !DIExpression()) #6, !dbg !1658
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1616, metadata !DIExpression()) #6, !dbg !1658
  call void @llvm.dbg.value(metadata i64 %6, metadata !1617, metadata !DIExpression()) #6, !dbg !1658
  %281 = bitcast %struct.flow_event* %3 to i8*, !dbg !1661
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %281) #6, !dbg !1661
  call void @llvm.dbg.declare(metadata %struct.flow_event* %3, metadata !1618, metadata !DIExpression()) #6, !dbg !1662
  %282 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 0, !dbg !1663
  store i64 1, i64* %282, align 8, !dbg !1663, !tbaa !1634
  %283 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 1, !dbg !1663
  store i64 %6, i64* %283, align 8, !dbg !1663, !tbaa !1636
  %284 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 3, !dbg !1663
  store i8 2, i8* %284, align 4, !dbg !1663, !tbaa !1637
  %285 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 4, !dbg !1663
  store i8 6, i8* %285, align 1, !dbg !1663, !tbaa !1638
  %286 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 5, !dbg !1663
  store i8 2, i8* %286, align 2, !dbg !1663, !tbaa !1639
  %287 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 6, !dbg !1663
  store i8 0, i8* %287, align 1, !dbg !1663, !tbaa !1640
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1150, metadata !DIExpression()) #6, !dbg !1664
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1151, metadata !DIExpression()) #6, !dbg !1664
  %288 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 3, !dbg !1666
  store i8 %17, i8* %288, align 2, !dbg !1667, !tbaa !1164
  %289 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 2, !dbg !1668
  store i16 %19, i16* %289, align 8, !dbg !1669, !tbaa !1167
  %290 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, !dbg !1670
  %291 = bitcast %struct.network_tuple* %290 to i8*, !dbg !1670
  store i8 %66, i8* %291, align 8, !dbg !1670, !tbaa.struct !1169
  %292 = getelementptr inbounds i8, i8* %281, i64 17, !dbg !1670
  store i8 %68, i8* %292, align 1, !dbg !1670, !tbaa.struct !1467
  %293 = getelementptr inbounds i8, i8* %281, i64 18, !dbg !1670
  store i8 %70, i8* %293, align 2, !dbg !1670, !tbaa.struct !1468
  %294 = getelementptr inbounds i8, i8* %281, i64 19, !dbg !1670
  store i8 %72, i8* %294, align 1, !dbg !1670, !tbaa.struct !1469
  %295 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i64 1, !dbg !1670
  %296 = bitcast i32* %295 to i8*, !dbg !1670
  store i8 %75, i8* %296, align 4, !dbg !1670, !tbaa.struct !1470
  %297 = getelementptr inbounds i8, i8* %281, i64 21, !dbg !1670
  store i8 %77, i8* %297, align 1, !dbg !1670, !tbaa.struct !1471
  %298 = getelementptr inbounds i8, i8* %281, i64 22, !dbg !1670
  store i8 %79, i8* %298, align 2, !dbg !1670, !tbaa.struct !1472
  %299 = getelementptr inbounds i8, i8* %281, i64 23, !dbg !1670
  store i8 %81, i8* %299, align 1, !dbg !1670, !tbaa.struct !1473
  %300 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i64 2, !dbg !1670
  %301 = bitcast i32* %300 to i8*, !dbg !1670
  store i8 %84, i8* %301, align 8, !dbg !1670, !tbaa.struct !1474
  %302 = getelementptr inbounds i8, i8* %281, i64 25, !dbg !1670
  store i8 %86, i8* %302, align 1, !dbg !1670, !tbaa.struct !1475
  %303 = getelementptr inbounds i8, i8* %281, i64 26, !dbg !1670
  store i8 %88, i8* %303, align 2, !dbg !1670, !tbaa.struct !1476
  %304 = getelementptr inbounds i8, i8* %281, i64 27, !dbg !1670
  store i8 %90, i8* %304, align 1, !dbg !1670, !tbaa.struct !1477
  %305 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !1670
  %306 = bitcast i32* %305 to i8*, !dbg !1670
  store i8 %93, i8* %306, align 4, !dbg !1670, !tbaa.struct !1478
  %307 = getelementptr inbounds i8, i8* %281, i64 29, !dbg !1670
  store i8 %95, i8* %307, align 1, !dbg !1670, !tbaa.struct !1479
  %308 = getelementptr inbounds i8, i8* %281, i64 30, !dbg !1670
  store i8 %97, i8* %308, align 2, !dbg !1670, !tbaa.struct !1480
  %309 = getelementptr inbounds i8, i8* %281, i64 31, !dbg !1670
  store i8 %99, i8* %309, align 1, !dbg !1670, !tbaa.struct !1481
  %310 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 0, i32 1, !dbg !1670
  %311 = bitcast i16* %310 to i8*, !dbg !1670
  store i8 %102, i8* %311, align 8, !dbg !1670, !tbaa.struct !1482
  %312 = getelementptr inbounds i8, i8* %281, i64 33, !dbg !1670
  store i8 %104, i8* %312, align 1, !dbg !1670, !tbaa.struct !1483
  %313 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 0, i32 2, !dbg !1670
  %314 = bitcast i16* %313 to i8*, !dbg !1670
  store i8 %107, i8* %314, align 2, !dbg !1670, !tbaa.struct !1484
  %315 = getelementptr inbounds i8, i8* %281, i64 35, !dbg !1670
  store i8 %109, i8* %315, align 1, !dbg !1670, !tbaa.struct !1485
  %316 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 1, !dbg !1671
  %317 = bitcast %struct.flow_address* %316 to i8*, !dbg !1671
  store i8 %22, i8* %317, align 4, !dbg !1671, !tbaa.struct !1169
  %318 = getelementptr inbounds i8, i8* %281, i64 37, !dbg !1671
  store i8 %24, i8* %318, align 1, !dbg !1671, !tbaa.struct !1467
  %319 = getelementptr inbounds i8, i8* %281, i64 38, !dbg !1671
  store i8 %26, i8* %319, align 2, !dbg !1671, !tbaa.struct !1468
  %320 = getelementptr inbounds i8, i8* %281, i64 39, !dbg !1671
  store i8 %28, i8* %320, align 1, !dbg !1671, !tbaa.struct !1469
  %321 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 1, i32 0, i32 0, i32 0, i64 1, !dbg !1671
  %322 = bitcast i32* %321 to i8*, !dbg !1671
  store i8 %31, i8* %322, align 8, !dbg !1671, !tbaa.struct !1470
  %323 = getelementptr inbounds i8, i8* %281, i64 41, !dbg !1671
  store i8 %33, i8* %323, align 1, !dbg !1671, !tbaa.struct !1471
  %324 = getelementptr inbounds i8, i8* %281, i64 42, !dbg !1671
  store i8 %35, i8* %324, align 2, !dbg !1671, !tbaa.struct !1472
  %325 = getelementptr inbounds i8, i8* %281, i64 43, !dbg !1671
  store i8 %37, i8* %325, align 1, !dbg !1671, !tbaa.struct !1473
  %326 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 1, i32 0, i32 0, i32 0, i64 2, !dbg !1671
  %327 = bitcast i32* %326 to i8*, !dbg !1671
  store i8 %40, i8* %327, align 4, !dbg !1671, !tbaa.struct !1474
  %328 = getelementptr inbounds i8, i8* %281, i64 45, !dbg !1671
  store i8 %42, i8* %328, align 1, !dbg !1671, !tbaa.struct !1475
  %329 = getelementptr inbounds i8, i8* %281, i64 46, !dbg !1671
  store i8 %44, i8* %329, align 2, !dbg !1671, !tbaa.struct !1476
  %330 = getelementptr inbounds i8, i8* %281, i64 47, !dbg !1671
  store i8 %46, i8* %330, align 1, !dbg !1671, !tbaa.struct !1477
  %331 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 1, i32 0, i32 0, i32 0, i64 3, !dbg !1671
  %332 = bitcast i32* %331 to i8*, !dbg !1671
  store i8 %49, i8* %332, align 8, !dbg !1671, !tbaa.struct !1478
  %333 = getelementptr inbounds i8, i8* %281, i64 49, !dbg !1671
  store i8 %51, i8* %333, align 1, !dbg !1671, !tbaa.struct !1479
  %334 = getelementptr inbounds i8, i8* %281, i64 50, !dbg !1671
  store i8 %53, i8* %334, align 2, !dbg !1671, !tbaa.struct !1480
  %335 = getelementptr inbounds i8, i8* %281, i64 51, !dbg !1671
  store i8 %55, i8* %335, align 1, !dbg !1671, !tbaa.struct !1481
  %336 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 1, i32 1, !dbg !1671
  %337 = bitcast i16* %336 to i8*, !dbg !1671
  store i8 %58, i8* %337, align 4, !dbg !1671, !tbaa.struct !1482
  %338 = getelementptr inbounds i8, i8* %281, i64 53, !dbg !1671
  store i8 %60, i8* %338, align 1, !dbg !1671, !tbaa.struct !1483
  %339 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 1, i32 2, !dbg !1671
  %340 = bitcast i16* %339 to i8*, !dbg !1671
  store i8 %63, i8* %340, align 2, !dbg !1671, !tbaa.struct !1484
  %341 = getelementptr inbounds i8, i8* %281, i64 55, !dbg !1671
  store i8 %65, i8* %341, align 1, !dbg !1671, !tbaa.struct !1485
  %342 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 4, !dbg !1672
  store i8 0, i8* %342, align 1, !dbg !1673, !tbaa !1173
  %343 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* nonnull %7, i8* bitcast (%struct.anon.5* @events to i8*), i64 4294967295, i8* nonnull %281, i64 64) #6, !dbg !1674
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %281) #6, !dbg !1675
  br label %344, !dbg !1676

344:                                              ; preds = %252, %248, %279, %280, %253, %1, %11
  call void @llvm.lifetime.end.p0i8(i64 44, i8* nonnull %5) #6, !dbg !1677
  ret i32 0, !dbg !1677
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: norecurse nounwind readonly willreturn
define internal fastcc zeroext i1 @is_dualflow_key(%struct.network_tuple* nocapture readonly %0) unnamed_addr #4 !dbg !1490 {
  call void @llvm.dbg.value(metadata %struct.network_tuple* %0, metadata !1489, metadata !DIExpression()), !dbg !1678
  %2 = bitcast %struct.network_tuple* %0 to i8*, !dbg !1679
  %3 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, !dbg !1680
  %4 = bitcast %struct.flow_address* %3 to i8*, !dbg !1681
  call void @llvm.dbg.value(metadata i8* %2, metadata !1496, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i8* %4, metadata !1501, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i32 20, metadata !1502, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i8* %2, metadata !1503, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i8* %4, metadata !1506, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i32 0, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 0, metadata !1507, metadata !DIExpression()), !dbg !1682
  %5 = load i8, i8* %2, align 1, !dbg !1684, !tbaa !888
  %6 = load i8, i8* %4, align 1, !dbg !1685, !tbaa !888
  %7 = icmp eq i8 %5, %6, !dbg !1686
  call void @llvm.dbg.value(metadata i64 0, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %7, label %8, label %14, !dbg !1687

8:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i64 1, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 0, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 1, metadata !1507, metadata !DIExpression()), !dbg !1682
  %9 = getelementptr inbounds i8, i8* %2, i64 1, !dbg !1684
  %10 = load i8, i8* %9, align 1, !dbg !1684, !tbaa !888
  %11 = getelementptr inbounds i8, i8* %4, i64 1, !dbg !1685
  %12 = load i8, i8* %11, align 1, !dbg !1685, !tbaa !888
  %13 = icmp eq i8 %10, %12, !dbg !1686
  call void @llvm.dbg.value(metadata i64 1, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %13, label %18, label %14, !dbg !1687

14:                                               ; preds = %130, %122, %116, %108, %102, %96, %90, %82, %76, %70, %64, %56, %50, %44, %38, %30, %24, %18, %8, %1
  %15 = phi i8 [ %5, %1 ], [ %10, %8 ], [ %20, %18 ], [ %26, %24 ], [ %33, %30 ], [ %40, %38 ], [ %46, %44 ], [ %52, %50 ], [ %59, %56 ], [ %66, %64 ], [ %72, %70 ], [ %78, %76 ], [ %85, %82 ], [ %92, %90 ], [ %98, %96 ], [ %104, %102 ], [ %111, %108 ], [ %118, %116 ], [ %125, %122 ], [ %132, %130 ], !dbg !1684
  %16 = phi i8 [ %6, %1 ], [ %12, %8 ], [ %22, %18 ], [ %28, %24 ], [ %36, %30 ], [ %42, %38 ], [ %48, %44 ], [ %54, %50 ], [ %62, %56 ], [ %68, %64 ], [ %74, %70 ], [ %80, %76 ], [ %88, %82 ], [ %94, %90 ], [ %100, %96 ], [ %106, %102 ], [ %114, %108 ], [ %120, %116 ], [ %128, %122 ], [ %134, %130 ], !dbg !1685
  %17 = icmp ule i8 %15, %16, !dbg !1688
  br label %136, !dbg !1689

18:                                               ; preds = %8
  call void @llvm.dbg.value(metadata i64 2, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 1, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 2, metadata !1507, metadata !DIExpression()), !dbg !1682
  %19 = getelementptr inbounds i8, i8* %2, i64 2, !dbg !1684
  %20 = load i8, i8* %19, align 1, !dbg !1684, !tbaa !888
  %21 = getelementptr inbounds i8, i8* %4, i64 2, !dbg !1685
  %22 = load i8, i8* %21, align 1, !dbg !1685, !tbaa !888
  %23 = icmp eq i8 %20, %22, !dbg !1686
  call void @llvm.dbg.value(metadata i64 2, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %23, label %24, label %14, !dbg !1687

24:                                               ; preds = %18
  call void @llvm.dbg.value(metadata i64 3, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 2, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 3, metadata !1507, metadata !DIExpression()), !dbg !1682
  %25 = getelementptr inbounds i8, i8* %2, i64 3, !dbg !1684
  %26 = load i8, i8* %25, align 1, !dbg !1684, !tbaa !888
  %27 = getelementptr inbounds i8, i8* %4, i64 3, !dbg !1685
  %28 = load i8, i8* %27, align 1, !dbg !1685, !tbaa !888
  %29 = icmp eq i8 %26, %28, !dbg !1686
  call void @llvm.dbg.value(metadata i64 3, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %29, label %30, label %14, !dbg !1687

30:                                               ; preds = %24
  call void @llvm.dbg.value(metadata i64 4, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 3, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 4, metadata !1507, metadata !DIExpression()), !dbg !1682
  %31 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1, !dbg !1684
  %32 = bitcast i32* %31 to i8*, !dbg !1684
  %33 = load i8, i8* %32, align 1, !dbg !1684, !tbaa !888
  %34 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i64 1, !dbg !1685
  %35 = bitcast i32* %34 to i8*, !dbg !1685
  %36 = load i8, i8* %35, align 1, !dbg !1685, !tbaa !888
  %37 = icmp eq i8 %33, %36, !dbg !1686
  call void @llvm.dbg.value(metadata i64 4, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %37, label %38, label %14, !dbg !1687

38:                                               ; preds = %30
  call void @llvm.dbg.value(metadata i64 5, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 4, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 5, metadata !1507, metadata !DIExpression()), !dbg !1682
  %39 = getelementptr inbounds i8, i8* %2, i64 5, !dbg !1684
  %40 = load i8, i8* %39, align 1, !dbg !1684, !tbaa !888
  %41 = getelementptr inbounds i8, i8* %4, i64 5, !dbg !1685
  %42 = load i8, i8* %41, align 1, !dbg !1685, !tbaa !888
  %43 = icmp eq i8 %40, %42, !dbg !1686
  call void @llvm.dbg.value(metadata i64 5, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %43, label %44, label %14, !dbg !1687

44:                                               ; preds = %38
  call void @llvm.dbg.value(metadata i64 6, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 5, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 6, metadata !1507, metadata !DIExpression()), !dbg !1682
  %45 = getelementptr inbounds i8, i8* %2, i64 6, !dbg !1684
  %46 = load i8, i8* %45, align 1, !dbg !1684, !tbaa !888
  %47 = getelementptr inbounds i8, i8* %4, i64 6, !dbg !1685
  %48 = load i8, i8* %47, align 1, !dbg !1685, !tbaa !888
  %49 = icmp eq i8 %46, %48, !dbg !1686
  call void @llvm.dbg.value(metadata i64 6, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %49, label %50, label %14, !dbg !1687

50:                                               ; preds = %44
  call void @llvm.dbg.value(metadata i64 7, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 6, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 7, metadata !1507, metadata !DIExpression()), !dbg !1682
  %51 = getelementptr inbounds i8, i8* %2, i64 7, !dbg !1684
  %52 = load i8, i8* %51, align 1, !dbg !1684, !tbaa !888
  %53 = getelementptr inbounds i8, i8* %4, i64 7, !dbg !1685
  %54 = load i8, i8* %53, align 1, !dbg !1685, !tbaa !888
  %55 = icmp eq i8 %52, %54, !dbg !1686
  call void @llvm.dbg.value(metadata i64 7, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %55, label %56, label %14, !dbg !1687

56:                                               ; preds = %50
  call void @llvm.dbg.value(metadata i64 8, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 7, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 8, metadata !1507, metadata !DIExpression()), !dbg !1682
  %57 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2, !dbg !1684
  %58 = bitcast i32* %57 to i8*, !dbg !1684
  %59 = load i8, i8* %58, align 1, !dbg !1684, !tbaa !888
  %60 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i64 2, !dbg !1685
  %61 = bitcast i32* %60 to i8*, !dbg !1685
  %62 = load i8, i8* %61, align 1, !dbg !1685, !tbaa !888
  %63 = icmp eq i8 %59, %62, !dbg !1686
  call void @llvm.dbg.value(metadata i64 8, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %63, label %64, label %14, !dbg !1687

64:                                               ; preds = %56
  call void @llvm.dbg.value(metadata i64 9, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 8, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 9, metadata !1507, metadata !DIExpression()), !dbg !1682
  %65 = getelementptr inbounds i8, i8* %2, i64 9, !dbg !1684
  %66 = load i8, i8* %65, align 1, !dbg !1684, !tbaa !888
  %67 = getelementptr inbounds i8, i8* %4, i64 9, !dbg !1685
  %68 = load i8, i8* %67, align 1, !dbg !1685, !tbaa !888
  %69 = icmp eq i8 %66, %68, !dbg !1686
  call void @llvm.dbg.value(metadata i64 9, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %69, label %70, label %14, !dbg !1687

70:                                               ; preds = %64
  call void @llvm.dbg.value(metadata i64 10, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 9, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 10, metadata !1507, metadata !DIExpression()), !dbg !1682
  %71 = getelementptr inbounds i8, i8* %2, i64 10, !dbg !1684
  %72 = load i8, i8* %71, align 1, !dbg !1684, !tbaa !888
  %73 = getelementptr inbounds i8, i8* %4, i64 10, !dbg !1685
  %74 = load i8, i8* %73, align 1, !dbg !1685, !tbaa !888
  %75 = icmp eq i8 %72, %74, !dbg !1686
  call void @llvm.dbg.value(metadata i64 10, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %75, label %76, label %14, !dbg !1687

76:                                               ; preds = %70
  call void @llvm.dbg.value(metadata i64 11, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 10, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 11, metadata !1507, metadata !DIExpression()), !dbg !1682
  %77 = getelementptr inbounds i8, i8* %2, i64 11, !dbg !1684
  %78 = load i8, i8* %77, align 1, !dbg !1684, !tbaa !888
  %79 = getelementptr inbounds i8, i8* %4, i64 11, !dbg !1685
  %80 = load i8, i8* %79, align 1, !dbg !1685, !tbaa !888
  %81 = icmp eq i8 %78, %80, !dbg !1686
  call void @llvm.dbg.value(metadata i64 11, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %81, label %82, label %14, !dbg !1687

82:                                               ; preds = %76
  call void @llvm.dbg.value(metadata i64 12, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 11, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 12, metadata !1507, metadata !DIExpression()), !dbg !1682
  %83 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !1684
  %84 = bitcast i32* %83 to i8*, !dbg !1684
  %85 = load i8, i8* %84, align 1, !dbg !1684, !tbaa !888
  %86 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i64 3, !dbg !1685
  %87 = bitcast i32* %86 to i8*, !dbg !1685
  %88 = load i8, i8* %87, align 1, !dbg !1685, !tbaa !888
  %89 = icmp eq i8 %85, %88, !dbg !1686
  call void @llvm.dbg.value(metadata i64 12, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %89, label %90, label %14, !dbg !1687

90:                                               ; preds = %82
  call void @llvm.dbg.value(metadata i64 13, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 12, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 13, metadata !1507, metadata !DIExpression()), !dbg !1682
  %91 = getelementptr inbounds i8, i8* %2, i64 13, !dbg !1684
  %92 = load i8, i8* %91, align 1, !dbg !1684, !tbaa !888
  %93 = getelementptr inbounds i8, i8* %4, i64 13, !dbg !1685
  %94 = load i8, i8* %93, align 1, !dbg !1685, !tbaa !888
  %95 = icmp eq i8 %92, %94, !dbg !1686
  call void @llvm.dbg.value(metadata i64 13, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %95, label %96, label %14, !dbg !1687

96:                                               ; preds = %90
  call void @llvm.dbg.value(metadata i64 14, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 13, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 14, metadata !1507, metadata !DIExpression()), !dbg !1682
  %97 = getelementptr inbounds i8, i8* %2, i64 14, !dbg !1684
  %98 = load i8, i8* %97, align 1, !dbg !1684, !tbaa !888
  %99 = getelementptr inbounds i8, i8* %4, i64 14, !dbg !1685
  %100 = load i8, i8* %99, align 1, !dbg !1685, !tbaa !888
  %101 = icmp eq i8 %98, %100, !dbg !1686
  call void @llvm.dbg.value(metadata i64 14, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %101, label %102, label %14, !dbg !1687

102:                                              ; preds = %96
  call void @llvm.dbg.value(metadata i64 15, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 14, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 15, metadata !1507, metadata !DIExpression()), !dbg !1682
  %103 = getelementptr inbounds i8, i8* %2, i64 15, !dbg !1684
  %104 = load i8, i8* %103, align 1, !dbg !1684, !tbaa !888
  %105 = getelementptr inbounds i8, i8* %4, i64 15, !dbg !1685
  %106 = load i8, i8* %105, align 1, !dbg !1685, !tbaa !888
  %107 = icmp eq i8 %104, %106, !dbg !1686
  call void @llvm.dbg.value(metadata i64 15, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %107, label %108, label %14, !dbg !1687

108:                                              ; preds = %102
  call void @llvm.dbg.value(metadata i64 16, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 15, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 16, metadata !1507, metadata !DIExpression()), !dbg !1682
  %109 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 0, i32 1, !dbg !1684
  %110 = bitcast i16* %109 to i8*, !dbg !1684
  %111 = load i8, i8* %110, align 1, !dbg !1684, !tbaa !888
  %112 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, i32 1, !dbg !1685
  %113 = bitcast i16* %112 to i8*, !dbg !1685
  %114 = load i8, i8* %113, align 1, !dbg !1685, !tbaa !888
  %115 = icmp eq i8 %111, %114, !dbg !1686
  call void @llvm.dbg.value(metadata i64 16, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %115, label %116, label %14, !dbg !1687

116:                                              ; preds = %108
  call void @llvm.dbg.value(metadata i64 17, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 16, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 17, metadata !1507, metadata !DIExpression()), !dbg !1682
  %117 = getelementptr inbounds i8, i8* %2, i64 17, !dbg !1684
  %118 = load i8, i8* %117, align 1, !dbg !1684, !tbaa !888
  %119 = getelementptr inbounds i8, i8* %4, i64 17, !dbg !1685
  %120 = load i8, i8* %119, align 1, !dbg !1685, !tbaa !888
  %121 = icmp eq i8 %118, %120, !dbg !1686
  call void @llvm.dbg.value(metadata i64 17, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %121, label %122, label %14, !dbg !1687

122:                                              ; preds = %116
  call void @llvm.dbg.value(metadata i64 18, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 17, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 18, metadata !1507, metadata !DIExpression()), !dbg !1682
  %123 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 0, i32 2, !dbg !1684
  %124 = bitcast i16* %123 to i8*, !dbg !1684
  %125 = load i8, i8* %124, align 1, !dbg !1684, !tbaa !888
  %126 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, i32 2, !dbg !1685
  %127 = bitcast i16* %126 to i8*, !dbg !1685
  %128 = load i8, i8* %127, align 1, !dbg !1685, !tbaa !888
  %129 = icmp eq i8 %125, %128, !dbg !1686
  call void @llvm.dbg.value(metadata i64 18, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %129, label %130, label %14, !dbg !1687

130:                                              ; preds = %122
  call void @llvm.dbg.value(metadata i64 19, metadata !1507, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 18, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  call void @llvm.dbg.value(metadata i64 19, metadata !1507, metadata !DIExpression()), !dbg !1682
  %131 = getelementptr inbounds i8, i8* %2, i64 19, !dbg !1684
  %132 = load i8, i8* %131, align 1, !dbg !1684, !tbaa !888
  %133 = getelementptr inbounds i8, i8* %4, i64 19, !dbg !1685
  %134 = load i8, i8* %133, align 1, !dbg !1685, !tbaa !888
  %135 = icmp eq i8 %132, %134, !dbg !1686
  call void @llvm.dbg.value(metadata i64 19, metadata !1507, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1682
  br i1 %135, label %136, label %14, !dbg !1687

136:                                              ; preds = %14, %130
  %137 = phi i1 [ %17, %14 ], [ true, %130 ]
  ret i1 %137, !dbg !1690
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
define internal fastcc void @pping_parsed_packet(i8* %0, %struct.packet_info* %1) unnamed_addr #3 !dbg !1691 {
  %3 = alloca %struct.flow_event, align 8
  %4 = alloca %struct.flow_event, align 8
  %5 = alloca %struct.rtt_event, align 8
  %6 = alloca %struct.flow_event, align 8
  %7 = alloca %struct.bpf_fib_lookup, align 4
  %8 = alloca %struct.map_full_event, align 8
  %9 = alloca %struct.map_full_event, align 8
  %10 = alloca %struct.dual_flow_state, align 8
  call void @llvm.dbg.value(metadata i8* %0, metadata !1695, metadata !DIExpression()), !dbg !1700
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1696, metadata !DIExpression()), !dbg !1700
  call void @llvm.dbg.value(metadata i8* %0, metadata !1701, metadata !DIExpression()) #6, !dbg !1708
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1706, metadata !DIExpression()) #6, !dbg !1708
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1710, metadata !DIExpression()) #6, !dbg !1715
  %11 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 8, !dbg !1717
  %12 = load i8, i8* %11, align 1, !dbg !1717, !tbaa !1159, !range !806
  %13 = icmp eq i8 %12, 0, !dbg !1717
  %14 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, !dbg !1718
  %15 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, !dbg !1718
  %16 = select i1 %13, %struct.network_tuple* %15, %struct.network_tuple* %14, !dbg !1718
  %17 = bitcast %struct.network_tuple* %16 to i8*, !dbg !1719
  %18 = tail call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.6* @flow_state to i8*), i8* nonnull %17) #6, !dbg !1720
  call void @llvm.dbg.value(metadata i8* %18, metadata !1707, metadata !DIExpression()) #6, !dbg !1708
  %19 = icmp eq i8* %18, null, !dbg !1721
  br i1 %19, label %22, label %20, !dbg !1723

20:                                               ; preds = %2
  %21 = bitcast i8* %18 to %struct.dual_flow_state*, !dbg !1720
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %21, metadata !1707, metadata !DIExpression()) #6, !dbg !1708
  br label %89, !dbg !1724

22:                                               ; preds = %2
  %23 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 9, !dbg !1725
  %24 = load i8, i8* %23, align 8, !dbg !1725, !tbaa !1076, !range !806
  %25 = icmp eq i8 %24, 0, !dbg !1725
  br i1 %25, label %431, label %26, !dbg !1727

26:                                               ; preds = %22
  %27 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 11, !dbg !1728
  %28 = load i8, i8* %27, align 2, !dbg !1728, !tbaa !1085
  %29 = and i8 %28, -2, !dbg !1729
  %30 = icmp eq i8 %29, 2, !dbg !1729
  br i1 %30, label %431, label %31, !dbg !1729

31:                                               ; preds = %26
  call void @llvm.dbg.value(metadata i8* %0, metadata !1730, metadata !DIExpression()) #6, !dbg !1736
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1733, metadata !DIExpression()) #6, !dbg !1736
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1710, metadata !DIExpression()) #6, !dbg !1738
  %32 = load i8, i8* %11, align 1, !dbg !1740, !tbaa !1159, !range !806
  %33 = icmp eq i8 %32, 0, !dbg !1740
  %34 = select i1 %33, %struct.network_tuple* %15, %struct.network_tuple* %14, !dbg !1741
  call void @llvm.dbg.value(metadata %struct.network_tuple* %34, metadata !1734, metadata !DIExpression()) #6, !dbg !1736
  %35 = bitcast %struct.dual_flow_state* %10 to i8*, !dbg !1742
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %35) #6, !dbg !1742
  call void @llvm.dbg.declare(metadata %struct.dual_flow_state* %10, metadata !1735, metadata !DIExpression()) #6, !dbg !1743
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(144) %35, i8 0, i64 144, i1 false) #6, !dbg !1743
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %10, metadata !1744, metadata !DIExpression()) #6, !dbg !1752
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1749, metadata !DIExpression()) #6, !dbg !1752
  call void @llvm.dbg.value(metadata %struct.flow_state* undef, metadata !1750, metadata !DIExpression()) #6, !dbg !1752
  call void @llvm.dbg.value(metadata %struct.flow_state* undef, metadata !1751, metadata !DIExpression()) #6, !dbg !1752
  call void @llvm.dbg.value(metadata %struct.flow_state* undef, metadata !1754, metadata !DIExpression()) #6, !dbg !1760
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1759, metadata !DIExpression()) #6, !dbg !1760
  %36 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %10, i64 0, i32 1, i32 9, !dbg !1762
  %37 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %10, i64 0, i32 0, i32 9, !dbg !1762
  %38 = select i1 %33, i8* %36, i8* %37, !dbg !1762
  store i8 1, i8* %38, align 8, !dbg !1763, !tbaa !1556
  %39 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !1764
  %40 = load i64, i64* %39, align 8, !dbg !1764, !tbaa !620
  %41 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %10, i64 0, i32 1, i32 2, !dbg !1765
  %42 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %10, i64 0, i32 0, i32 2, !dbg !1765
  %43 = select i1 %33, i64* %41, i64* %42, !dbg !1765
  store i64 %40, i64* %43, align 8, !dbg !1766, !tbaa !1559
  %44 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 1, !dbg !1767
  %45 = load i32, i32* %44, align 4, !dbg !1767, !tbaa !1073
  %46 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %10, i64 0, i32 1, i32 7, !dbg !1768
  %47 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %10, i64 0, i32 0, i32 7, !dbg !1768
  %48 = select i1 %33, i32* %46, i32* %47, !dbg !1768
  store i32 %45, i32* %48, align 8, !dbg !1769, !tbaa !1770
  %49 = icmp eq i8 %28, 1, !dbg !1771
  br i1 %49, label %50, label %53, !dbg !1772

50:                                               ; preds = %31
  %51 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 12, !dbg !1773
  %52 = load i8, i8* %51, align 1, !dbg !1773, !tbaa !1088
  br label %53, !dbg !1772

53:                                               ; preds = %50, %31
  %54 = phi i8 [ %52, %50 ], [ 3, %31 ]
  %55 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %10, i64 0, i32 1, i32 10, !dbg !1774
  %56 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %10, i64 0, i32 0, i32 10, !dbg !1774
  %57 = select i1 %33, i8* %55, i8* %56, !dbg !1774
  store i8 %54, i8* %57, align 1, !dbg !1775, !tbaa !1776
  %58 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %10, i64 0, i32 1, i32 11, !dbg !1777
  %59 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %10, i64 0, i32 0, i32 11, !dbg !1777
  %60 = select i1 %33, i8* %58, i8* %59, !dbg !1777
  store i8 0, i8* %60, align 2, !dbg !1778, !tbaa !1779
  call void @llvm.dbg.value(metadata %struct.flow_state* undef, metadata !1780, metadata !DIExpression()) #6, !dbg !1785
  %61 = select i1 %33, i8* %37, i8* %36, !dbg !1787
  store i8 0, i8* %61, align 8, !dbg !1788, !tbaa !1556
  %62 = select i1 %33, i8* %59, i8* %58, !dbg !1789
  store i8 0, i8* %62, align 2, !dbg !1790, !tbaa !1779
  %63 = bitcast %struct.network_tuple* %34 to i8*, !dbg !1791
  %64 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* bitcast (%struct.anon.6* @flow_state to i8*), i8* nonnull %63, i8* nonnull %35, i64 1) #6, !dbg !1793
  %65 = icmp eq i64 %64, 0, !dbg !1794
  br i1 %65, label %84, label %66, !dbg !1795

66:                                               ; preds = %53
  call void @llvm.dbg.value(metadata i8* %0, metadata !1796, metadata !DIExpression()) #6, !dbg !1811
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1801, metadata !DIExpression()) #6, !dbg !1811
  call void @llvm.dbg.value(metadata i8 0, metadata !1802, metadata !DIExpression()) #6, !dbg !1811
  %67 = bitcast %struct.map_full_event* %9 to i8*, !dbg !1814
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %67) #6, !dbg !1814
  call void @llvm.dbg.declare(metadata %struct.map_full_event* %9, metadata !1803, metadata !DIExpression()) #6, !dbg !1815
  %68 = load i64, i64* %39, align 8, !dbg !1816, !tbaa !620
  %69 = load volatile i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 0), align 8, !dbg !1818, !tbaa !1359
  %70 = icmp ult i64 %68, %69, !dbg !1819
  br i1 %70, label %83, label %71, !dbg !1820

71:                                               ; preds = %66
  %72 = load volatile i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 0), align 8, !dbg !1821, !tbaa !1359
  %73 = sub i64 %68, %72, !dbg !1822
  %74 = icmp ult i64 %73, 1000000000, !dbg !1823
  br i1 %74, label %83, label %75, !dbg !1824

75:                                               ; preds = %71
  store volatile i64 %68, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 0), align 8, !dbg !1825, !tbaa !1359
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(64) %67, i8 0, i64 64, i1 false) #6, !dbg !1826
  %76 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %9, i64 0, i32 0, !dbg !1827
  store i64 3, i64* %76, align 8, !dbg !1828, !tbaa !1829
  %77 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %9, i64 0, i32 1, !dbg !1831
  store i64 %68, i64* %77, align 8, !dbg !1832, !tbaa !1833
  %78 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %9, i64 0, i32 2, !dbg !1834
  %79 = bitcast %struct.network_tuple* %78 to i8*, !dbg !1835
  %80 = bitcast %struct.network_tuple* %14 to i8*, !dbg !1835
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(44) %79, i8* nonnull align 4 dereferenceable(44) %80, i64 44, i1 false) #6, !dbg !1835, !tbaa.struct !1373
  %81 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %9, i64 0, i32 3, !dbg !1836
  store i8 0, i8* %81, align 4, !dbg !1837, !tbaa !1838
  %82 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* %0, i8* bitcast (%struct.anon.5* @events to i8*), i64 4294967295, i8* nonnull %67, i64 64) #6, !dbg !1839
  br label %83, !dbg !1840

83:                                               ; preds = %75, %71, %66
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %67) #6, !dbg !1840
  br label %87, !dbg !1841

84:                                               ; preds = %53
  %85 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.6* @flow_state to i8*), i8* nonnull %63) #6, !dbg !1842
  %86 = bitcast i8* %85 to %struct.dual_flow_state*, !dbg !1842
  br label %87, !dbg !1843

87:                                               ; preds = %84, %83
  %88 = phi %struct.dual_flow_state* [ null, %83 ], [ %86, %84 ], !dbg !1736
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %35) #6, !dbg !1844
  br label %89, !dbg !1845

89:                                               ; preds = %20, %87
  %90 = phi %struct.dual_flow_state* [ %21, %20 ], [ %88, %87 ], !dbg !1708
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %90, metadata !1697, metadata !DIExpression()), !dbg !1700
  %91 = icmp eq %struct.dual_flow_state* %90, null, !dbg !1846
  br i1 %91, label %431, label %92, !dbg !1848

92:                                               ; preds = %89
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %90, metadata !1849, metadata !DIExpression()), !dbg !1855
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1854, metadata !DIExpression()), !dbg !1855
  %93 = load i8, i8* %11, align 1, !dbg !1857, !tbaa !1159, !range !806
  %94 = icmp eq i8 %93, 0, !dbg !1857
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %90, metadata !1401, metadata !DIExpression()), !dbg !1858
  call void @llvm.dbg.value(metadata i1 %94, metadata !1406, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1858
  %95 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %90, i64 0, i32 0, !dbg !1860
  %96 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %90, i64 0, i32 1, !dbg !1860
  %97 = select i1 %94, %struct.flow_state* %96, %struct.flow_state* %95, !dbg !1860
  call void @llvm.dbg.value(metadata %struct.flow_state* %97, metadata !1698, metadata !DIExpression()), !dbg !1700
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1861, metadata !DIExpression()), !dbg !1867
  call void @llvm.dbg.value(metadata %struct.flow_state* %97, metadata !1866, metadata !DIExpression()), !dbg !1867
  %98 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 9, !dbg !1869
  %99 = load i8, i8* %98, align 8, !dbg !1869, !tbaa !1556
  switch i8 %99, label %121 [
    i8 0, label %100
    i8 3, label %266
  ], !dbg !1871

100:                                              ; preds = %92
  %101 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 9, !dbg !1872
  %102 = load i8, i8* %101, align 8, !dbg !1872, !tbaa !1076, !range !806
  %103 = icmp eq i8 %102, 0, !dbg !1872
  br i1 %103, label %266, label %104, !dbg !1873

104:                                              ; preds = %100
  call void @llvm.dbg.value(metadata %struct.flow_state* %97, metadata !1754, metadata !DIExpression()), !dbg !1874
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1759, metadata !DIExpression()), !dbg !1874
  store i8 1, i8* %98, align 8, !dbg !1876, !tbaa !1556
  %105 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !1877
  %106 = load i64, i64* %105, align 8, !dbg !1877, !tbaa !620
  %107 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 2, !dbg !1878
  store i64 %106, i64* %107, align 8, !dbg !1879, !tbaa !1559
  %108 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 1, !dbg !1880
  %109 = load i32, i32* %108, align 4, !dbg !1880, !tbaa !1073
  %110 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 7, !dbg !1881
  store i32 %109, i32* %110, align 8, !dbg !1882, !tbaa !1770
  %111 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 11, !dbg !1883
  %112 = load i8, i8* %111, align 2, !dbg !1883, !tbaa !1085
  %113 = icmp eq i8 %112, 1, !dbg !1884
  br i1 %113, label %114, label %117, !dbg !1885

114:                                              ; preds = %104
  %115 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 12, !dbg !1886
  %116 = load i8, i8* %115, align 1, !dbg !1886, !tbaa !1088
  br label %117, !dbg !1885

117:                                              ; preds = %104, %114
  %118 = phi i8 [ %116, %114 ], [ 3, %104 ]
  %119 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 10, !dbg !1887
  store i8 %118, i8* %119, align 1, !dbg !1888, !tbaa !1776
  %120 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 11, !dbg !1889
  store i8 0, i8* %120, align 2, !dbg !1890, !tbaa !1779
  call void @llvm.dbg.value(metadata %struct.flow_state* %97, metadata !1891, metadata !DIExpression()) #6, !dbg !1898
  call void @llvm.dbg.value(metadata i8* %0, metadata !1896, metadata !DIExpression()) #6, !dbg !1898
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1897, metadata !DIExpression()) #6, !dbg !1898
  call void @llvm.dbg.value(metadata %struct.flow_state* %97, metadata !1547, metadata !DIExpression()) #6, !dbg !1900
  br label %121, !dbg !1903

121:                                              ; preds = %92, %117
  %122 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 3, !dbg !1904
  %123 = load i64, i64* %122, align 8, !dbg !1907, !tbaa !1908
  %124 = add i64 %123, 1, !dbg !1907
  store i64 %124, i64* %122, align 8, !dbg !1907, !tbaa !1908
  %125 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 1, !dbg !1909
  %126 = load i32, i32* %125, align 8, !dbg !1909, !tbaa !1191
  %127 = zext i32 %126 to i64, !dbg !1910
  %128 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 4, !dbg !1911
  %129 = load i64, i64* %128, align 8, !dbg !1912, !tbaa !1913
  %130 = add i64 %129, %127, !dbg !1912
  store i64 %130, i64* %128, align 8, !dbg !1912, !tbaa !1913
  %131 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 9, !dbg !1914
  %132 = load i8, i8* %131, align 8, !dbg !1914, !tbaa !1076, !range !806
  %133 = icmp eq i8 %132, 0, !dbg !1914
  br i1 %133, label %266, label %134, !dbg !1915

134:                                              ; preds = %121
  %135 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 5), align 1, !dbg !1916, !tbaa !1918, !range !806
  %136 = icmp eq i8 %135, 0, !dbg !1916
  br i1 %136, label %185, label %137, !dbg !1919

137:                                              ; preds = %134
  %138 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 7, !dbg !1920
  %139 = load i8, i8* %138, align 2, !dbg !1920, !tbaa !1253, !range !806
  %140 = icmp eq i8 %139, 0, !dbg !1920
  br i1 %140, label %185, label %141, !dbg !1921

141:                                              ; preds = %137
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1922, metadata !DIExpression()) #6, !dbg !1935
  call void @llvm.dbg.value(metadata i8* %0, metadata !1927, metadata !DIExpression()) #6, !dbg !1935
  %142 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 0, !dbg !1937
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %142) #6, !dbg !1937
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %7, metadata !1929, metadata !DIExpression()) #6, !dbg !1938
  %143 = getelementptr inbounds i8, i8* %142, i64 12, !dbg !1939
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %143, i8 0, i64 52, i1 false) #6, !dbg !1939
  %144 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 4, !dbg !1940
  %145 = load i32, i32* %144, align 4, !dbg !1940, !tbaa !1256
  %146 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 5, !dbg !1941
  store i32 %145, i32* %146, align 4, !dbg !1942, !tbaa !1943
  %147 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 3, !dbg !1945
  %148 = load i8, i8* %147, align 2, !dbg !1945, !tbaa !688
  store i8 %148, i8* %142, align 4, !dbg !1946, !tbaa !1947
  %149 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 6, !dbg !1948
  %150 = load i16, i16* %149, align 4, !dbg !1948, !tbaa !1949
  %151 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 4, !dbg !1950
  store i16 %150, i16* %151, align 2, !dbg !1951, !tbaa !1952
  switch i8 %148, label %175 [
    i8 2, label %152
    i8 10, label %164
  ], !dbg !1953

152:                                              ; preds = %141
  %153 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 5, !dbg !1954
  %154 = bitcast %union.anon.4* %153 to i8*, !dbg !1956
  %155 = load i8, i8* %154, align 8, !dbg !1956, !tbaa !888
  %156 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 6, !dbg !1957
  %157 = bitcast %union.anon.14* %156 to i8*, !dbg !1957
  store i8 %155, i8* %157, align 4, !dbg !1958, !tbaa !888
  call void @llvm.dbg.value(metadata %struct.network_tuple* %14, metadata !1959, metadata !DIExpression()) #6, !dbg !1964
  %158 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !1966
  %159 = load i32, i32* %158, align 4, !dbg !1966, !tbaa !888
  %160 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 7, i32 0, i64 0, !dbg !1967
  store i32 %159, i32* %160, align 4, !dbg !1968, !tbaa !888
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1959, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)) #6, !dbg !1969
  %161 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 1, i32 0, i32 0, i32 0, i64 3, !dbg !1971
  %162 = load i32, i32* %161, align 4, !dbg !1971, !tbaa !888
  %163 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 8, i32 0, i64 0, !dbg !1972
  store i32 %162, i32* %163, align 4, !dbg !1973, !tbaa !888
  br label %175, !dbg !1974

164:                                              ; preds = %141
  %165 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 7, i32 0, i64 0, !dbg !1975
  call void @llvm.dbg.value(metadata i32* %165, metadata !1930, metadata !DIExpression()) #6, !dbg !1976
  %166 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 8, i32 0, i64 0, !dbg !1977
  call void @llvm.dbg.value(metadata i32* %166, metadata !1934, metadata !DIExpression()) #6, !dbg !1976
  %167 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 5, i32 0, !dbg !1978
  %168 = load i32, i32* %167, align 8, !dbg !1978, !tbaa !888
  %169 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 6, i32 0, !dbg !1979
  store i32 %168, i32* %169, align 4, !dbg !1980, !tbaa !888
  %170 = bitcast i32* %165 to i8*, !dbg !1981
  %171 = bitcast %struct.network_tuple* %14 to i8*, !dbg !1981
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %170, i8* nonnull align 4 dereferenceable(16) %171, i64 16, i1 false) #6, !dbg !1981, !tbaa.struct !1135
  %172 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 1, i32 0, !dbg !1982
  %173 = bitcast i32* %166 to i8*, !dbg !1982
  %174 = bitcast %struct.in6_addr* %172 to i8*, !dbg !1982
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %173, i8* nonnull align 4 dereferenceable(16) %174, i64 16, i1 false) #6, !dbg !1982, !tbaa.struct !1135
  br label %175, !dbg !1983

175:                                              ; preds = %164, %152, %141
  %176 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 2, !dbg !1984
  %177 = load i16, i16* %176, align 4, !dbg !1984, !tbaa !801
  %178 = trunc i16 %177 to i8, !dbg !1985
  %179 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 1, !dbg !1986
  store i8 %178, i8* %179, align 1, !dbg !1987, !tbaa !1988
  %180 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 2, !dbg !1989
  store i16 0, i16* %180, align 2, !dbg !1990, !tbaa !1991
  %181 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %7, i64 0, i32 3, !dbg !1992
  store i16 0, i16* %181, align 4, !dbg !1993, !tbaa !1994
  %182 = call i64 inttoptr (i64 69 to i64 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* %0, %struct.bpf_fib_lookup* nonnull %7, i32 64, i32 0) #6, !dbg !1995
  call void @llvm.dbg.value(metadata i64 %182, metadata !1928, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1935
  %183 = and i64 %182, 4294967294, !dbg !1996
  %184 = icmp eq i64 %183, 4, !dbg !1996
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %142) #6, !dbg !1997
  br i1 %184, label %266, label %185, !dbg !1998

185:                                              ; preds = %175, %137, %134
  %186 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 11, !dbg !1999
  %187 = load i8, i8* %186, align 2, !dbg !1999, !tbaa !1779, !range !806
  %188 = icmp eq i8 %187, 0, !dbg !1999
  br i1 %188, label %189, label %197, !dbg !2001

189:                                              ; preds = %185
  %190 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 13, !dbg !2002
  %191 = load i8, i8* %190, align 4, !dbg !2002, !tbaa !1091, !range !806
  %192 = icmp eq i8 %191, 0, !dbg !2002
  br i1 %192, label %193, label %197, !dbg !2003

193:                                              ; preds = %189
  %194 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 1, !dbg !2004
  %195 = load i32, i32* %194, align 4, !dbg !2004, !tbaa !1073
  %196 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 7, !dbg !2005
  store i32 %195, i32* %196, align 8, !dbg !2006, !tbaa !1770
  br label %236, !dbg !2007

197:                                              ; preds = %189, %185
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2009, metadata !DIExpression(DW_OP_plus_uconst, 12, DW_OP_stack_value)) #6, !dbg !2015
  call void @llvm.dbg.value(metadata %struct.flow_state* %97, metadata !2014, metadata !DIExpression()) #6, !dbg !2015
  %198 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 0, i32 2, !dbg !2017
  %199 = load i16, i16* %198, align 4, !dbg !2017, !tbaa !2019
  %200 = icmp eq i16 %199, 6, !dbg !2020
  %201 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, i32 1, !dbg !2015
  %202 = load i32, i32* %201, align 4, !dbg !2015, !tbaa !2021
  %203 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 7, !dbg !2015
  %204 = load i32, i32* %203, align 8, !dbg !2015, !tbaa !1770
  %205 = sub i32 %202, %204, !dbg !2022
  %206 = icmp sgt i32 %205, 0, !dbg !2022
  %207 = icmp ne i32 %202, %204, !dbg !2022
  %208 = select i1 %200, i1 %206, i1 %207, !dbg !2022
  br i1 %208, label %209, label %266, !dbg !2023

209:                                              ; preds = %197
  store i32 %202, i32* %203, align 8, !dbg !2006, !tbaa !1770
  br i1 %188, label %236, label %210, !dbg !2007

210:                                              ; preds = %209
  %211 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2024
  %212 = load i64, i64* %211, align 8, !dbg !2024, !tbaa !620
  %213 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 2, !dbg !2025
  %214 = load i64, i64* %213, align 8, !dbg !2025, !tbaa !1559
  %215 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 2), align 8, !dbg !2026, !tbaa !2027, !range !806
  %216 = icmp eq i8 %215, 0, !dbg !2026
  %217 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 1, !dbg !2028
  %218 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 0, !dbg !2028
  %219 = select i1 %216, i64* %218, i64* %217, !dbg !2028
  %220 = load i64, i64* %219, align 8, !dbg !2028, !tbaa !1359
  call void @llvm.dbg.value(metadata i64 %212, metadata !2029, metadata !DIExpression()) #6, !dbg !2036
  call void @llvm.dbg.value(metadata i64 %214, metadata !2034, metadata !DIExpression()) #6, !dbg !2036
  call void @llvm.dbg.value(metadata i64 %220, metadata !2035, metadata !DIExpression()) #6, !dbg !2036
  %221 = icmp ult i64 %212, %214, !dbg !2038
  br i1 %221, label %266, label %222, !dbg !2040

222:                                              ; preds = %210
  %223 = load volatile i64, i64* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 1), align 8, !dbg !2041, !tbaa !2043
  %224 = icmp ne i64 %223, 0, !dbg !2044
  %225 = icmp ne i64 %220, 0
  %226 = and i1 %225, %224, !dbg !2045
  %227 = sub i64 %212, %214, !dbg !2036
  br i1 %226, label %228, label %233, !dbg !2045

228:                                              ; preds = %222
  %229 = load volatile i64, i64* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 1), align 8, !dbg !2046, !tbaa !2043
  %230 = mul i64 %229, %220, !dbg !2046
  %231 = lshr i64 %230, 16, !dbg !2046
  %232 = icmp ult i64 %227, %231, !dbg !2047
  br i1 %232, label %266, label %236, !dbg !2048

233:                                              ; preds = %222
  %234 = load volatile i64, i64* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 0), align 8, !dbg !2049, !tbaa !2050
  %235 = icmp ult i64 %227, %234, !dbg !2051
  br i1 %235, label %266, label %236, !dbg !2048

236:                                              ; preds = %233, %228, %209, %193
  %237 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, !dbg !2052
  store i8 1, i8* %186, align 2, !dbg !2053, !tbaa !1779
  %238 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2054
  %239 = load i64, i64* %238, align 8, !dbg !2054, !tbaa !620
  %240 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 2, !dbg !2055
  store i64 %239, i64* %240, align 8, !dbg !2056, !tbaa !1559
  %241 = bitcast %struct.packet_id* %237 to i8*, !dbg !2057
  %242 = bitcast %struct.packet_info* %1 to i8*, !dbg !2059
  %243 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* bitcast (%struct.anon.7* @packet_ts to i8*), i8* nonnull %241, i8* %242, i64 1) #6, !dbg !2060
  %244 = icmp eq i64 %243, 0, !dbg !2061
  br i1 %244, label %245, label %248, !dbg !2062

245:                                              ; preds = %236
  %246 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %97, i64 0, i32 8, !dbg !2063
  %247 = atomicrmw add i32* %246, i32 1 seq_cst, !dbg !2064
  br label %266, !dbg !2064

248:                                              ; preds = %236
  call void @llvm.dbg.value(metadata i8* %0, metadata !1796, metadata !DIExpression()) #6, !dbg !2065
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1801, metadata !DIExpression()) #6, !dbg !2065
  call void @llvm.dbg.value(metadata i8 1, metadata !1802, metadata !DIExpression()) #6, !dbg !2065
  %249 = bitcast %struct.map_full_event* %8 to i8*, !dbg !2067
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %249) #6, !dbg !2067
  call void @llvm.dbg.declare(metadata %struct.map_full_event* %8, metadata !1803, metadata !DIExpression()) #6, !dbg !2068
  %250 = load i64, i64* %238, align 8, !dbg !2069, !tbaa !620
  %251 = load volatile i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 1), align 8, !dbg !2070, !tbaa !1359
  %252 = icmp ult i64 %250, %251, !dbg !2071
  br i1 %252, label %265, label %253, !dbg !2072

253:                                              ; preds = %248
  %254 = load volatile i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 1), align 8, !dbg !2073, !tbaa !1359
  %255 = sub i64 %250, %254, !dbg !2074
  %256 = icmp ult i64 %255, 1000000000, !dbg !2075
  br i1 %256, label %265, label %257, !dbg !2076

257:                                              ; preds = %253
  store volatile i64 %250, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 1), align 8, !dbg !2077, !tbaa !1359
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(64) %249, i8 0, i64 64, i1 false) #6, !dbg !2078
  %258 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %8, i64 0, i32 0, !dbg !2079
  store i64 3, i64* %258, align 8, !dbg !2080, !tbaa !1829
  %259 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %8, i64 0, i32 1, !dbg !2081
  store i64 %250, i64* %259, align 8, !dbg !2082, !tbaa !1833
  %260 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %8, i64 0, i32 2, !dbg !2083
  %261 = bitcast %struct.network_tuple* %260 to i8*, !dbg !2084
  %262 = bitcast %struct.network_tuple* %14 to i8*, !dbg !2084
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(44) %261, i8* nonnull align 4 dereferenceable(44) %262, i64 44, i1 false) #6, !dbg !2084, !tbaa.struct !1373
  %263 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %8, i64 0, i32 3, !dbg !2085
  store i8 1, i8* %263, align 4, !dbg !2086, !tbaa !1838
  %264 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* %0, i8* bitcast (%struct.anon.5* @events to i8*), i64 4294967295, i8* nonnull %249, i64 64) #6, !dbg !2087
  br label %265, !dbg !2088

265:                                              ; preds = %257, %253, %248
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %249) #6, !dbg !2088
  br label %266

266:                                              ; preds = %100, %92, %121, %175, %197, %210, %228, %233, %245, %265
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %90, metadata !2089, metadata !DIExpression()), !dbg !2093
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2092, metadata !DIExpression()), !dbg !2093
  %267 = load i8, i8* %11, align 1, !dbg !2095, !tbaa !1159, !range !806
  %268 = icmp eq i8 %267, 0, !dbg !2095
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %90, metadata !1401, metadata !DIExpression()), !dbg !2096
  call void @llvm.dbg.value(metadata i1 %268, metadata !1406, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2096
  %269 = select i1 %268, %struct.flow_state* %95, %struct.flow_state* %96, !dbg !2098
  call void @llvm.dbg.value(metadata %struct.flow_state* %269, metadata !1699, metadata !DIExpression()), !dbg !1700
  call void @llvm.dbg.value(metadata i8* %0, metadata !2099, metadata !DIExpression()) #6, !dbg !2106
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2104, metadata !DIExpression()) #6, !dbg !2106
  call void @llvm.dbg.value(metadata %struct.flow_state* %269, metadata !2105, metadata !DIExpression()) #6, !dbg !2106
  call void @llvm.dbg.value(metadata %struct.flow_state* %269, metadata !1547, metadata !DIExpression()) #6, !dbg !2108
  %270 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 9, !dbg !2111
  %271 = load i8, i8* %270, align 8, !dbg !2111, !tbaa !1556
  switch i8 %271, label %292 [
    i8 3, label %302
    i8 0, label %302
    i8 1, label %272
  ], !dbg !2112

272:                                              ; preds = %266
  %273 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 11, !dbg !2113
  %274 = load i8, i8* %273, align 2, !dbg !2113, !tbaa !1085
  %275 = icmp eq i8 %274, 3, !dbg !2115
  br i1 %275, label %292, label %276, !dbg !2116

276:                                              ; preds = %272
  store i8 2, i8* %270, align 8, !dbg !2117, !tbaa !1556
  call void @llvm.dbg.value(metadata i8* %0, metadata !2119, metadata !DIExpression()) #6, !dbg !2125
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2122, metadata !DIExpression()) #6, !dbg !2125
  call void @llvm.dbg.value(metadata %struct.flow_state* %269, metadata !2123, metadata !DIExpression()) #6, !dbg !2125
  %277 = bitcast %struct.flow_event* %6 to i8*, !dbg !2127
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %277) #6, !dbg !2127
  call void @llvm.dbg.declare(metadata %struct.flow_event* %6, metadata !2124, metadata !DIExpression()) #6, !dbg !2128
  %278 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 0, !dbg !2129
  store i64 1, i64* %278, align 8, !dbg !2129, !tbaa !1634
  %279 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 1, !dbg !2129
  %280 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 2, !dbg !2130
  %281 = load i64, i64* %280, align 8, !dbg !2130, !tbaa !1559
  store i64 %281, i64* %279, align 8, !dbg !2129, !tbaa !1636
  %282 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 2, !dbg !2129
  %283 = bitcast %struct.network_tuple* %282 to i8*, !dbg !2131
  %284 = bitcast %struct.network_tuple* %14 to i8*, !dbg !2131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(44) %283, i8* nonnull align 4 dereferenceable(44) %284, i64 44, i1 false) #6, !dbg !2131, !tbaa.struct !1373
  %285 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 3, !dbg !2129
  store i8 1, i8* %285, align 4, !dbg !2129, !tbaa !1637
  %286 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 4, !dbg !2129
  %287 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 10, !dbg !2132
  %288 = load i8, i8* %287, align 1, !dbg !2132, !tbaa !1776
  store i8 %288, i8* %286, align 1, !dbg !2129, !tbaa !1638
  %289 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 5, !dbg !2129
  store i8 1, i8* %289, align 2, !dbg !2129, !tbaa !1639
  %290 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 6, !dbg !2129
  store i8 0, i8* %290, align 1, !dbg !2129, !tbaa !1640
  %291 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* %0, i8* bitcast (%struct.anon.5* @events to i8*), i64 4294967295, i8* nonnull %277, i64 64) #6, !dbg !2133
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %277) #6, !dbg !2134
  br label %292, !dbg !2135

292:                                              ; preds = %276, %272, %266
  %293 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 5, !dbg !2136
  %294 = load i64, i64* %293, align 8, !dbg !2137, !tbaa !2138
  %295 = add i64 %294, 1, !dbg !2137
  store i64 %295, i64* %293, align 8, !dbg !2137, !tbaa !2138
  %296 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 1, !dbg !2139
  %297 = load i32, i32* %296, align 8, !dbg !2139, !tbaa !1191
  %298 = zext i32 %297 to i64, !dbg !2140
  %299 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 6, !dbg !2141
  %300 = load i64, i64* %299, align 8, !dbg !2142, !tbaa !2143
  %301 = add i64 %300, %298, !dbg !2142
  store i64 %301, i64* %299, align 8, !dbg !2142, !tbaa !2143
  br label %302, !dbg !2144

302:                                              ; preds = %266, %266, %292
  call void @llvm.dbg.value(metadata %struct.flow_state* %269, metadata !2145, metadata !DIExpression()) #6, !dbg !2169
  call void @llvm.dbg.value(metadata i8* %0, metadata !2148, metadata !DIExpression()) #6, !dbg !2169
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2149, metadata !DIExpression()) #6, !dbg !2169
  %303 = bitcast %struct.rtt_event* %5 to i8*, !dbg !2171
  call void @llvm.lifetime.start.p0i8(i64 120, i8* nonnull %303) #6, !dbg !2171
  call void @llvm.dbg.declare(metadata %struct.rtt_event* %5, metadata !2150, metadata !DIExpression()) #6, !dbg !2172
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(120) %303, i8 0, i64 120, i1 false) #6, !dbg !2172
  call void @llvm.dbg.value(metadata %struct.flow_state* %269, metadata !1547, metadata !DIExpression()) #6, !dbg !2173
  %304 = load i8, i8* %270, align 8, !dbg !2176, !tbaa !1556
  switch i8 %304, label %305 [
    i8 3, label %373
    i8 0, label %373
  ], !dbg !2177

305:                                              ; preds = %302
  %306 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 10, !dbg !2178
  %307 = load i8, i8* %306, align 1, !dbg !2178, !tbaa !1082, !range !806
  %308 = icmp eq i8 %307, 0, !dbg !2178
  br i1 %308, label %373, label %309, !dbg !2179

309:                                              ; preds = %305
  %310 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 8, !dbg !2180
  %311 = load i32, i32* %310, align 4, !dbg !2180, !tbaa !2182
  %312 = icmp eq i32 %311, 0, !dbg !2183
  br i1 %312, label %373, label %313, !dbg !2184

313:                                              ; preds = %309
  %314 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, !dbg !2185
  %315 = bitcast %struct.packet_id* %314 to i8*, !dbg !2186
  %316 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.7* @packet_ts to i8*), i8* nonnull %315) #6, !dbg !2187
  call void @llvm.dbg.value(metadata i8* %316, metadata !2168, metadata !DIExpression()) #6, !dbg !2169
  %317 = icmp eq i8* %316, null, !dbg !2188
  br i1 %317, label %373, label %318, !dbg !2190

318:                                              ; preds = %313
  %319 = bitcast i8* %316 to i64*, !dbg !2187
  call void @llvm.dbg.value(metadata i64* %319, metadata !2168, metadata !DIExpression()) #6, !dbg !2169
  %320 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2191
  %321 = load i64, i64* %320, align 8, !dbg !2191, !tbaa !620
  %322 = load i64, i64* %319, align 8, !dbg !2192, !tbaa !1359
  %323 = icmp ult i64 %321, %322, !dbg !2193
  br i1 %323, label %373, label %324, !dbg !2194

324:                                              ; preds = %318
  %325 = sub i64 %321, %322, !dbg !2195
  %326 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 4, !dbg !2196
  store i64 %325, i64* %326, align 8, !dbg !2197, !tbaa !2198
  %327 = call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* bitcast (%struct.anon.7* @packet_ts to i8*), i8* nonnull %315) #6, !dbg !2200
  %328 = icmp eq i64 %327, 0, !dbg !2202
  br i1 %328, label %329, label %332, !dbg !2203

329:                                              ; preds = %324
  %330 = atomicrmw add i32* %310, i32 -1 seq_cst, !dbg !2204
  %331 = load i64, i64* %326, align 8
  br label %332, !dbg !2206

332:                                              ; preds = %329, %324
  %333 = phi i64 [ %331, %329 ], [ %325, %324 ]
  %334 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 0, !dbg !2207
  %335 = load i64, i64* %334, align 8, !dbg !2207, !tbaa !2209
  %336 = add i64 %335, -1, !dbg !2210
  %337 = icmp ult i64 %336, %333, !dbg !2210
  br i1 %337, label %339, label %338, !dbg !2210

338:                                              ; preds = %332
  store i64 %333, i64* %334, align 8, !dbg !2211, !tbaa !2209
  br label %339, !dbg !2212

339:                                              ; preds = %338, %332
  %340 = phi i64 [ %335, %332 ], [ %333, %338 ], !dbg !2213
  %341 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 1, !dbg !2214
  %342 = load i64, i64* %341, align 8, !dbg !2214, !tbaa !1411
  call void @llvm.dbg.value(metadata i64 %342, metadata !2215, metadata !DIExpression()) #6, !dbg !2221
  call void @llvm.dbg.value(metadata i64 %333, metadata !2220, metadata !DIExpression()) #6, !dbg !2221
  %343 = icmp eq i64 %342, 0, !dbg !2223
  %344 = lshr i64 %342, 3, !dbg !2225
  %345 = lshr i64 %333, 3, !dbg !2225
  %346 = add i64 %342, %345, !dbg !2225
  %347 = sub i64 %346, %344, !dbg !2225
  %348 = select i1 %343, i64 %333, i64 %347, !dbg !2225
  store i64 %348, i64* %341, align 8, !dbg !2226, !tbaa !1411
  %349 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 0, !dbg !2227
  store i64 2, i64* %349, align 8, !dbg !2228, !tbaa !2229
  %350 = load i64, i64* %320, align 8, !dbg !2230, !tbaa !620
  %351 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 1, !dbg !2231
  store i64 %350, i64* %351, align 8, !dbg !2232, !tbaa !2233
  %352 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 5, !dbg !2234
  store i64 %340, i64* %352, align 8, !dbg !2235, !tbaa !2236
  %353 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 3, !dbg !2237
  %354 = load i64, i64* %353, align 8, !dbg !2237, !tbaa !1908
  %355 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 6, !dbg !2238
  store i64 %354, i64* %355, align 8, !dbg !2239, !tbaa !2240
  %356 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 4, !dbg !2241
  %357 = load i64, i64* %356, align 8, !dbg !2241, !tbaa !1913
  %358 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 7, !dbg !2242
  store i64 %357, i64* %358, align 8, !dbg !2243, !tbaa !2244
  %359 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 5, !dbg !2245
  %360 = load i64, i64* %359, align 8, !dbg !2245, !tbaa !2138
  %361 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 8, !dbg !2246
  store i64 %360, i64* %361, align 8, !dbg !2247, !tbaa !2248
  %362 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %269, i64 0, i32 6, !dbg !2249
  %363 = load i64, i64* %362, align 8, !dbg !2249, !tbaa !2143
  %364 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 9, !dbg !2250
  store i64 %363, i64* %364, align 8, !dbg !2251, !tbaa !2252
  %365 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 2, !dbg !2253
  %366 = bitcast %struct.network_tuple* %365 to i8*, !dbg !2254
  %367 = bitcast %struct.network_tuple* %14 to i8*, !dbg !2254
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(44) %366, i8* nonnull align 4 dereferenceable(44) %367, i64 44, i1 false) #6, !dbg !2254, !tbaa.struct !1373
  %368 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 7, !dbg !2255
  %369 = load i8, i8* %368, align 2, !dbg !2255, !tbaa !1253, !range !806
  %370 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 10, !dbg !2256
  %371 = xor i8 %369, 1, !dbg !2257
  store i8 %371, i8* %370, align 8, !dbg !2257, !tbaa !2258
  %372 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* %0, i8* bitcast (%struct.anon.5* @events to i8*), i64 4294967295, i8* nonnull %303, i64 120) #6, !dbg !2259
  br label %373, !dbg !2260

373:                                              ; preds = %302, %302, %305, %309, %313, %318, %339
  call void @llvm.lifetime.end.p0i8(i64 120, i8* nonnull %303) #6, !dbg !2260
  call void @llvm.dbg.value(metadata i8* %0, metadata !2261, metadata !DIExpression()) #6, !dbg !2269
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2266, metadata !DIExpression()) #6, !dbg !2269
  call void @llvm.dbg.value(metadata %struct.flow_state* %97, metadata !2267, metadata !DIExpression()) #6, !dbg !2269
  call void @llvm.dbg.value(metadata %struct.flow_state* %269, metadata !2268, metadata !DIExpression()) #6, !dbg !2269
  %374 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 11, !dbg !2271
  %375 = load i8, i8* %374, align 2, !dbg !2271, !tbaa !1085
  %376 = and i8 %375, -2, !dbg !2273
  %377 = icmp eq i8 %376, 2, !dbg !2273
  br i1 %377, label %378, label %421, !dbg !2273

378:                                              ; preds = %373
  call void @llvm.dbg.value(metadata %struct.flow_state* %97, metadata !1593, metadata !DIExpression()) #6, !dbg !2274
  %379 = load i8, i8* %98, align 8, !dbg !2278, !tbaa !1556
  %380 = icmp eq i8 %379, 2, !dbg !2279
  br i1 %380, label %381, label %398, !dbg !2280

381:                                              ; preds = %378
  call void @llvm.dbg.value(metadata i8* %0, metadata !2281, metadata !DIExpression()) #6, !dbg !2289
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2286, metadata !DIExpression()) #6, !dbg !2289
  call void @llvm.dbg.value(metadata i1 false, metadata !2287, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2289
  %382 = bitcast %struct.flow_event* %4 to i8*, !dbg !2291
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %382) #6, !dbg !2291
  call void @llvm.dbg.declare(metadata %struct.flow_event* %4, metadata !2288, metadata !DIExpression()) #6, !dbg !2292
  %383 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 0, !dbg !2293
  store i64 1, i64* %383, align 8, !dbg !2293, !tbaa !1634
  %384 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 1, !dbg !2293
  %385 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2294
  %386 = load i64, i64* %385, align 8, !dbg !2294, !tbaa !620
  store i64 %386, i64* %384, align 8, !dbg !2293, !tbaa !1636
  %387 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 2, !dbg !2293
  %388 = bitcast %struct.network_tuple* %387 to i8*, !dbg !2293
  %389 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 3, !dbg !2293
  store i8 %375, i8* %389, align 4, !dbg !2293, !tbaa !1637
  %390 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 4, !dbg !2293
  %391 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 12, !dbg !2295
  %392 = load i8, i8* %391, align 1, !dbg !2295, !tbaa !1088
  store i8 %392, i8* %390, align 1, !dbg !2293, !tbaa !1638
  %393 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 6, !dbg !2293
  store i8 0, i8* %393, align 1, !dbg !2293, !tbaa !1640
  %394 = bitcast %struct.network_tuple* %15 to i8*, !dbg !2296
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(44) %388, i8* nonnull align 4 dereferenceable(44) %394, i64 44, i1 false) #6, !dbg !2296, !tbaa.struct !1373
  %395 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 5, !dbg !2293
  store i8 1, i8* %395, align 2, !dbg !2299, !tbaa !1639
  %396 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* %0, i8* bitcast (%struct.anon.5* @events to i8*), i64 4294967295, i8* nonnull %382, i64 64) #6, !dbg !2300
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %382) #6, !dbg !2301
  %397 = load i8, i8* %374, align 2, !dbg !2302, !tbaa !1085
  br label %398, !dbg !2304

398:                                              ; preds = %381, %378
  %399 = phi i8 [ %375, %378 ], [ %397, %381 ], !dbg !2302
  store i8 3, i8* %98, align 8, !dbg !2305, !tbaa !1556
  %400 = icmp eq i8 %399, 3, !dbg !2306
  br i1 %400, label %401, label %423, !dbg !2307

401:                                              ; preds = %398
  call void @llvm.dbg.value(metadata %struct.flow_state* %269, metadata !1593, metadata !DIExpression()) #6, !dbg !2308
  %402 = load i8, i8* %270, align 8, !dbg !2312, !tbaa !1556
  %403 = icmp eq i8 %402, 2, !dbg !2313
  br i1 %403, label %404, label %420, !dbg !2314

404:                                              ; preds = %401
  call void @llvm.dbg.value(metadata i8* %0, metadata !2281, metadata !DIExpression()) #6, !dbg !2315
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2286, metadata !DIExpression()) #6, !dbg !2315
  call void @llvm.dbg.value(metadata i1 true, metadata !2287, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2315
  %405 = bitcast %struct.flow_event* %3 to i8*, !dbg !2317
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %405) #6, !dbg !2317
  call void @llvm.dbg.declare(metadata %struct.flow_event* %3, metadata !2288, metadata !DIExpression()) #6, !dbg !2318
  %406 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 0, !dbg !2319
  store i64 1, i64* %406, align 8, !dbg !2319, !tbaa !1634
  %407 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 1, !dbg !2319
  %408 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2320
  %409 = load i64, i64* %408, align 8, !dbg !2320, !tbaa !620
  store i64 %409, i64* %407, align 8, !dbg !2319, !tbaa !1636
  %410 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, !dbg !2319
  %411 = bitcast %struct.network_tuple* %410 to i8*, !dbg !2319
  %412 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 3, !dbg !2319
  store i8 3, i8* %412, align 4, !dbg !2319, !tbaa !1637
  %413 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 4, !dbg !2319
  %414 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 12, !dbg !2321
  %415 = load i8, i8* %414, align 1, !dbg !2321, !tbaa !1088
  store i8 %415, i8* %413, align 1, !dbg !2319, !tbaa !1638
  %416 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 6, !dbg !2319
  store i8 0, i8* %416, align 1, !dbg !2319, !tbaa !1640
  %417 = bitcast %struct.network_tuple* %14 to i8*, !dbg !2322
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(44) %411, i8* nonnull align 4 dereferenceable(44) %417, i64 44, i1 false) #6, !dbg !2322, !tbaa.struct !1373
  %418 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 5, !dbg !2319
  store i8 0, i8* %418, align 2, !dbg !2324, !tbaa !1639
  %419 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* %0, i8* bitcast (%struct.anon.5* @events to i8*), i64 4294967295, i8* nonnull %405, i64 64) #6, !dbg !2325
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %405) #6, !dbg !2326
  br label %420, !dbg !2327

420:                                              ; preds = %404, %401
  store i8 3, i8* %270, align 8, !dbg !2328, !tbaa !1556
  br label %421, !dbg !2329

421:                                              ; preds = %420, %373
  %422 = load i8, i8* %98, align 8, !dbg !2330, !tbaa !1556
  call void @llvm.dbg.value(metadata %struct.flow_state* %97, metadata !1547, metadata !DIExpression()) #6, !dbg !2333
  switch i8 %422, label %431 [
    i8 3, label %423
    i8 0, label %423
  ], !dbg !2334

423:                                              ; preds = %398, %421, %421
  call void @llvm.dbg.value(metadata %struct.flow_state* %269, metadata !1547, metadata !DIExpression()) #6, !dbg !2335
  %424 = load i8, i8* %270, align 8, !dbg !2337, !tbaa !1556
  switch i8 %424, label %431 [
    i8 3, label %425
    i8 0, label %425
  ], !dbg !2338

425:                                              ; preds = %423, %423
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1710, metadata !DIExpression()) #6, !dbg !2339
  %426 = load i8, i8* %11, align 1, !dbg !2343, !tbaa !1159, !range !806
  %427 = icmp eq i8 %426, 0, !dbg !2343
  %428 = select i1 %427, %struct.network_tuple* %15, %struct.network_tuple* %14, !dbg !2344
  %429 = bitcast %struct.network_tuple* %428 to i8*, !dbg !2345
  %430 = call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* bitcast (%struct.anon.6* @flow_state to i8*), i8* nonnull %429) #6, !dbg !2346
  br label %431, !dbg !2347

431:                                              ; preds = %22, %26, %425, %423, %421, %89
  ret void, !dbg !2348
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.usub.sat.i32(i32, i32) #1

attributes #0 = { noinline nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readonly willreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!304, !305, !306}
!llvm.ident = !{!307}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 123, type: !303, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 12.0.0-3ubuntu1~20.04.5", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !98, globals: !146, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "pping_kern.c", directory: "/home/t-hlnu/bpfex2/pping")
!4 = !{!5, !13, !22, !31, !37, !41, !70, !76, !82, !93}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_type", file: !6, line: 25, baseType: !7, size: 8, elements: !8)
!6 = !DIFile(filename: "./pping.h", directory: "/home/t-hlnu/bpfex2/pping")
!7 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "FLOW_EVENT_NONE", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "FLOW_EVENT_OPENING", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "FLOW_EVENT_CLOSING", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "FLOW_EVENT_CLOSING_BOTH", value: 3, isUnsigned: true)
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_reason", file: !6, line: 32, baseType: !7, size: 8, elements: !14)
!14 = !{!15, !16, !17, !18, !19, !20, !21}
!15 = !DIEnumerator(name: "EVENT_REASON_NONE", value: 0, isUnsigned: true)
!16 = !DIEnumerator(name: "EVENT_REASON_SYN", value: 1, isUnsigned: true)
!17 = !DIEnumerator(name: "EVENT_REASON_SYN_ACK", value: 2, isUnsigned: true)
!18 = !DIEnumerator(name: "EVENT_REASON_FIRST_OBS_PCKT", value: 3, isUnsigned: true)
!19 = !DIEnumerator(name: "EVENT_REASON_FIN", value: 4, isUnsigned: true)
!20 = !DIEnumerator(name: "EVENT_REASON_RST", value: 5, isUnsigned: true)
!21 = !DIEnumerator(name: "EVENT_REASON_FLOW_TIMEOUT", value: 6, isUnsigned: true)
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !23, line: 4363, baseType: !24, size: 32, elements: !25)
!23 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/t-hlnu/bpfex2/pping")
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !{!26, !27, !28, !29, !30}
!26 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!27 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!28 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!29 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!30 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!31 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "connection_state", file: !6, line: 53, baseType: !7, size: 8, elements: !32)
!32 = !{!33, !34, !35, !36}
!33 = !DIEnumerator(name: "CONNECTION_STATE_EMPTY", value: 0, isUnsigned: true)
!34 = !DIEnumerator(name: "CONNECTION_STATE_WAITOPEN", value: 1, isUnsigned: true)
!35 = !DIEnumerator(name: "CONNECTION_STATE_OPEN", value: 2, isUnsigned: true)
!36 = !DIEnumerator(name: "CONNECTION_STATE_CLOSED", value: 3, isUnsigned: true)
!37 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "pping_map", file: !6, line: 48, baseType: !7, size: 8, elements: !38)
!38 = !{!39, !40}
!39 = !DIEnumerator(name: "PPING_MAP_FLOWSTATE", value: 0, isUnsigned: true)
!40 = !DIEnumerator(name: "PPING_MAP_PACKETTS", value: 1, isUnsigned: true)
!41 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !42, line: 28, baseType: !24, size: 32, elements: !43)
!42 = !DIFile(filename: "/usr/include/linux/in.h", directory: "")
!43 = !{!44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69}
!44 = !DIEnumerator(name: "IPPROTO_IP", value: 0, isUnsigned: true)
!45 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1, isUnsigned: true)
!46 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2, isUnsigned: true)
!47 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4, isUnsigned: true)
!48 = !DIEnumerator(name: "IPPROTO_TCP", value: 6, isUnsigned: true)
!49 = !DIEnumerator(name: "IPPROTO_EGP", value: 8, isUnsigned: true)
!50 = !DIEnumerator(name: "IPPROTO_PUP", value: 12, isUnsigned: true)
!51 = !DIEnumerator(name: "IPPROTO_UDP", value: 17, isUnsigned: true)
!52 = !DIEnumerator(name: "IPPROTO_IDP", value: 22, isUnsigned: true)
!53 = !DIEnumerator(name: "IPPROTO_TP", value: 29, isUnsigned: true)
!54 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33, isUnsigned: true)
!55 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41, isUnsigned: true)
!56 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46, isUnsigned: true)
!57 = !DIEnumerator(name: "IPPROTO_GRE", value: 47, isUnsigned: true)
!58 = !DIEnumerator(name: "IPPROTO_ESP", value: 50, isUnsigned: true)
!59 = !DIEnumerator(name: "IPPROTO_AH", value: 51, isUnsigned: true)
!60 = !DIEnumerator(name: "IPPROTO_MTP", value: 92, isUnsigned: true)
!61 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94, isUnsigned: true)
!62 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98, isUnsigned: true)
!63 = !DIEnumerator(name: "IPPROTO_PIM", value: 103, isUnsigned: true)
!64 = !DIEnumerator(name: "IPPROTO_COMP", value: 108, isUnsigned: true)
!65 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132, isUnsigned: true)
!66 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136, isUnsigned: true)
!67 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137, isUnsigned: true)
!68 = !DIEnumerator(name: "IPPROTO_RAW", value: 255, isUnsigned: true)
!69 = !DIEnumerator(name: "IPPROTO_MAX", value: 256, isUnsigned: true)
!70 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !23, line: 397, baseType: !24, size: 32, elements: !71)
!71 = !{!72, !73, !74, !75}
!72 = !DIEnumerator(name: "BPF_ANY", value: 0, isUnsigned: true)
!73 = !DIEnumerator(name: "BPF_NOEXIST", value: 1, isUnsigned: true)
!74 = !DIEnumerator(name: "BPF_EXIST", value: 2, isUnsigned: true)
!75 = !DIEnumerator(name: "BPF_F_LOCK", value: 4, isUnsigned: true)
!76 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !23, line: 4063, baseType: !77, size: 64, elements: !78)
!77 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!78 = !{!79, !80, !81}
!79 = !DIEnumerator(name: "BPF_F_INDEX_MASK", value: 4294967295, isUnsigned: true)
!80 = !DIEnumerator(name: "BPF_F_CURRENT_CPU", value: 4294967295, isUnsigned: true)
!81 = !DIEnumerator(name: "BPF_F_CTXLEN_MASK", value: 4503595332403200, isUnsigned: true)
!82 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !23, line: 4955, baseType: !24, size: 32, elements: !83)
!83 = !{!84, !85, !86, !87, !88, !89, !90, !91, !92}
!84 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_SUCCESS", value: 0, isUnsigned: true)
!85 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_BLACKHOLE", value: 1, isUnsigned: true)
!86 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNREACHABLE", value: 2, isUnsigned: true)
!87 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_PROHIBIT", value: 3, isUnsigned: true)
!88 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NOT_FWDED", value: 4, isUnsigned: true)
!89 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FWD_DISABLED", value: 5, isUnsigned: true)
!90 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNSUPP_LWT", value: 6, isUnsigned: true)
!91 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NO_NEIGH", value: 7, isUnsigned: true)
!92 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FRAG_NEEDED", value: 8, isUnsigned: true)
!93 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_source", file: !6, line: 42, baseType: !7, size: 8, elements: !94)
!94 = !{!95, !96, !97}
!95 = !DIEnumerator(name: "EVENT_SOURCE_PKT_SRC", value: 0, isUnsigned: true)
!96 = !DIEnumerator(name: "EVENT_SOURCE_PKT_DEST", value: 1, isUnsigned: true)
!97 = !DIEnumerator(name: "EVENT_SOURCE_GC", value: 2, isUnsigned: true)
!98 = !{!99, !100, !101, !124, !140, !130, !131, !141, !143, !144, !145}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!100 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "network_tuple", file: !6, line: 89, size: 352, elements: !103)
!103 = !{!104, !136, !137, !138, !139}
!104 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !102, file: !6, line: 90, baseType: !105, size: 160)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_address", file: !6, line: 76, size: 160, elements: !106)
!106 = !{!107, !134, !135}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "ip", scope: !105, file: !6, line: 77, baseType: !108, size: 128)
!108 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !109, line: 33, size: 128, elements: !110)
!109 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!110 = !{!111}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !108, file: !109, line: 40, baseType: !112, size: 128)
!112 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !108, file: !109, line: 34, size: 128, elements: !113)
!113 = !{!114, !120, !128}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !112, file: !109, line: 35, baseType: !115, size: 128)
!115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 128, elements: !118)
!116 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !117, line: 21, baseType: !7)
!117 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!118 = !{!119}
!119 = !DISubrange(count: 16)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !112, file: !109, line: 37, baseType: !121, size: 128)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !122, size: 128, elements: !126)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !123, line: 25, baseType: !124)
!123 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!124 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !117, line: 24, baseType: !125)
!125 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!126 = !{!127}
!127 = !DISubrange(count: 8)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !112, file: !109, line: 38, baseType: !129, size: 128)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !130, size: 128, elements: !132)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !123, line: 27, baseType: !131)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !117, line: 27, baseType: !24)
!132 = !{!133}
!133 = !DISubrange(count: 4)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "port", scope: !105, file: !6, line: 78, baseType: !124, size: 16, offset: 128)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !105, file: !6, line: 79, baseType: !124, size: 16, offset: 144)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !102, file: !6, line: 91, baseType: !105, size: 160, offset: 160)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "proto", scope: !102, file: !6, line: 92, baseType: !124, size: 16, offset: 320)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "ipv", scope: !102, file: !6, line: 93, baseType: !116, size: 8, offset: 336)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !102, file: !6, line: 94, baseType: !116, size: 8, offset: 344)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !142, size: 64)
!142 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!146 = !{!0, !147, !172, !204, !213, !231, !239, !245, !250, !288, !293, !298}
!147 = !DIGlobalVariableExpression(var: !148, expr: !DIExpression())
!148 = distinct !DIGlobalVariable(name: "packet_ts", scope: !2, file: !3, line: 135, type: !149, isLocal: false, isDefinition: true)
!149 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 130, size: 256, elements: !150)
!150 = !{!151, !157, !163, !167}
!151 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !149, file: !3, line: 131, baseType: !152, size: 64)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !154, size: 32, elements: !155)
!154 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!155 = !{!156}
!156 = !DISubrange(count: 1)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !149, file: !3, line: 132, baseType: !158, size: 64, offset: 64)
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!159 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "packet_id", file: !6, line: 124, size: 384, elements: !160)
!160 = !{!161, !162}
!161 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !159, file: !6, line: 125, baseType: !102, size: 352)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !159, file: !6, line: 126, baseType: !131, size: 32, offset: 352)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !149, file: !3, line: 133, baseType: !164, size: 64, offset: 128)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !117, line: 31, baseType: !166)
!166 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !149, file: !3, line: 134, baseType: !168, size: 64, offset: 192)
!168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !169, size: 64)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !154, size: 524288, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 16384)
!172 = !DIGlobalVariableExpression(var: !173, expr: !DIExpression())
!173 = distinct !DIGlobalVariable(name: "flow_state", scope: !2, file: !3, line: 142, type: !174, isLocal: false, isDefinition: true)
!174 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 137, size: 256, elements: !175)
!175 = !{!176, !177, !178, !203}
!176 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !174, file: !3, line: 138, baseType: !152, size: 64)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !174, file: !3, line: 139, baseType: !101, size: 64, offset: 64)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !174, file: !3, line: 140, baseType: !179, size: 64, offset: 128)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64)
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dual_flow_state", file: !6, line: 119, size: 1152, elements: !181)
!181 = !{!182, !202}
!182 = !DIDerivedType(tag: DW_TAG_member, name: "dir1", scope: !180, file: !6, line: 120, baseType: !183, size: 576)
!183 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_state", file: !6, line: 97, size: 576, elements: !184)
!184 = !{!185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !198}
!185 = !DIDerivedType(tag: DW_TAG_member, name: "min_rtt", scope: !183, file: !6, line: 98, baseType: !165, size: 64)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "srtt", scope: !183, file: !6, line: 99, baseType: !165, size: 64, offset: 64)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "last_timestamp", scope: !183, file: !6, line: 100, baseType: !165, size: 64, offset: 128)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "sent_pkts", scope: !183, file: !6, line: 101, baseType: !165, size: 64, offset: 192)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "sent_bytes", scope: !183, file: !6, line: 102, baseType: !165, size: 64, offset: 256)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "rec_pkts", scope: !183, file: !6, line: 103, baseType: !165, size: 64, offset: 320)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "rec_bytes", scope: !183, file: !6, line: 104, baseType: !165, size: 64, offset: 384)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "last_id", scope: !183, file: !6, line: 105, baseType: !131, size: 32, offset: 448)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "outstanding_timestamps", scope: !183, file: !6, line: 106, baseType: !131, size: 32, offset: 480)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "conn_state", scope: !183, file: !6, line: 107, baseType: !31, size: 8, offset: 512)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "opening_reason", scope: !183, file: !6, line: 108, baseType: !13, size: 8, offset: 520)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "has_been_timestamped", scope: !183, file: !6, line: 109, baseType: !197, size: 8, offset: 528)
!197 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !183, file: !6, line: 110, baseType: !199, size: 40, offset: 536)
!199 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 40, elements: !200)
!200 = !{!201}
!201 = !DISubrange(count: 5)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "dir2", scope: !180, file: !6, line: 121, baseType: !183, size: 576, offset: 576)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !174, file: !3, line: 141, baseType: !168, size: 64, offset: 192)
!204 = !DIGlobalVariableExpression(var: !205, expr: !DIExpression())
!205 = distinct !DIGlobalVariable(name: "events", scope: !2, file: !3, line: 148, type: !206, isLocal: false, isDefinition: true)
!206 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 144, size: 192, elements: !207)
!207 = !{!208, !211, !212}
!208 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !206, file: !3, line: 145, baseType: !209, size: 64)
!209 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !210, size: 64)
!210 = !DICompositeType(tag: DW_TAG_array_type, baseType: !154, size: 128, elements: !132)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !206, file: !3, line: 146, baseType: !209, size: 64, offset: 64)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !206, file: !3, line: 147, baseType: !209, size: 64, offset: 128)
!213 = !DIGlobalVariableExpression(var: !214, expr: !DIExpression())
!214 = distinct !DIGlobalVariable(name: "config", scope: !2, file: !3, line: 125, type: !215, isLocal: true, isDefinition: true)
!215 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !216)
!216 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !217)
!217 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_config", file: !6, line: 60, size: 192, elements: !218)
!218 = !{!219, !220, !222, !223, !224, !225, !226, !227}
!219 = !DIDerivedType(tag: DW_TAG_member, name: "rate_limit", scope: !217, file: !6, line: 61, baseType: !165, size: 64)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_rate", scope: !217, file: !6, line: 62, baseType: !221, size: 64, offset: 64)
!221 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixpoint64", file: !6, line: 14, baseType: !165)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "use_srtt", scope: !217, file: !6, line: 63, baseType: !197, size: 8, offset: 128)
!223 = !DIDerivedType(tag: DW_TAG_member, name: "track_tcp", scope: !217, file: !6, line: 64, baseType: !197, size: 8, offset: 136)
!224 = !DIDerivedType(tag: DW_TAG_member, name: "track_icmp", scope: !217, file: !6, line: 65, baseType: !197, size: 8, offset: 144)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "localfilt", scope: !217, file: !6, line: 66, baseType: !197, size: 8, offset: 152)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "skip_syn", scope: !217, file: !6, line: 67, baseType: !197, size: 8, offset: 160)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !217, file: !6, line: 68, baseType: !228, size: 24, offset: 168)
!228 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 24, elements: !229)
!229 = !{!230}
!230 = !DISubrange(count: 3)
!231 = !DIGlobalVariableExpression(var: !232, expr: !DIExpression())
!232 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !233, line: 77, type: !234, isLocal: true, isDefinition: true)
!233 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/t-hlnu/bpfex2/pping")
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64)
!235 = !DISubroutineType(types: !236)
!236 = !{!100, !99, !237, !237, !165}
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64)
!238 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!239 = !DIGlobalVariableExpression(var: !240, expr: !DIExpression())
!240 = distinct !DIGlobalVariable(name: "last_warn_time", scope: !2, file: !3, line: 126, type: !241, isLocal: true, isDefinition: true)
!241 = !DICompositeType(tag: DW_TAG_array_type, baseType: !242, size: 128, elements: !243)
!242 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !165)
!243 = !{!244}
!244 = !DISubrange(count: 2)
!245 = !DIGlobalVariableExpression(var: !246, expr: !DIExpression())
!246 = distinct !DIGlobalVariable(name: "bpf_perf_event_output", scope: !2, file: !233, line: 692, type: !247, isLocal: true, isDefinition: true)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !248, size: 64)
!248 = !DISubroutineType(types: !249)
!249 = !{!100, !99, !99, !165, !99, !165}
!250 = !DIGlobalVariableExpression(var: !251, expr: !DIExpression())
!251 = distinct !DIGlobalVariable(name: "bpf_fib_lookup", scope: !2, file: !233, line: 1839, type: !252, isLocal: true, isDefinition: true)
!252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !253, size: 64)
!253 = !DISubroutineType(types: !254)
!254 = !{!100, !99, !255, !154, !131}
!255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !256, size: 64)
!256 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_fib_lookup", file: !23, line: 4967, size: 512, elements: !257)
!257 = !{!258, !259, !260, !261, !262, !263, !264, !270, !276, !281, !282, !283, !287}
!258 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !256, file: !23, line: 4971, baseType: !116, size: 8)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "l4_protocol", scope: !256, file: !23, line: 4974, baseType: !116, size: 8, offset: 8)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !256, file: !23, line: 4975, baseType: !122, size: 16, offset: 16)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !256, file: !23, line: 4976, baseType: !122, size: 16, offset: 32)
!262 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !256, file: !23, line: 4979, baseType: !124, size: 16, offset: 48)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !256, file: !23, line: 4984, baseType: !131, size: 32, offset: 64)
!264 = !DIDerivedType(tag: DW_TAG_member, scope: !256, file: !23, line: 4986, baseType: !265, size: 32, offset: 96)
!265 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !256, file: !23, line: 4986, size: 32, elements: !266)
!266 = !{!267, !268, !269}
!267 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !265, file: !23, line: 4988, baseType: !116, size: 8)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "flowinfo", scope: !265, file: !23, line: 4989, baseType: !130, size: 32)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "rt_metric", scope: !265, file: !23, line: 4992, baseType: !131, size: 32)
!270 = !DIDerivedType(tag: DW_TAG_member, scope: !256, file: !23, line: 4995, baseType: !271, size: 128, offset: 128)
!271 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !256, file: !23, line: 4995, size: 128, elements: !272)
!272 = !{!273, !274}
!273 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !271, file: !23, line: 4996, baseType: !130, size: 32)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !271, file: !23, line: 4997, baseType: !275, size: 128)
!275 = !DICompositeType(tag: DW_TAG_array_type, baseType: !131, size: 128, elements: !132)
!276 = !DIDerivedType(tag: DW_TAG_member, scope: !256, file: !23, line: 5004, baseType: !277, size: 128, offset: 256)
!277 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !256, file: !23, line: 5004, size: 128, elements: !278)
!278 = !{!279, !280}
!279 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !277, file: !23, line: 5005, baseType: !130, size: 32)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !277, file: !23, line: 5006, baseType: !275, size: 128)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_proto", scope: !256, file: !23, line: 5010, baseType: !122, size: 16, offset: 384)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !256, file: !23, line: 5011, baseType: !122, size: 16, offset: 400)
!283 = !DIDerivedType(tag: DW_TAG_member, name: "smac", scope: !256, file: !23, line: 5012, baseType: !284, size: 48, offset: 416)
!284 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 48, elements: !285)
!285 = !{!286}
!286 = !DISubrange(count: 6)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "dmac", scope: !256, file: !23, line: 5013, baseType: !284, size: 48, offset: 464)
!288 = !DIGlobalVariableExpression(var: !289, expr: !DIExpression())
!289 = distinct !DIGlobalVariable(name: "bpf_ktime_get_ns", scope: !2, file: !233, line: 113, type: !290, isLocal: true, isDefinition: true)
!290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !291, size: 64)
!291 = !DISubroutineType(types: !292)
!292 = !{!165}
!293 = !DIGlobalVariableExpression(var: !294, expr: !DIExpression())
!294 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !233, line: 55, type: !295, isLocal: true, isDefinition: true)
!295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !296, size: 64)
!296 = !DISubroutineType(types: !297)
!297 = !{!99, !99, !237}
!298 = !DIGlobalVariableExpression(var: !299, expr: !DIExpression())
!299 = distinct !DIGlobalVariable(name: "bpf_map_delete_elem", scope: !2, file: !233, line: 87, type: !300, isLocal: true, isDefinition: true)
!300 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !301, size: 64)
!301 = !DISubroutineType(types: !302)
!302 = !{!100, !99, !237}
!303 = !DICompositeType(tag: DW_TAG_array_type, baseType: !142, size: 32, elements: !132)
!304 = !{i32 7, !"Dwarf Version", i32 4}
!305 = !{i32 2, !"Debug Info Version", i32 3}
!306 = !{i32 1, !"wchar_size", i32 4}
!307 = !{!"Ubuntu clang version 12.0.0-3ubuntu1~20.04.5"}
!308 = distinct !DISubprogram(name: "parse_packet_identifer_tc", scope: !3, file: !3, line: 572, type: !309, scopeLine: 574, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !420)
!309 = !DISubroutineType(types: !310)
!310 = !{!154, !311, !399}
!311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 64)
!312 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !23, line: 4183, size: 1472, elements: !313)
!313 = !{!314, !315, !316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326, !328, !329, !330, !331, !332, !333, !334, !335, !336, !337, !338, !339, !340, !341, !373, !374, !375, !376, !398}
!314 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !312, file: !23, line: 4184, baseType: !131, size: 32)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !312, file: !23, line: 4185, baseType: !131, size: 32, offset: 32)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !312, file: !23, line: 4186, baseType: !131, size: 32, offset: 64)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !312, file: !23, line: 4187, baseType: !131, size: 32, offset: 96)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !312, file: !23, line: 4188, baseType: !131, size: 32, offset: 128)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !312, file: !23, line: 4189, baseType: !131, size: 32, offset: 160)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !312, file: !23, line: 4190, baseType: !131, size: 32, offset: 192)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !312, file: !23, line: 4191, baseType: !131, size: 32, offset: 224)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !312, file: !23, line: 4192, baseType: !131, size: 32, offset: 256)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !312, file: !23, line: 4193, baseType: !131, size: 32, offset: 288)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !312, file: !23, line: 4194, baseType: !131, size: 32, offset: 320)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !312, file: !23, line: 4195, baseType: !131, size: 32, offset: 352)
!326 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !312, file: !23, line: 4196, baseType: !327, size: 160, offset: 384)
!327 = !DICompositeType(tag: DW_TAG_array_type, baseType: !131, size: 160, elements: !200)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !312, file: !23, line: 4197, baseType: !131, size: 32, offset: 544)
!329 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !312, file: !23, line: 4198, baseType: !131, size: 32, offset: 576)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !312, file: !23, line: 4199, baseType: !131, size: 32, offset: 608)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !312, file: !23, line: 4200, baseType: !131, size: 32, offset: 640)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !312, file: !23, line: 4201, baseType: !131, size: 32, offset: 672)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !312, file: !23, line: 4204, baseType: !131, size: 32, offset: 704)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !312, file: !23, line: 4205, baseType: !131, size: 32, offset: 736)
!335 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !312, file: !23, line: 4206, baseType: !131, size: 32, offset: 768)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !312, file: !23, line: 4207, baseType: !275, size: 128, offset: 800)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !312, file: !23, line: 4208, baseType: !275, size: 128, offset: 928)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !312, file: !23, line: 4209, baseType: !131, size: 32, offset: 1056)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !312, file: !23, line: 4210, baseType: !131, size: 32, offset: 1088)
!340 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !312, file: !23, line: 4213, baseType: !131, size: 32, offset: 1120)
!341 = !DIDerivedType(tag: DW_TAG_member, scope: !312, file: !23, line: 4214, baseType: !342, size: 64, align: 64, offset: 1152)
!342 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !312, file: !23, line: 4214, size: 64, align: 64, elements: !343)
!343 = !{!344}
!344 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !342, file: !23, line: 4214, baseType: !345, size: 64)
!345 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !346, size: 64)
!346 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !23, line: 5041, size: 448, elements: !347)
!347 = !{!348, !349, !350, !351, !352, !353, !354, !355, !356, !357, !358, !371, !372}
!348 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !346, file: !23, line: 5042, baseType: !124, size: 16)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !346, file: !23, line: 5043, baseType: !124, size: 16, offset: 16)
!350 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !346, file: !23, line: 5044, baseType: !124, size: 16, offset: 32)
!351 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !346, file: !23, line: 5045, baseType: !116, size: 8, offset: 48)
!352 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !346, file: !23, line: 5046, baseType: !116, size: 8, offset: 56)
!353 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !346, file: !23, line: 5047, baseType: !116, size: 8, offset: 64)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !346, file: !23, line: 5048, baseType: !116, size: 8, offset: 72)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !346, file: !23, line: 5049, baseType: !122, size: 16, offset: 80)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !346, file: !23, line: 5050, baseType: !122, size: 16, offset: 96)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !346, file: !23, line: 5051, baseType: !122, size: 16, offset: 112)
!358 = !DIDerivedType(tag: DW_TAG_member, scope: !346, file: !23, line: 5052, baseType: !359, size: 256, offset: 128)
!359 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !346, file: !23, line: 5052, size: 256, elements: !360)
!360 = !{!361, !366}
!361 = !DIDerivedType(tag: DW_TAG_member, scope: !359, file: !23, line: 5053, baseType: !362, size: 64)
!362 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !359, file: !23, line: 5053, size: 64, elements: !363)
!363 = !{!364, !365}
!364 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !362, file: !23, line: 5054, baseType: !130, size: 32)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !362, file: !23, line: 5055, baseType: !130, size: 32, offset: 32)
!366 = !DIDerivedType(tag: DW_TAG_member, scope: !359, file: !23, line: 5057, baseType: !367, size: 256)
!367 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !359, file: !23, line: 5057, size: 256, elements: !368)
!368 = !{!369, !370}
!369 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !367, file: !23, line: 5058, baseType: !275, size: 128)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !367, file: !23, line: 5059, baseType: !275, size: 128, offset: 128)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !346, file: !23, line: 5062, baseType: !131, size: 32, offset: 384)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !346, file: !23, line: 5063, baseType: !130, size: 32, offset: 416)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !312, file: !23, line: 4215, baseType: !165, size: 64, offset: 1216)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !312, file: !23, line: 4216, baseType: !131, size: 32, offset: 1280)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !312, file: !23, line: 4217, baseType: !131, size: 32, offset: 1312)
!376 = !DIDerivedType(tag: DW_TAG_member, scope: !312, file: !23, line: 4218, baseType: !377, size: 64, align: 64, offset: 1344)
!377 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !312, file: !23, line: 4218, size: 64, align: 64, elements: !378)
!378 = !{!379}
!379 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !377, file: !23, line: 4218, baseType: !380, size: 64)
!380 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !381, size: 64)
!381 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !23, line: 4272, size: 640, elements: !382)
!382 = !{!383, !384, !385, !386, !387, !388, !389, !390, !391, !392, !393, !394, !395, !396}
!383 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !381, file: !23, line: 4273, baseType: !131, size: 32)
!384 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !381, file: !23, line: 4274, baseType: !131, size: 32, offset: 32)
!385 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !381, file: !23, line: 4275, baseType: !131, size: 32, offset: 64)
!386 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !381, file: !23, line: 4276, baseType: !131, size: 32, offset: 96)
!387 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !381, file: !23, line: 4277, baseType: !131, size: 32, offset: 128)
!388 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !381, file: !23, line: 4278, baseType: !131, size: 32, offset: 160)
!389 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !381, file: !23, line: 4280, baseType: !131, size: 32, offset: 192)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !381, file: !23, line: 4281, baseType: !275, size: 128, offset: 224)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !381, file: !23, line: 4282, baseType: !131, size: 32, offset: 352)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !381, file: !23, line: 4283, baseType: !131, size: 32, offset: 384)
!393 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !381, file: !23, line: 4284, baseType: !131, size: 32, offset: 416)
!394 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !381, file: !23, line: 4285, baseType: !275, size: 128, offset: 448)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !381, file: !23, line: 4286, baseType: !131, size: 32, offset: 576)
!396 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !381, file: !23, line: 4287, baseType: !397, size: 32, offset: 608)
!397 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !117, line: 26, baseType: !154)
!398 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !312, file: !23, line: 4219, baseType: !131, size: 32, offset: 1408)
!399 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !400, size: 64)
!400 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "packet_info", file: !3, line: 90, size: 1024, elements: !401)
!401 = !{!402, !403, !404, !405, !406, !407, !412, !413, !414, !415, !416, !417, !418, !419}
!402 = !DIDerivedType(tag: DW_TAG_member, name: "time", scope: !400, file: !3, line: 91, baseType: !165, size: 64)
!403 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !400, file: !3, line: 92, baseType: !131, size: 32, offset: 64)
!404 = !DIDerivedType(tag: DW_TAG_member, name: "pid", scope: !400, file: !3, line: 93, baseType: !159, size: 384, offset: 96)
!405 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid", scope: !400, file: !3, line: 94, baseType: !159, size: 384, offset: 480)
!406 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !400, file: !3, line: 95, baseType: !131, size: 32, offset: 864)
!407 = !DIDerivedType(tag: DW_TAG_member, name: "ip_tos", scope: !400, file: !3, line: 99, baseType: !408, size: 32, offset: 896)
!408 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !400, file: !3, line: 96, size: 32, elements: !409)
!409 = !{!410, !411}
!410 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_tos", scope: !408, file: !3, line: 97, baseType: !116, size: 8)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_tos", scope: !408, file: !3, line: 98, baseType: !130, size: 32)
!412 = !DIDerivedType(tag: DW_TAG_member, name: "ip_len", scope: !400, file: !3, line: 100, baseType: !124, size: 16, offset: 928)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "is_ingress", scope: !400, file: !3, line: 101, baseType: !197, size: 8, offset: 944)
!414 = !DIDerivedType(tag: DW_TAG_member, name: "pid_flow_is_dfkey", scope: !400, file: !3, line: 102, baseType: !197, size: 8, offset: 952)
!415 = !DIDerivedType(tag: DW_TAG_member, name: "pid_valid", scope: !400, file: !3, line: 103, baseType: !197, size: 8, offset: 960)
!416 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid_valid", scope: !400, file: !3, line: 104, baseType: !197, size: 8, offset: 968)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !400, file: !3, line: 105, baseType: !5, size: 8, offset: 976)
!418 = !DIDerivedType(tag: DW_TAG_member, name: "event_reason", scope: !400, file: !3, line: 106, baseType: !13, size: 8, offset: 984)
!419 = !DIDerivedType(tag: DW_TAG_member, name: "wait_first_edge", scope: !400, file: !3, line: 107, baseType: !197, size: 8, offset: 992)
!420 = !{!421, !422, !423}
!421 = !DILocalVariable(name: "ctx", arg: 1, scope: !308, file: !3, line: 572, type: !311)
!422 = !DILocalVariable(name: "p_info", arg: 2, scope: !308, file: !3, line: 573, type: !399)
!423 = !DILocalVariable(name: "pctx", scope: !308, file: !3, line: 578, type: !424)
!424 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "parsing_context", file: !3, line: 72, size: 256, elements: !425)
!425 = !{!426, !427, !428, !433}
!426 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !424, file: !3, line: 73, baseType: !99, size: 64)
!427 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !424, file: !3, line: 74, baseType: !99, size: 64, offset: 64)
!428 = !DIDerivedType(tag: DW_TAG_member, name: "nh", scope: !424, file: !3, line: 75, baseType: !429, size: 64, offset: 128)
!429 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !430, line: 35, size: 64, elements: !431)
!430 = !DIFile(filename: "../lib/../include/xdp/parsing_helpers.h", directory: "/home/t-hlnu/bpfex2/pping")
!431 = !{!432}
!432 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !429, file: !430, line: 36, baseType: !99, size: 64)
!433 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_len", scope: !424, file: !3, line: 76, baseType: !131, size: 32, offset: 192)
!434 = !DILocation(line: 0, scope: !308)
!435 = !DILocation(line: 575, column: 7, scope: !436)
!436 = distinct !DILexicalBlock(scope: !308, file: !3, line: 575, column: 6)
!437 = !DILocation(line: 575, column: 6, scope: !308)
!438 = !DILocation(line: 578, column: 2, scope: !308)
!439 = !DILocation(line: 578, column: 25, scope: !308)
!440 = !DILocation(line: 578, column: 32, scope: !308)
!441 = !DILocation(line: 579, column: 30, scope: !308)
!442 = !{!443, !444, i64 76}
!443 = !{!"__sk_buff", !444, i64 0, !444, i64 4, !444, i64 8, !444, i64 12, !444, i64 16, !444, i64 20, !444, i64 24, !444, i64 28, !444, i64 32, !444, i64 36, !444, i64 40, !444, i64 44, !445, i64 48, !444, i64 68, !444, i64 72, !444, i64 76, !444, i64 80, !444, i64 84, !444, i64 88, !444, i64 92, !444, i64 96, !445, i64 100, !445, i64 116, !444, i64 132, !444, i64 136, !444, i64 140, !445, i64 144, !447, i64 152, !444, i64 160, !444, i64 164, !445, i64 168, !444, i64 176}
!444 = !{!"int", !445, i64 0}
!445 = !{!"omnipotent char", !446, i64 0}
!446 = !{!"Simple C/C++ TBAA"}
!447 = !{!"long long", !445, i64 0}
!448 = !DILocation(line: 579, column: 19, scope: !308)
!449 = !DILocation(line: 579, column: 11, scope: !308)
!450 = !{!451, !452, i64 0}
!451 = !{!"parsing_context", !452, i64 0, !452, i64 8, !453, i64 16, !444, i64 24}
!452 = !{!"any pointer", !445, i64 0}
!453 = !{!"hdr_cursor", !452, i64 0}
!454 = !DILocation(line: 580, column: 34, scope: !308)
!455 = !{!443, !444, i64 80}
!456 = !DILocation(line: 580, column: 23, scope: !308)
!457 = !DILocation(line: 580, column: 15, scope: !308)
!458 = !{!451, !452, i64 8}
!459 = !DILocation(line: 581, column: 9, scope: !308)
!460 = !{!453, !452, i64 0}
!461 = !DILocation(line: 582, column: 19, scope: !308)
!462 = !{!443, !444, i64 0}
!463 = !{!451, !444, i64 24}
!464 = !DILocation(line: 585, column: 9, scope: !308)
!465 = !DILocation(line: 586, column: 1, scope: !308)
!466 = distinct !DISubprogram(name: "parse_packet_identifier", scope: !3, file: !3, line: 477, type: !467, scopeLine: 479, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !470)
!467 = !DISubroutineType(types: !468)
!468 = !{!154, !469, !399}
!469 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !424, size: 64)
!470 = !{!471, !472, !473, !474, !475, !484, !494, !527}
!471 = !DILocalVariable(name: "pctx", arg: 1, scope: !466, file: !3, line: 477, type: !469)
!472 = !DILocalVariable(name: "p_info", arg: 2, scope: !466, file: !3, line: 478, type: !399)
!473 = !DILocalVariable(name: "proto", scope: !466, file: !3, line: 480, type: !154)
!474 = !DILocalVariable(name: "err", scope: !466, file: !3, line: 480, type: !154)
!475 = !DILocalVariable(name: "eth", scope: !466, file: !3, line: 481, type: !476)
!476 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !477, size: 64)
!477 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !478, line: 163, size: 112, elements: !479)
!478 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!479 = !{!480, !482, !483}
!480 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !477, file: !478, line: 164, baseType: !481, size: 48)
!481 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 48, elements: !285)
!482 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !477, file: !478, line: 165, baseType: !481, size: 48, offset: 48)
!483 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !477, file: !478, line: 166, baseType: !122, size: 16, offset: 96)
!484 = !DILocalVariable(name: "proto_info", scope: !466, file: !3, line: 482, type: !485)
!485 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "protocol_info", file: !3, line: 113, size: 128, elements: !486)
!486 = !{!487, !488, !489, !490, !491, !492, !493}
!487 = !DIDerivedType(tag: DW_TAG_member, name: "pid", scope: !485, file: !3, line: 114, baseType: !131, size: 32)
!488 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid", scope: !485, file: !3, line: 115, baseType: !131, size: 32, offset: 32)
!489 = !DIDerivedType(tag: DW_TAG_member, name: "pid_valid", scope: !485, file: !3, line: 116, baseType: !197, size: 8, offset: 64)
!490 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid_valid", scope: !485, file: !3, line: 117, baseType: !197, size: 8, offset: 72)
!491 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !485, file: !3, line: 118, baseType: !5, size: 8, offset: 80)
!492 = !DIDerivedType(tag: DW_TAG_member, name: "event_reason", scope: !485, file: !3, line: 119, baseType: !13, size: 8, offset: 88)
!493 = !DIDerivedType(tag: DW_TAG_member, name: "wait_first_edge", scope: !485, file: !3, line: 120, baseType: !197, size: 8, offset: 96)
!494 = !DILocalVariable(name: "iph_ptr", scope: !466, file: !3, line: 486, type: !495)
!495 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !466, file: !3, line: 483, size: 64, elements: !496)
!496 = !{!497, !514}
!497 = !DIDerivedType(tag: DW_TAG_member, name: "iph", scope: !495, file: !3, line: 484, baseType: !498, size: 64)
!498 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !499, size: 64)
!499 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !500, line: 86, size: 160, elements: !501)
!500 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!501 = !{!502, !503, !504, !505, !506, !507, !508, !509, !510, !512, !513}
!502 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !499, file: !500, line: 88, baseType: !116, size: 4, flags: DIFlagBitField, extraData: i64 0)
!503 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !499, file: !500, line: 89, baseType: !116, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!504 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !499, file: !500, line: 96, baseType: !116, size: 8, offset: 8)
!505 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !499, file: !500, line: 97, baseType: !122, size: 16, offset: 16)
!506 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !499, file: !500, line: 98, baseType: !122, size: 16, offset: 32)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !499, file: !500, line: 99, baseType: !122, size: 16, offset: 48)
!508 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !499, file: !500, line: 100, baseType: !116, size: 8, offset: 64)
!509 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !499, file: !500, line: 101, baseType: !116, size: 8, offset: 72)
!510 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !499, file: !500, line: 102, baseType: !511, size: 16, offset: 80)
!511 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !123, line: 31, baseType: !124)
!512 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !499, file: !500, line: 103, baseType: !130, size: 32, offset: 96)
!513 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !499, file: !500, line: 104, baseType: !130, size: 32, offset: 128)
!514 = !DIDerivedType(tag: DW_TAG_member, name: "ip6h", scope: !495, file: !3, line: 485, baseType: !515, size: 64)
!515 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !516, size: 64)
!516 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !517, line: 116, size: 320, elements: !518)
!517 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!518 = !{!519, !520, !521, !522, !523, !524, !525, !526}
!519 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !516, file: !517, line: 118, baseType: !116, size: 4, flags: DIFlagBitField, extraData: i64 0)
!520 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !516, file: !517, line: 119, baseType: !116, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!521 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !516, file: !517, line: 126, baseType: !228, size: 24, offset: 8)
!522 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !516, file: !517, line: 128, baseType: !122, size: 16, offset: 32)
!523 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !516, file: !517, line: 129, baseType: !116, size: 8, offset: 48)
!524 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !516, file: !517, line: 130, baseType: !116, size: 8, offset: 56)
!525 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !516, file: !517, line: 132, baseType: !108, size: 128, offset: 64)
!526 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !516, file: !517, line: 133, baseType: !108, size: 128, offset: 192)
!527 = !DILocalVariable(name: "transporth_ptr", scope: !466, file: !3, line: 491, type: !528)
!528 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !466, file: !3, line: 487, size: 64, elements: !529)
!529 = !{!530, !552, !576}
!530 = !DIDerivedType(tag: DW_TAG_member, name: "tcph", scope: !528, file: !3, line: 488, baseType: !531, size: 64)
!531 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !532, size: 64)
!532 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !533, line: 25, size: 160, elements: !534)
!533 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "")
!534 = !{!535, !536, !537, !538, !539, !540, !541, !542, !543, !544, !545, !546, !547, !548, !549, !550, !551}
!535 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !532, file: !533, line: 26, baseType: !122, size: 16)
!536 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !532, file: !533, line: 27, baseType: !122, size: 16, offset: 16)
!537 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !532, file: !533, line: 28, baseType: !130, size: 32, offset: 32)
!538 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !532, file: !533, line: 29, baseType: !130, size: 32, offset: 64)
!539 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !532, file: !533, line: 31, baseType: !124, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!540 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !532, file: !533, line: 32, baseType: !124, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!541 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !532, file: !533, line: 33, baseType: !124, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!542 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !532, file: !533, line: 34, baseType: !124, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!543 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !532, file: !533, line: 35, baseType: !124, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!544 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !532, file: !533, line: 36, baseType: !124, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!545 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !532, file: !533, line: 37, baseType: !124, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!546 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !532, file: !533, line: 38, baseType: !124, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!547 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !532, file: !533, line: 39, baseType: !124, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!548 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !532, file: !533, line: 40, baseType: !124, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!549 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !532, file: !533, line: 55, baseType: !122, size: 16, offset: 112)
!550 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !532, file: !533, line: 56, baseType: !511, size: 16, offset: 128)
!551 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !532, file: !533, line: 57, baseType: !122, size: 16, offset: 144)
!552 = !DIDerivedType(tag: DW_TAG_member, name: "icmph", scope: !528, file: !3, line: 489, baseType: !553, size: 64)
!553 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !554, size: 64)
!554 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !555, line: 69, size: 64, elements: !556)
!555 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "")
!556 = !{!557, !558, !559, !560}
!557 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !554, file: !555, line: 70, baseType: !116, size: 8)
!558 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !554, file: !555, line: 71, baseType: !116, size: 8, offset: 8)
!559 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !554, file: !555, line: 72, baseType: !511, size: 16, offset: 16)
!560 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !554, file: !555, line: 84, baseType: !561, size: 32, offset: 32)
!561 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !554, file: !555, line: 73, size: 32, elements: !562)
!562 = !{!563, !568, !569, !574}
!563 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !561, file: !555, line: 77, baseType: !564, size: 32)
!564 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !561, file: !555, line: 74, size: 32, elements: !565)
!565 = !{!566, !567}
!566 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !564, file: !555, line: 75, baseType: !122, size: 16)
!567 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !564, file: !555, line: 76, baseType: !122, size: 16, offset: 16)
!568 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !561, file: !555, line: 78, baseType: !130, size: 32)
!569 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !561, file: !555, line: 82, baseType: !570, size: 32)
!570 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !561, file: !555, line: 79, size: 32, elements: !571)
!571 = !{!572, !573}
!572 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !570, file: !555, line: 80, baseType: !122, size: 16)
!573 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !570, file: !555, line: 81, baseType: !122, size: 16, offset: 16)
!574 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !561, file: !555, line: 83, baseType: !575, size: 32)
!575 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 32, elements: !132)
!576 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6h", scope: !528, file: !3, line: 490, baseType: !577, size: 64)
!577 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !578, size: 64)
!578 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !579, line: 8, size: 64, elements: !580)
!579 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "")
!580 = !{!581, !582, !583, !584}
!581 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !578, file: !579, line: 10, baseType: !116, size: 8)
!582 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !578, file: !579, line: 11, baseType: !116, size: 8, offset: 8)
!583 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !578, file: !579, line: 12, baseType: !511, size: 16, offset: 16)
!584 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !578, file: !579, line: 63, baseType: !585, size: 32, offset: 32)
!585 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !578, file: !579, line: 15, size: 32, elements: !586)
!586 = !{!587, !589, !591, !592, !597, !605}
!587 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !585, file: !579, line: 16, baseType: !588, size: 32)
!588 = !DICompositeType(tag: DW_TAG_array_type, baseType: !130, size: 32, elements: !155)
!589 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !585, file: !579, line: 17, baseType: !590, size: 32)
!590 = !DICompositeType(tag: DW_TAG_array_type, baseType: !122, size: 32, elements: !243)
!591 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !585, file: !579, line: 18, baseType: !575, size: 32)
!592 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !585, file: !579, line: 23, baseType: !593, size: 32)
!593 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !579, line: 20, size: 32, elements: !594)
!594 = !{!595, !596}
!595 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !593, file: !579, line: 21, baseType: !122, size: 16)
!596 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !593, file: !579, line: 22, baseType: !122, size: 16, offset: 16)
!597 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !585, file: !579, line: 40, baseType: !598, size: 32)
!598 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !579, line: 25, size: 32, elements: !599)
!599 = !{!600, !601, !602, !603, !604}
!600 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !598, file: !579, line: 27, baseType: !131, size: 5, flags: DIFlagBitField, extraData: i64 0)
!601 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !598, file: !579, line: 28, baseType: !131, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!602 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !598, file: !579, line: 29, baseType: !131, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!603 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !598, file: !579, line: 30, baseType: !131, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!604 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !598, file: !579, line: 31, baseType: !131, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!605 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !585, file: !579, line: 61, baseType: !606, size: 32)
!606 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !579, line: 42, size: 32, elements: !607)
!607 = !{!608, !609, !610, !611, !612, !613, !614}
!608 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !606, file: !579, line: 43, baseType: !116, size: 8)
!609 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !606, file: !579, line: 45, baseType: !116, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!610 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !606, file: !579, line: 46, baseType: !116, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!611 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !606, file: !579, line: 47, baseType: !116, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!612 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !606, file: !579, line: 48, baseType: !116, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!613 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !606, file: !579, line: 49, baseType: !116, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!614 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !606, file: !579, line: 60, baseType: !122, size: 16, offset: 16)
!615 = !DILocation(line: 482, column: 23, scope: !466)
!616 = !DILocation(line: 0, scope: !466)
!617 = !DILocation(line: 493, column: 17, scope: !466)
!618 = !DILocation(line: 493, column: 10, scope: !466)
!619 = !DILocation(line: 493, column: 15, scope: !466)
!620 = !{!621, !447, i64 0}
!621 = !{!"packet_info", !447, i64 0, !444, i64 8, !622, i64 12, !622, i64 60, !444, i64 108, !445, i64 112, !626, i64 116, !627, i64 118, !627, i64 119, !627, i64 120, !627, i64 121, !445, i64 122, !445, i64 123, !627, i64 124}
!622 = !{!"packet_id", !623, i64 0, !444, i64 44}
!623 = !{!"network_tuple", !624, i64 0, !624, i64 20, !626, i64 40, !445, i64 42, !445, i64 43}
!624 = !{!"flow_address", !625, i64 0, !626, i64 16, !626, i64 18}
!625 = !{!"in6_addr", !445, i64 0}
!626 = !{!"short", !445, i64 0}
!627 = !{!"_Bool", !445, i64 0}
!628 = !DILocation(line: 494, column: 40, scope: !466)
!629 = !DILocalVariable(name: "nh", arg: 1, scope: !630, file: !430, line: 131, type: !633)
!630 = distinct !DISubprogram(name: "parse_ethhdr", scope: !430, file: !430, line: 131, type: !631, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !635)
!631 = !DISubroutineType(types: !632)
!632 = !{!154, !633, !99, !634}
!633 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !429, size: 64)
!634 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !476, size: 64)
!635 = !{!629, !636, !637}
!636 = !DILocalVariable(name: "data_end", arg: 2, scope: !630, file: !430, line: 132, type: !99)
!637 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !630, file: !430, line: 133, type: !634)
!638 = !DILocation(line: 0, scope: !630, inlinedAt: !639)
!639 = distinct !DILocation(line: 494, column: 10, scope: !466)
!640 = !DILocalVariable(name: "nh", arg: 1, scope: !641, file: !430, line: 86, type: !633)
!641 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !430, file: !430, line: 86, type: !642, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !649)
!642 = !DISubroutineType(types: !643)
!643 = !{!154, !633, !99, !634, !644}
!644 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !645, size: 64)
!645 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !430, line: 71, size: 32, elements: !646)
!646 = !{!647}
!647 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !645, file: !430, line: 72, baseType: !648, size: 32)
!648 = !DICompositeType(tag: DW_TAG_array_type, baseType: !124, size: 32, elements: !243)
!649 = !{!640, !650, !651, !652, !653, !654, !655, !661, !662}
!650 = !DILocalVariable(name: "data_end", arg: 2, scope: !641, file: !430, line: 87, type: !99)
!651 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !641, file: !430, line: 88, type: !634)
!652 = !DILocalVariable(name: "vlans", arg: 4, scope: !641, file: !430, line: 89, type: !644)
!653 = !DILocalVariable(name: "eth", scope: !641, file: !430, line: 91, type: !476)
!654 = !DILocalVariable(name: "hdrsize", scope: !641, file: !430, line: 92, type: !154)
!655 = !DILocalVariable(name: "vlh", scope: !641, file: !430, line: 93, type: !656)
!656 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !657, size: 64)
!657 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !430, line: 44, size: 32, elements: !658)
!658 = !{!659, !660}
!659 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !657, file: !430, line: 45, baseType: !122, size: 16)
!660 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !657, file: !430, line: 46, baseType: !122, size: 16, offset: 16)
!661 = !DILocalVariable(name: "h_proto", scope: !641, file: !430, line: 94, type: !124)
!662 = !DILocalVariable(name: "i", scope: !641, file: !430, line: 95, type: !154)
!663 = !DILocation(line: 0, scope: !641, inlinedAt: !664)
!664 = distinct !DILocation(line: 136, column: 9, scope: !630, inlinedAt: !639)
!665 = !DILocation(line: 91, column: 27, scope: !641, inlinedAt: !664)
!666 = !DILocation(line: 100, column: 14, scope: !667, inlinedAt: !664)
!667 = distinct !DILexicalBlock(scope: !641, file: !430, line: 100, column: 6)
!668 = !DILocation(line: 100, column: 24, scope: !667, inlinedAt: !664)
!669 = !DILocation(line: 100, column: 6, scope: !641, inlinedAt: !664)
!670 = !DILocation(line: 106, column: 17, scope: !641, inlinedAt: !664)
!671 = !{!626, !626, i64 0}
!672 = !DILocation(line: 112, column: 2, scope: !673, inlinedAt: !664)
!673 = distinct !DILexicalBlock(scope: !641, file: !430, line: 112, column: 2)
!674 = !DILocation(line: 113, column: 7, scope: !675, inlinedAt: !664)
!675 = distinct !DILexicalBlock(scope: !676, file: !430, line: 112, column: 39)
!676 = distinct !DILexicalBlock(scope: !673, file: !430, line: 112, column: 2)
!677 = !DILocation(line: 116, column: 11, scope: !678, inlinedAt: !664)
!678 = distinct !DILexicalBlock(scope: !675, file: !430, line: 116, column: 7)
!679 = !DILocation(line: 116, column: 15, scope: !678, inlinedAt: !664)
!680 = !DILocation(line: 116, column: 7, scope: !675, inlinedAt: !664)
!681 = !DILocation(line: 119, column: 18, scope: !675, inlinedAt: !664)
!682 = !DILocation(line: 127, column: 10, scope: !641, inlinedAt: !664)
!683 = !DILocation(line: 497, column: 6, scope: !466)
!684 = !DILocation(line: 498, column: 20, scope: !685)
!685 = distinct !DILexicalBlock(scope: !686, file: !3, line: 497, column: 36)
!686 = distinct !DILexicalBlock(scope: !466, file: !3, line: 497, column: 6)
!687 = !DILocation(line: 498, column: 24, scope: !685)
!688 = !{!621, !445, i64 54}
!689 = !DILocalVariable(name: "nh", arg: 1, scope: !690, file: !430, line: 196, type: !633)
!690 = distinct !DISubprogram(name: "parse_iphdr", scope: !430, file: !430, line: 196, type: !691, scopeLine: 199, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !694)
!691 = !DISubroutineType(types: !692)
!692 = !{!154, !633, !99, !693}
!693 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !498, size: 64)
!694 = !{!689, !695, !696, !697, !698}
!695 = !DILocalVariable(name: "data_end", arg: 2, scope: !690, file: !430, line: 197, type: !99)
!696 = !DILocalVariable(name: "iphdr", arg: 3, scope: !690, file: !430, line: 198, type: !693)
!697 = !DILocalVariable(name: "iph", scope: !690, file: !430, line: 200, type: !498)
!698 = !DILocalVariable(name: "hdrsize", scope: !690, file: !430, line: 201, type: !154)
!699 = !DILocation(line: 0, scope: !690, inlinedAt: !700)
!700 = distinct !DILocation(line: 500, column: 4, scope: !685)
!701 = !DILocation(line: 203, column: 10, scope: !702, inlinedAt: !700)
!702 = distinct !DILexicalBlock(scope: !690, file: !430, line: 203, column: 6)
!703 = !DILocation(line: 203, column: 14, scope: !702, inlinedAt: !700)
!704 = !DILocation(line: 203, column: 6, scope: !690, inlinedAt: !700)
!705 = !DILocation(line: 206, column: 11, scope: !706, inlinedAt: !700)
!706 = distinct !DILexicalBlock(scope: !690, file: !430, line: 206, column: 6)
!707 = !DILocation(line: 206, column: 19, scope: !706, inlinedAt: !700)
!708 = !DILocation(line: 206, column: 6, scope: !690, inlinedAt: !700)
!709 = !DILocation(line: 209, column: 21, scope: !690, inlinedAt: !700)
!710 = !DILocation(line: 211, column: 13, scope: !711, inlinedAt: !700)
!711 = distinct !DILexicalBlock(scope: !690, file: !430, line: 211, column: 5)
!712 = !DILocation(line: 211, column: 5, scope: !690, inlinedAt: !700)
!713 = !DILocation(line: 215, column: 14, scope: !714, inlinedAt: !700)
!714 = distinct !DILexicalBlock(scope: !690, file: !430, line: 215, column: 6)
!715 = !DILocation(line: 215, column: 24, scope: !714, inlinedAt: !700)
!716 = !DILocation(line: 215, column: 6, scope: !690, inlinedAt: !700)
!717 = !DILocation(line: 218, column: 10, scope: !690, inlinedAt: !700)
!718 = !DILocation(line: 219, column: 9, scope: !690, inlinedAt: !700)
!719 = !DILocation(line: 221, column: 14, scope: !690, inlinedAt: !700)
!720 = !{!721, !445, i64 9}
!721 = !{!"iphdr", !445, i64 0, !445, i64 0, !445, i64 1, !626, i64 2, !626, i64 4, !626, i64 6, !445, i64 8, !445, i64 9, !626, i64 10, !444, i64 12, !444, i64 16}
!722 = !DILocation(line: 221, column: 9, scope: !690, inlinedAt: !700)
!723 = !DILocation(line: 221, column: 2, scope: !690, inlinedAt: !700)
!724 = !DILocation(line: 502, column: 20, scope: !725)
!725 = distinct !DILexicalBlock(scope: !726, file: !3, line: 501, column: 45)
!726 = distinct !DILexicalBlock(scope: !686, file: !3, line: 501, column: 13)
!727 = !DILocation(line: 502, column: 24, scope: !725)
!728 = !DILocalVariable(name: "nh", arg: 1, scope: !729, file: !430, line: 174, type: !633)
!729 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !430, file: !430, line: 174, type: !730, scopeLine: 177, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !733)
!730 = !DISubroutineType(types: !731)
!731 = !{!154, !633, !99, !732}
!732 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !515, size: 64)
!733 = !{!728, !734, !735, !736}
!734 = !DILocalVariable(name: "data_end", arg: 2, scope: !729, file: !430, line: 175, type: !99)
!735 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !729, file: !430, line: 176, type: !732)
!736 = !DILocalVariable(name: "ip6h", scope: !729, file: !430, line: 178, type: !515)
!737 = !DILocation(line: 0, scope: !729, inlinedAt: !738)
!738 = distinct !DILocation(line: 504, column: 4, scope: !725)
!739 = !DILocation(line: 184, column: 11, scope: !740, inlinedAt: !738)
!740 = distinct !DILexicalBlock(scope: !729, file: !430, line: 184, column: 6)
!741 = !DILocation(line: 184, column: 15, scope: !740, inlinedAt: !738)
!742 = !DILocation(line: 184, column: 6, scope: !729, inlinedAt: !738)
!743 = !DILocation(line: 187, column: 12, scope: !744, inlinedAt: !738)
!744 = distinct !DILexicalBlock(scope: !729, file: !430, line: 187, column: 6)
!745 = !DILocation(line: 187, column: 20, scope: !744, inlinedAt: !738)
!746 = !DILocation(line: 187, column: 6, scope: !729, inlinedAt: !738)
!747 = !DILocation(line: 190, column: 10, scope: !729, inlinedAt: !738)
!748 = !DILocation(line: 191, column: 10, scope: !729, inlinedAt: !738)
!749 = !DILocation(line: 193, column: 44, scope: !729, inlinedAt: !738)
!750 = !{!751, !445, i64 6}
!751 = !{!"ipv6hdr", !445, i64 0, !445, i64 0, !445, i64 1, !626, i64 4, !445, i64 6, !445, i64 7, !625, i64 8, !625, i64 24}
!752 = !DILocalVariable(name: "nh", arg: 1, scope: !753, file: !430, line: 139, type: !633)
!753 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !430, file: !430, line: 139, type: !754, scopeLine: 142, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !756)
!754 = !DISubroutineType(types: !755)
!755 = !{!154, !633, !99, !116}
!756 = !{!752, !757, !758, !759, !761}
!757 = !DILocalVariable(name: "data_end", arg: 2, scope: !753, file: !430, line: 140, type: !99)
!758 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !753, file: !430, line: 141, type: !116)
!759 = !DILocalVariable(name: "i", scope: !760, file: !430, line: 143, type: !154)
!760 = distinct !DILexicalBlock(scope: !753, file: !430, line: 143, column: 2)
!761 = !DILocalVariable(name: "hdr", scope: !762, file: !430, line: 144, type: !764)
!762 = distinct !DILexicalBlock(scope: !763, file: !430, line: 143, column: 47)
!763 = distinct !DILexicalBlock(scope: !760, file: !430, line: 143, column: 2)
!764 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !765, size: 64)
!765 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !517, line: 61, size: 16, elements: !766)
!766 = !{!767, !768}
!767 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !765, file: !517, line: 62, baseType: !116, size: 8)
!768 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !765, file: !517, line: 63, baseType: !116, size: 8, offset: 8)
!769 = !DILocation(line: 0, scope: !753, inlinedAt: !770)
!770 = distinct !DILocation(line: 193, column: 9, scope: !729, inlinedAt: !738)
!771 = !DILocation(line: 0, scope: !760, inlinedAt: !770)
!772 = !DILocation(line: 0, scope: !762, inlinedAt: !770)
!773 = !DILocation(line: 146, column: 11, scope: !774, inlinedAt: !770)
!774 = distinct !DILexicalBlock(scope: !762, file: !430, line: 146, column: 7)
!775 = !DILocation(line: 146, column: 15, scope: !774, inlinedAt: !770)
!776 = !DILocation(line: 146, column: 7, scope: !762, inlinedAt: !770)
!777 = !DILocation(line: 149, column: 3, scope: !762, inlinedAt: !770)
!778 = !DILocation(line: 154, column: 34, scope: !779, inlinedAt: !770)
!779 = distinct !DILexicalBlock(scope: !762, file: !430, line: 149, column: 26)
!780 = !{!781, !445, i64 1}
!781 = !{!"ipv6_opt_hdr", !445, i64 0, !445, i64 1}
!782 = !DILocation(line: 154, column: 29, scope: !779, inlinedAt: !770)
!783 = !DILocation(line: 154, column: 46, scope: !779, inlinedAt: !770)
!784 = !DILocation(line: 154, column: 26, scope: !779, inlinedAt: !770)
!785 = !DILocation(line: 156, column: 4, scope: !779, inlinedAt: !770)
!786 = !DILocation(line: 158, column: 34, scope: !779, inlinedAt: !770)
!787 = !DILocation(line: 158, column: 29, scope: !779, inlinedAt: !770)
!788 = !DILocation(line: 158, column: 46, scope: !779, inlinedAt: !770)
!789 = !DILocation(line: 158, column: 26, scope: !779, inlinedAt: !770)
!790 = !DILocation(line: 160, column: 4, scope: !779, inlinedAt: !770)
!791 = !DILocation(line: 162, column: 26, scope: !779, inlinedAt: !770)
!792 = !DILocation(line: 164, column: 4, scope: !779, inlinedAt: !770)
!793 = !DILocation(line: 149, column: 11, scope: !762, inlinedAt: !770)
!794 = !DILocation(line: 167, column: 4, scope: !779, inlinedAt: !770)
!795 = !DILocation(line: 0, scope: !779, inlinedAt: !770)
!796 = !{!781, !445, i64 0}
!797 = !DILocation(line: 162, column: 12, scope: !779, inlinedAt: !770)
!798 = !DILocation(line: 158, column: 12, scope: !779, inlinedAt: !770)
!799 = !DILocation(line: 154, column: 12, scope: !779, inlinedAt: !770)
!800 = !DILocation(line: 0, scope: !686)
!801 = !{!621, !626, i64 52}
!802 = !DILocation(line: 510, column: 13, scope: !803)
!803 = distinct !DILexicalBlock(scope: !466, file: !3, line: 510, column: 6)
!804 = !{!805, !627, i64 17}
!805 = !{!"bpf_config", !447, i64 0, !447, i64 8, !627, i64 16, !627, i64 17, !627, i64 18, !627, i64 19, !627, i64 20, !445, i64 21}
!806 = !{i8 0, i8 2}
!807 = !DILocation(line: 510, column: 23, scope: !803)
!808 = !DILocation(line: 512, column: 33, scope: !803)
!809 = !DILocation(line: 513, column: 33, scope: !803)
!810 = !DILocalVariable(name: "pctx", arg: 1, scope: !811, file: !3, line: 333, type: !469)
!811 = distinct !DISubprogram(name: "parse_tcp_identifier", scope: !3, file: !3, line: 333, type: !812, scopeLine: 336, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !817)
!812 = !DISubroutineType(types: !813)
!813 = !{!154, !469, !814, !815, !815, !816}
!814 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !531, size: 64)
!815 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!816 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !485, size: 64)
!817 = !{!810, !818, !819, !820, !821, !822}
!818 = !DILocalVariable(name: "tcph", arg: 2, scope: !811, file: !3, line: 334, type: !814)
!819 = !DILocalVariable(name: "sport", arg: 3, scope: !811, file: !3, line: 334, type: !815)
!820 = !DILocalVariable(name: "dport", arg: 4, scope: !811, file: !3, line: 335, type: !815)
!821 = !DILocalVariable(name: "proto_info", arg: 5, scope: !811, file: !3, line: 335, type: !816)
!822 = !DILocalVariable(name: "hdr", scope: !811, file: !3, line: 337, type: !531)
!823 = !DILocation(line: 0, scope: !811, inlinedAt: !824)
!824 = distinct !DILocation(line: 511, column: 9, scope: !803)
!825 = !DILocalVariable(name: "nh", arg: 1, scope: !826, file: !430, line: 295, type: !633)
!826 = distinct !DISubprogram(name: "parse_tcphdr", scope: !430, file: !430, line: 295, type: !827, scopeLine: 298, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !829)
!827 = !DISubroutineType(types: !828)
!828 = !{!154, !633, !99, !814}
!829 = !{!825, !830, !831, !832, !833}
!830 = !DILocalVariable(name: "data_end", arg: 2, scope: !826, file: !430, line: 296, type: !99)
!831 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !826, file: !430, line: 297, type: !814)
!832 = !DILocalVariable(name: "len", scope: !826, file: !430, line: 299, type: !154)
!833 = !DILocalVariable(name: "h", scope: !826, file: !430, line: 300, type: !531)
!834 = !DILocation(line: 0, scope: !826, inlinedAt: !835)
!835 = distinct !DILocation(line: 338, column: 6, scope: !836, inlinedAt: !824)
!836 = distinct !DILexicalBlock(scope: !811, file: !3, line: 338, column: 6)
!837 = !DILocation(line: 300, column: 25, scope: !826, inlinedAt: !835)
!838 = !DILocation(line: 302, column: 8, scope: !839, inlinedAt: !835)
!839 = distinct !DILexicalBlock(scope: !826, file: !430, line: 302, column: 6)
!840 = !DILocation(line: 302, column: 12, scope: !839, inlinedAt: !835)
!841 = !DILocation(line: 302, column: 6, scope: !826, inlinedAt: !835)
!842 = !DILocation(line: 305, column: 11, scope: !826, inlinedAt: !835)
!843 = !DILocation(line: 305, column: 16, scope: !826, inlinedAt: !835)
!844 = !DILocation(line: 307, column: 9, scope: !845, inlinedAt: !835)
!845 = distinct !DILexicalBlock(scope: !826, file: !430, line: 307, column: 5)
!846 = !DILocation(line: 307, column: 5, scope: !826, inlinedAt: !835)
!847 = !DILocation(line: 311, column: 14, scope: !848, inlinedAt: !835)
!848 = distinct !DILexicalBlock(scope: !826, file: !430, line: 311, column: 6)
!849 = !DILocation(line: 311, column: 20, scope: !848, inlinedAt: !835)
!850 = !DILocation(line: 311, column: 6, scope: !826, inlinedAt: !835)
!851 = !DILocation(line: 314, column: 10, scope: !826, inlinedAt: !835)
!852 = !DILocation(line: 341, column: 13, scope: !853, inlinedAt: !824)
!853 = distinct !DILexicalBlock(scope: !811, file: !3, line: 341, column: 6)
!854 = !{!805, !627, i64 20}
!855 = !DILocation(line: 341, column: 22, scope: !853, inlinedAt: !824)
!856 = !DILocalVariable(name: "tcph", arg: 1, scope: !857, file: !3, line: 274, type: !531)
!857 = distinct !DISubprogram(name: "parse_tcp_ts", scope: !3, file: !3, line: 274, type: !858, scopeLine: 276, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !860)
!858 = !DISubroutineType(types: !859)
!859 = !{!154, !531, !99, !144, !144}
!860 = !{!856, !861, !862, !863, !864, !865, !866, !867, !868, !869}
!861 = !DILocalVariable(name: "data_end", arg: 2, scope: !857, file: !3, line: 274, type: !99)
!862 = !DILocalVariable(name: "tsval", arg: 3, scope: !857, file: !3, line: 274, type: !144)
!863 = !DILocalVariable(name: "tsecr", arg: 4, scope: !857, file: !3, line: 275, type: !144)
!864 = !DILocalVariable(name: "len", scope: !857, file: !3, line: 277, type: !154)
!865 = !DILocalVariable(name: "opt_end", scope: !857, file: !3, line: 278, type: !99)
!866 = !DILocalVariable(name: "pos", scope: !857, file: !3, line: 279, type: !143)
!867 = !DILocalVariable(name: "i", scope: !857, file: !3, line: 280, type: !116)
!868 = !DILocalVariable(name: "opt", scope: !857, file: !3, line: 280, type: !116)
!869 = !DILocalVariable(name: "opt_size", scope: !857, file: !3, line: 282, type: !870)
!870 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !116)
!871 = !DILocation(line: 0, scope: !857, inlinedAt: !872)
!872 = distinct !DILocation(line: 344, column: 6, scope: !873, inlinedAt: !824)
!873 = distinct !DILexicalBlock(scope: !811, file: !3, line: 344, column: 6)
!874 = !DILocation(line: 277, column: 23, scope: !857, inlinedAt: !872)
!875 = !DILocation(line: 278, column: 31, scope: !857, inlinedAt: !872)
!876 = !DILocation(line: 281, column: 2, scope: !857, inlinedAt: !872)
!877 = !DILocation(line: 282, column: 3, scope: !857, inlinedAt: !872)
!878 = !DILocation(line: 284, column: 26, scope: !879, inlinedAt: !872)
!879 = distinct !DILexicalBlock(scope: !857, file: !3, line: 284, column: 6)
!880 = !DILocation(line: 288, column: 11, scope: !881, inlinedAt: !872)
!881 = distinct !DILexicalBlock(scope: !882, file: !3, line: 288, column: 7)
!882 = distinct !DILexicalBlock(scope: !883, file: !3, line: 287, column: 40)
!883 = distinct !DILexicalBlock(scope: !884, file: !3, line: 287, column: 2)
!884 = distinct !DILexicalBlock(scope: !857, file: !3, line: 287, column: 2)
!885 = !DILocation(line: 288, column: 15, scope: !881, inlinedAt: !872)
!886 = !DILocation(line: 288, column: 25, scope: !881, inlinedAt: !872)
!887 = !DILocation(line: 291, column: 9, scope: !882, inlinedAt: !872)
!888 = !{!445, !445, i64 0}
!889 = !DILocation(line: 292, column: 7, scope: !882, inlinedAt: !872)
!890 = !DILocation(line: 301, column: 11, scope: !891, inlinedAt: !872)
!891 = distinct !DILexicalBlock(scope: !882, file: !3, line: 301, column: 7)
!892 = !DILocation(line: 301, column: 15, scope: !891, inlinedAt: !872)
!893 = !DILocation(line: 301, column: 25, scope: !891, inlinedAt: !872)
!894 = !DILocation(line: 303, column: 14, scope: !882, inlinedAt: !872)
!895 = !DILocation(line: 303, column: 12, scope: !882, inlinedAt: !872)
!896 = !DILocation(line: 304, column: 7, scope: !897, inlinedAt: !872)
!897 = distinct !DILexicalBlock(scope: !882, file: !3, line: 304, column: 7)
!898 = !DILocation(line: 304, column: 16, scope: !897, inlinedAt: !872)
!899 = !DILocation(line: 304, column: 7, scope: !882, inlinedAt: !872)
!900 = !DILocation(line: 308, column: 11, scope: !901, inlinedAt: !872)
!901 = distinct !DILexicalBlock(scope: !882, file: !3, line: 308, column: 7)
!902 = !DILocation(line: 308, column: 16, scope: !901, inlinedAt: !872)
!903 = !DILocation(line: 308, column: 19, scope: !901, inlinedAt: !872)
!904 = !DILocation(line: 308, column: 28, scope: !901, inlinedAt: !872)
!905 = !DILocation(line: 308, column: 7, scope: !882, inlinedAt: !872)
!906 = !DILocation(line: 309, column: 12, scope: !907, inlinedAt: !872)
!907 = distinct !DILexicalBlock(scope: !908, file: !3, line: 309, column: 8)
!908 = distinct !DILexicalBlock(scope: !901, file: !3, line: 308, column: 35)
!909 = !DILocation(line: 309, column: 17, scope: !907, inlinedAt: !872)
!910 = !DILocation(line: 309, column: 27, scope: !907, inlinedAt: !872)
!911 = !DILocation(line: 317, column: 10, scope: !882, inlinedAt: !872)
!912 = !DILocation(line: 317, column: 7, scope: !882, inlinedAt: !872)
!913 = !DILocation(line: 318, column: 2, scope: !882, inlinedAt: !872)
!914 = !DILocation(line: 0, scope: !882, inlinedAt: !872)
!915 = !DILocation(line: 320, column: 1, scope: !857, inlinedAt: !872)
!916 = !DILocation(line: 344, column: 6, scope: !811, inlinedAt: !824)
!917 = !DILocation(line: 311, column: 13, scope: !908, inlinedAt: !872)
!918 = !{!444, !444, i64 0}
!919 = !DILocation(line: 312, column: 13, scope: !908, inlinedAt: !872)
!920 = !DILocation(line: 350, column: 24, scope: !811, inlinedAt: !824)
!921 = !DILocation(line: 350, column: 16, scope: !811, inlinedAt: !824)
!922 = !DILocation(line: 350, column: 37, scope: !811, inlinedAt: !824)
!923 = !DILocation(line: 350, column: 31, scope: !811, inlinedAt: !824)
!924 = !DILocation(line: 350, column: 29, scope: !811, inlinedAt: !824)
!925 = !DILocation(line: 350, column: 45, scope: !811, inlinedAt: !824)
!926 = !DILocation(line: 349, column: 24, scope: !811, inlinedAt: !824)
!927 = !DILocation(line: 353, column: 30, scope: !811, inlinedAt: !824)
!928 = !DILocation(line: 356, column: 6, scope: !929, inlinedAt: !824)
!929 = distinct !DILexicalBlock(scope: !811, file: !3, line: 356, column: 6)
!930 = !DILocation(line: 356, column: 6, scope: !811, inlinedAt: !824)
!931 = !DILocation(line: 359, column: 13, scope: !932, inlinedAt: !824)
!932 = distinct !DILexicalBlock(scope: !929, file: !3, line: 359, column: 13)
!933 = !DILocation(line: 359, column: 13, scope: !929, inlinedAt: !824)
!934 = !DILocation(line: 365, column: 4, scope: !935, inlinedAt: !824)
!935 = distinct !DILexicalBlock(scope: !936, file: !3, line: 362, column: 23)
!936 = distinct !DILexicalBlock(scope: !932, file: !3, line: 362, column: 13)
!937 = !DILocation(line: 367, column: 2, scope: !935, inlinedAt: !824)
!938 = !DILocation(line: 0, scope: !929, inlinedAt: !824)
!939 = !DILocation(line: 373, column: 16, scope: !811, inlinedAt: !824)
!940 = !{!941, !626, i64 0}
!941 = !{!"tcphdr", !626, i64 0, !626, i64 2, !444, i64 4, !444, i64 8, !626, i64 12, !626, i64 12, !626, i64 13, !626, i64 13, !626, i64 13, !626, i64 13, !626, i64 13, !626, i64 13, !626, i64 13, !626, i64 13, !626, i64 14, !626, i64 16, !626, i64 18}
!942 = !DILocation(line: 373, column: 9, scope: !811, inlinedAt: !824)
!943 = !DILocation(line: 374, column: 16, scope: !811, inlinedAt: !824)
!944 = !{!941, !626, i64 2}
!945 = !DILocation(line: 374, column: 9, scope: !811, inlinedAt: !824)
!946 = !DILocation(line: 377, column: 2, scope: !811, inlinedAt: !824)
!947 = !DILocation(line: 515, column: 18, scope: !948)
!948 = distinct !DILexicalBlock(scope: !803, file: !3, line: 515, column: 11)
!949 = !{!805, !627, i64 18}
!950 = !DILocation(line: 515, column: 29, scope: !948)
!951 = !DILocation(line: 519, column: 35, scope: !948)
!952 = !DILocation(line: 520, column: 35, scope: !948)
!953 = !DILocalVariable(name: "pctx", arg: 1, scope: !954, file: !3, line: 395, type: !469)
!954 = distinct !DISubprogram(name: "parse_icmp6_identifier", scope: !3, file: !3, line: 395, type: !955, scopeLine: 399, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !958)
!955 = !DISubroutineType(types: !956)
!956 = !{!154, !469, !957, !815, !815, !816}
!957 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !577, size: 64)
!958 = !{!953, !959, !960, !961, !962, !963}
!959 = !DILocalVariable(name: "icmp6h", arg: 2, scope: !954, file: !3, line: 396, type: !957)
!960 = !DILocalVariable(name: "sport", arg: 3, scope: !954, file: !3, line: 396, type: !815)
!961 = !DILocalVariable(name: "dport", arg: 4, scope: !954, file: !3, line: 397, type: !815)
!962 = !DILocalVariable(name: "proto_info", arg: 5, scope: !954, file: !3, line: 398, type: !816)
!963 = !DILocalVariable(name: "hdr", scope: !954, file: !3, line: 400, type: !577)
!964 = !DILocation(line: 0, scope: !954, inlinedAt: !965)
!965 = distinct !DILocation(line: 518, column: 9, scope: !948)
!966 = !DILocalVariable(name: "nh", arg: 1, scope: !967, file: !430, line: 224, type: !633)
!967 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !430, file: !430, line: 224, type: !968, scopeLine: 227, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !970)
!968 = !DISubroutineType(types: !969)
!969 = !{!154, !633, !99, !957}
!970 = !{!966, !971, !972, !973}
!971 = !DILocalVariable(name: "data_end", arg: 2, scope: !967, file: !430, line: 225, type: !99)
!972 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !967, file: !430, line: 226, type: !957)
!973 = !DILocalVariable(name: "icmp6h", scope: !967, file: !430, line: 228, type: !577)
!974 = !DILocation(line: 0, scope: !967, inlinedAt: !975)
!975 = distinct !DILocation(line: 401, column: 6, scope: !976, inlinedAt: !965)
!976 = distinct !DILexicalBlock(scope: !954, file: !3, line: 401, column: 6)
!977 = !DILocation(line: 230, column: 13, scope: !978, inlinedAt: !975)
!978 = distinct !DILexicalBlock(scope: !967, file: !430, line: 230, column: 6)
!979 = !DILocation(line: 230, column: 17, scope: !978, inlinedAt: !975)
!980 = !DILocation(line: 230, column: 6, scope: !967, inlinedAt: !975)
!981 = !DILocation(line: 233, column: 14, scope: !967, inlinedAt: !975)
!982 = !DILocation(line: 233, column: 12, scope: !967, inlinedAt: !975)
!983 = !DILocation(line: 404, column: 11, scope: !984, inlinedAt: !965)
!984 = distinct !DILexicalBlock(scope: !954, file: !3, line: 404, column: 6)
!985 = !{!986, !445, i64 1}
!986 = !{!"icmp6hdr", !445, i64 0, !445, i64 1, !626, i64 2, !445, i64 4}
!987 = !DILocation(line: 404, column: 22, scope: !984, inlinedAt: !965)
!988 = !DILocation(line: 404, column: 6, scope: !954, inlinedAt: !965)
!989 = !DILocation(line: 407, column: 11, scope: !990, inlinedAt: !965)
!990 = distinct !DILexicalBlock(scope: !954, file: !3, line: 407, column: 6)
!991 = !{!986, !445, i64 0}
!992 = !DILocation(line: 407, column: 6, scope: !954, inlinedAt: !965)
!993 = !DILocation(line: 408, column: 26, scope: !994, inlinedAt: !965)
!994 = distinct !DILexicalBlock(scope: !990, file: !3, line: 407, column: 46)
!995 = !DILocation(line: 408, column: 21, scope: !994, inlinedAt: !965)
!996 = !DILocation(line: 412, column: 2, scope: !994, inlinedAt: !965)
!997 = !DILocation(line: 413, column: 32, scope: !998, inlinedAt: !965)
!998 = distinct !DILexicalBlock(scope: !999, file: !3, line: 412, column: 51)
!999 = distinct !DILexicalBlock(scope: !990, file: !3, line: 412, column: 13)
!1000 = !DILocation(line: 413, column: 27, scope: !998, inlinedAt: !965)
!1001 = !DILocation(line: 0, scope: !990, inlinedAt: !965)
!1002 = !DILocation(line: 424, column: 16, scope: !954, inlinedAt: !965)
!1003 = !DILocation(line: 424, column: 9, scope: !954, inlinedAt: !965)
!1004 = !DILocation(line: 425, column: 16, scope: !954, inlinedAt: !965)
!1005 = !DILocation(line: 425, column: 9, scope: !954, inlinedAt: !965)
!1006 = !DILocation(line: 428, column: 2, scope: !954, inlinedAt: !965)
!1007 = !DILocation(line: 522, column: 18, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !948, file: !3, line: 522, column: 11)
!1009 = !DILocation(line: 522, column: 29, scope: !1008)
!1010 = !DILocation(line: 525, column: 34, scope: !1008)
!1011 = !DILocation(line: 526, column: 34, scope: !1008)
!1012 = !DILocalVariable(name: "pctx", arg: 1, scope: !1013, file: !3, line: 434, type: !469)
!1013 = distinct !DISubprogram(name: "parse_icmp_identifier", scope: !3, file: !3, line: 434, type: !1014, scopeLine: 437, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1017)
!1014 = !DISubroutineType(types: !1015)
!1015 = !{!154, !469, !1016, !815, !815, !816}
!1016 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !553, size: 64)
!1017 = !{!1012, !1018, !1019, !1020, !1021, !1022}
!1018 = !DILocalVariable(name: "icmph", arg: 2, scope: !1013, file: !3, line: 435, type: !1016)
!1019 = !DILocalVariable(name: "sport", arg: 3, scope: !1013, file: !3, line: 435, type: !815)
!1020 = !DILocalVariable(name: "dport", arg: 4, scope: !1013, file: !3, line: 436, type: !815)
!1021 = !DILocalVariable(name: "proto_info", arg: 5, scope: !1013, file: !3, line: 436, type: !816)
!1022 = !DILocalVariable(name: "hdr", scope: !1013, file: !3, line: 438, type: !553)
!1023 = !DILocation(line: 0, scope: !1013, inlinedAt: !1024)
!1024 = distinct !DILocation(line: 524, column: 9, scope: !1008)
!1025 = !DILocalVariable(name: "nh", arg: 1, scope: !1026, file: !430, line: 239, type: !633)
!1026 = distinct !DISubprogram(name: "parse_icmphdr", scope: !430, file: !430, line: 239, type: !1027, scopeLine: 242, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1029)
!1027 = !DISubroutineType(types: !1028)
!1028 = !{!154, !633, !99, !1016}
!1029 = !{!1025, !1030, !1031, !1032}
!1030 = !DILocalVariable(name: "data_end", arg: 2, scope: !1026, file: !430, line: 240, type: !99)
!1031 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !1026, file: !430, line: 241, type: !1016)
!1032 = !DILocalVariable(name: "icmph", scope: !1026, file: !430, line: 243, type: !553)
!1033 = !DILocation(line: 0, scope: !1026, inlinedAt: !1034)
!1034 = distinct !DILocation(line: 439, column: 6, scope: !1035, inlinedAt: !1024)
!1035 = distinct !DILexicalBlock(scope: !1013, file: !3, line: 439, column: 6)
!1036 = !DILocation(line: 245, column: 12, scope: !1037, inlinedAt: !1034)
!1037 = distinct !DILexicalBlock(scope: !1026, file: !430, line: 245, column: 6)
!1038 = !DILocation(line: 245, column: 16, scope: !1037, inlinedAt: !1034)
!1039 = !DILocation(line: 245, column: 6, scope: !1026, inlinedAt: !1034)
!1040 = !DILocation(line: 248, column: 13, scope: !1026, inlinedAt: !1034)
!1041 = !DILocation(line: 248, column: 11, scope: !1026, inlinedAt: !1034)
!1042 = !DILocation(line: 442, column: 11, scope: !1043, inlinedAt: !1024)
!1043 = distinct !DILexicalBlock(scope: !1013, file: !3, line: 442, column: 6)
!1044 = !{!1045, !445, i64 1}
!1045 = !{!"icmphdr", !445, i64 0, !445, i64 1, !626, i64 2, !445, i64 4}
!1046 = !DILocation(line: 442, column: 16, scope: !1043, inlinedAt: !1024)
!1047 = !DILocation(line: 442, column: 6, scope: !1013, inlinedAt: !1024)
!1048 = !DILocation(line: 445, column: 11, scope: !1049, inlinedAt: !1024)
!1049 = distinct !DILexicalBlock(scope: !1013, file: !3, line: 445, column: 6)
!1050 = !{!1045, !445, i64 0}
!1051 = !DILocation(line: 445, column: 6, scope: !1013, inlinedAt: !1024)
!1052 = !DILocation(line: 446, column: 26, scope: !1053, inlinedAt: !1024)
!1053 = distinct !DILexicalBlock(scope: !1049, file: !3, line: 445, column: 30)
!1054 = !DILocation(line: 446, column: 29, scope: !1053, inlinedAt: !1024)
!1055 = !DILocation(line: 446, column: 34, scope: !1053, inlinedAt: !1024)
!1056 = !DILocation(line: 446, column: 21, scope: !1053, inlinedAt: !1024)
!1057 = !DILocation(line: 450, column: 2, scope: !1053, inlinedAt: !1024)
!1058 = !DILocation(line: 451, column: 32, scope: !1059, inlinedAt: !1024)
!1059 = distinct !DILexicalBlock(scope: !1060, file: !3, line: 450, column: 42)
!1060 = distinct !DILexicalBlock(scope: !1049, file: !3, line: 450, column: 13)
!1061 = !DILocation(line: 451, column: 35, scope: !1059, inlinedAt: !1024)
!1062 = !DILocation(line: 451, column: 40, scope: !1059, inlinedAt: !1024)
!1063 = !DILocation(line: 451, column: 27, scope: !1059, inlinedAt: !1024)
!1064 = !DILocation(line: 0, scope: !1049, inlinedAt: !1024)
!1065 = !DILocation(line: 462, column: 16, scope: !1013, inlinedAt: !1024)
!1066 = !DILocation(line: 462, column: 24, scope: !1013, inlinedAt: !1024)
!1067 = !DILocation(line: 462, column: 9, scope: !1013, inlinedAt: !1024)
!1068 = !DILocation(line: 463, column: 24, scope: !1013, inlinedAt: !1024)
!1069 = !DILocation(line: 463, column: 9, scope: !1013, inlinedAt: !1024)
!1070 = !DILocation(line: 466, column: 2, scope: !1013, inlinedAt: !1024)
!1071 = !DILocation(line: 534, column: 14, scope: !466)
!1072 = !DILocation(line: 534, column: 25, scope: !466)
!1073 = !{!621, !444, i64 56}
!1074 = !DILocation(line: 535, column: 10, scope: !466)
!1075 = !DILocation(line: 535, column: 20, scope: !466)
!1076 = !{!621, !627, i64 120}
!1077 = !DILocation(line: 536, column: 20, scope: !466)
!1078 = !DILocation(line: 536, column: 31, scope: !466)
!1079 = !{!621, !444, i64 104}
!1080 = !DILocation(line: 537, column: 10, scope: !466)
!1081 = !DILocation(line: 537, column: 26, scope: !466)
!1082 = !{!621, !627, i64 121}
!1083 = !DILocation(line: 538, column: 10, scope: !466)
!1084 = !DILocation(line: 538, column: 21, scope: !466)
!1085 = !{!621, !445, i64 122}
!1086 = !DILocation(line: 539, column: 10, scope: !466)
!1087 = !DILocation(line: 539, column: 23, scope: !466)
!1088 = !{!621, !445, i64 123}
!1089 = !DILocation(line: 540, column: 10, scope: !466)
!1090 = !DILocation(line: 540, column: 26, scope: !466)
!1091 = !{!621, !627, i64 124}
!1092 = !DILocation(line: 542, column: 18, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !466, file: !3, line: 542, column: 6)
!1094 = !DILocation(line: 542, column: 6, scope: !466)
!1095 = !DILocation(line: 544, column: 19, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1093, file: !3, line: 542, column: 39)
!1097 = !{!721, !444, i64 12}
!1098 = !DILocalVariable(name: "ipv6", arg: 1, scope: !1099, file: !3, line: 156, type: !145)
!1099 = distinct !DISubprogram(name: "map_ipv4_to_ipv6", scope: !3, file: !3, line: 156, type: !1100, scopeLine: 157, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1102)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{null, !145, !130}
!1102 = !{!1098, !1103}
!1103 = !DILocalVariable(name: "ipv4", arg: 2, scope: !1099, file: !3, line: 156, type: !130)
!1104 = !DILocation(line: 0, scope: !1099, inlinedAt: !1105)
!1105 = distinct !DILocation(line: 543, column: 3, scope: !1096)
!1106 = !DILocation(line: 158, column: 32, scope: !1099, inlinedAt: !1105)
!1107 = !DILocation(line: 158, column: 20, scope: !1099, inlinedAt: !1105)
!1108 = !DILocation(line: 158, column: 2, scope: !1099, inlinedAt: !1105)
!1109 = !DILocation(line: 159, column: 20, scope: !1099, inlinedAt: !1105)
!1110 = !DILocation(line: 159, column: 2, scope: !1099, inlinedAt: !1105)
!1111 = !DILocation(line: 160, column: 2, scope: !1099, inlinedAt: !1105)
!1112 = !DILocation(line: 160, column: 27, scope: !1099, inlinedAt: !1105)
!1113 = !DILocation(line: 545, column: 44, scope: !1096)
!1114 = !DILocation(line: 546, column: 19, scope: !1096)
!1115 = !{!721, !444, i64 16}
!1116 = !DILocation(line: 0, scope: !1099, inlinedAt: !1117)
!1117 = distinct !DILocation(line: 545, column: 3, scope: !1096)
!1118 = !DILocation(line: 158, column: 32, scope: !1099, inlinedAt: !1117)
!1119 = !DILocation(line: 158, column: 20, scope: !1099, inlinedAt: !1117)
!1120 = !DILocation(line: 158, column: 2, scope: !1099, inlinedAt: !1117)
!1121 = !DILocation(line: 159, column: 20, scope: !1099, inlinedAt: !1117)
!1122 = !DILocation(line: 159, column: 2, scope: !1099, inlinedAt: !1117)
!1123 = !DILocation(line: 160, column: 2, scope: !1099, inlinedAt: !1117)
!1124 = !DILocation(line: 160, column: 27, scope: !1099, inlinedAt: !1117)
!1125 = !DILocation(line: 547, column: 20, scope: !1096)
!1126 = !{!721, !626, i64 2}
!1127 = !DILocation(line: 548, column: 42, scope: !1096)
!1128 = !{!721, !445, i64 1}
!1129 = !DILocation(line: 548, column: 11, scope: !1096)
!1130 = !DILocation(line: 548, column: 18, scope: !1096)
!1131 = !DILocation(line: 548, column: 27, scope: !1096)
!1132 = !DILocation(line: 549, column: 2, scope: !1096)
!1133 = !DILocation(line: 550, column: 45, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1093, file: !3, line: 549, column: 9)
!1135 = !{i64 0, i64 16, !888, i64 0, i64 16, !888, i64 0, i64 16, !888}
!1136 = !DILocation(line: 551, column: 26, scope: !1134)
!1137 = !DILocation(line: 551, column: 45, scope: !1134)
!1138 = !DILocation(line: 552, column: 20, scope: !1134)
!1139 = !{!751, !626, i64 4}
!1140 = !DILocation(line: 554, column: 23, scope: !1134)
!1141 = !DILocation(line: 554, column: 4, scope: !1134)
!1142 = !DILocation(line: 554, column: 28, scope: !1134)
!1143 = !DILocation(line: 553, column: 18, scope: !1134)
!1144 = !DILocation(line: 553, column: 27, scope: !1134)
!1145 = !DILocation(line: 190, column: 21, scope: !1146, inlinedAt: !1152)
!1146 = distinct !DISubprogram(name: "reverse_flow", scope: !3, file: !3, line: 185, type: !1147, scopeLine: 186, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1149)
!1147 = !DISubroutineType(types: !1148)
!1148 = !{null, !101, !101}
!1149 = !{!1150, !1151}
!1150 = !DILocalVariable(name: "dest", arg: 1, scope: !1146, file: !3, line: 185, type: !101)
!1151 = !DILocalVariable(name: "src", arg: 2, scope: !1146, file: !3, line: 185, type: !101)
!1152 = distinct !DILocation(line: 559, column: 2, scope: !466)
!1153 = !DILocation(line: 0, scope: !1093)
!1154 = !DILocation(line: 547, column: 11, scope: !1096)
!1155 = !DILocation(line: 547, column: 18, scope: !1096)
!1156 = !DILocation(line: 557, column: 30, scope: !466)
!1157 = !DILocation(line: 557, column: 10, scope: !466)
!1158 = !DILocation(line: 557, column: 28, scope: !466)
!1159 = !{!621, !627, i64 119}
!1160 = !DILocation(line: 559, column: 34, scope: !466)
!1161 = !DILocation(line: 0, scope: !1146, inlinedAt: !1152)
!1162 = !DILocation(line: 187, column: 8, scope: !1146, inlinedAt: !1152)
!1163 = !DILocation(line: 187, column: 12, scope: !1146, inlinedAt: !1152)
!1164 = !{!623, !445, i64 42}
!1165 = !DILocation(line: 188, column: 8, scope: !1146, inlinedAt: !1152)
!1166 = !DILocation(line: 188, column: 14, scope: !1146, inlinedAt: !1152)
!1167 = !{!623, !626, i64 40}
!1168 = !DILocation(line: 189, column: 21, scope: !1146, inlinedAt: !1152)
!1169 = !{i64 0, i64 16, !888, i64 0, i64 16, !888, i64 0, i64 16, !888, i64 16, i64 2, !671, i64 18, i64 2, !671}
!1170 = !DILocation(line: 190, column: 8, scope: !1146, inlinedAt: !1152)
!1171 = !DILocation(line: 191, column: 8, scope: !1146, inlinedAt: !1152)
!1172 = !DILocation(line: 191, column: 17, scope: !1146, inlinedAt: !1152)
!1173 = !{!623, !445, i64 43}
!1174 = !DILocalVariable(name: "ctx", arg: 1, scope: !1175, file: !3, line: 171, type: !469)
!1175 = distinct !DISubprogram(name: "remaining_pkt_payload", scope: !3, file: !3, line: 171, type: !1176, scopeLine: 172, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1178)
!1176 = !DISubroutineType(types: !1177)
!1177 = !{!131, !469}
!1178 = !{!1174, !1179}
!1179 = !DILocalVariable(name: "parsed_bytes", scope: !1175, file: !3, line: 175, type: !131)
!1180 = !DILocation(line: 0, scope: !1175, inlinedAt: !1181)
!1181 = distinct !DILocation(line: 560, column: 20, scope: !466)
!1182 = !DILocation(line: 175, column: 31, scope: !1175, inlinedAt: !1181)
!1183 = !{!451, !452, i64 16}
!1184 = !DILocation(line: 175, column: 42, scope: !1175, inlinedAt: !1181)
!1185 = !DILocation(line: 175, column: 35, scope: !1175, inlinedAt: !1181)
!1186 = !DILocation(line: 175, column: 23, scope: !1175, inlinedAt: !1181)
!1187 = !DILocation(line: 176, column: 29, scope: !1175, inlinedAt: !1181)
!1188 = !DILocation(line: 176, column: 9, scope: !1175, inlinedAt: !1181)
!1189 = !DILocation(line: 560, column: 10, scope: !466)
!1190 = !DILocation(line: 560, column: 18, scope: !466)
!1191 = !{!621, !444, i64 8}
!1192 = !DILocation(line: 562, column: 2, scope: !466)
!1193 = !DILocation(line: 563, column: 1, scope: !466)
!1194 = distinct !DISubprogram(name: "parse_packet_identifer_xdp", scope: !3, file: !3, line: 588, type: !1195, scopeLine: 590, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1206)
!1195 = !DISubroutineType(types: !1196)
!1196 = !{!154, !1197, !399}
!1197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1198, size: 64)
!1198 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !23, line: 4374, size: 192, elements: !1199)
!1199 = !{!1200, !1201, !1202, !1203, !1204, !1205}
!1200 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !1198, file: !23, line: 4375, baseType: !131, size: 32)
!1201 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !1198, file: !23, line: 4376, baseType: !131, size: 32, offset: 32)
!1202 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !1198, file: !23, line: 4377, baseType: !131, size: 32, offset: 64)
!1203 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !1198, file: !23, line: 4379, baseType: !131, size: 32, offset: 96)
!1204 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !1198, file: !23, line: 4380, baseType: !131, size: 32, offset: 128)
!1205 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !1198, file: !23, line: 4382, baseType: !131, size: 32, offset: 160)
!1206 = !{!1207, !1208, !1209}
!1207 = !DILocalVariable(name: "ctx", arg: 1, scope: !1194, file: !3, line: 588, type: !1197)
!1208 = !DILocalVariable(name: "p_info", arg: 2, scope: !1194, file: !3, line: 589, type: !399)
!1209 = !DILocalVariable(name: "pctx", scope: !1194, file: !3, line: 594, type: !424)
!1210 = !DILocation(line: 0, scope: !1194)
!1211 = !DILocation(line: 591, column: 7, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1194, file: !3, line: 591, column: 6)
!1213 = !DILocation(line: 591, column: 6, scope: !1194)
!1214 = !DILocation(line: 594, column: 2, scope: !1194)
!1215 = !DILocation(line: 594, column: 25, scope: !1194)
!1216 = !DILocation(line: 594, column: 32, scope: !1194)
!1217 = !DILocation(line: 595, column: 30, scope: !1194)
!1218 = !{!1219, !444, i64 0}
!1219 = !{!"xdp_md", !444, i64 0, !444, i64 4, !444, i64 8, !444, i64 12, !444, i64 16, !444, i64 20}
!1220 = !DILocation(line: 595, column: 19, scope: !1194)
!1221 = !DILocation(line: 595, column: 11, scope: !1194)
!1222 = !DILocation(line: 596, column: 34, scope: !1194)
!1223 = !{!1219, !444, i64 4}
!1224 = !DILocation(line: 596, column: 23, scope: !1194)
!1225 = !DILocation(line: 596, column: 15, scope: !1194)
!1226 = !DILocation(line: 597, column: 9, scope: !1194)
!1227 = !DILocation(line: 598, column: 14, scope: !1194)
!1228 = !DILocation(line: 601, column: 9, scope: !1194)
!1229 = !DILocation(line: 602, column: 1, scope: !1194)
!1230 = distinct !DISubprogram(name: "pping_tc_egress", scope: !3, file: !3, line: 1098, type: !1231, scopeLine: 1099, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1233)
!1231 = !DISubroutineType(types: !1232)
!1232 = !{!154, !311}
!1233 = !{!1234}
!1234 = !DILocalVariable(name: "skb", arg: 1, scope: !1230, file: !3, line: 1098, type: !311)
!1235 = !DILocation(line: 0, scope: !1230)
!1236 = !DILocalVariable(name: "ctx", arg: 1, scope: !1237, file: !3, line: 1028, type: !311)
!1237 = distinct !DISubprogram(name: "pping_tc", scope: !3, file: !3, line: 1028, type: !1238, scopeLine: 1029, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1240)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{null, !311, !197}
!1240 = !{!1236, !1241, !1242}
!1241 = !DILocalVariable(name: "is_ingress", arg: 2, scope: !1237, file: !3, line: 1028, type: !197)
!1242 = !DILocalVariable(name: "p_info", scope: !1237, file: !3, line: 1030, type: !400)
!1243 = !DILocation(line: 0, scope: !1237, inlinedAt: !1244)
!1244 = distinct !DILocation(line: 1100, column: 2, scope: !1230)
!1245 = !DILocation(line: 1030, column: 2, scope: !1237, inlinedAt: !1244)
!1246 = !DILocation(line: 1030, column: 21, scope: !1237, inlinedAt: !1244)
!1247 = !DILocation(line: 1032, column: 6, scope: !1248, inlinedAt: !1244)
!1248 = distinct !DILexicalBlock(scope: !1237, file: !3, line: 1032, column: 6)
!1249 = !DILocation(line: 1032, column: 46, scope: !1248, inlinedAt: !1244)
!1250 = !DILocation(line: 1032, column: 6, scope: !1237, inlinedAt: !1244)
!1251 = !DILocation(line: 1035, column: 9, scope: !1237, inlinedAt: !1244)
!1252 = !DILocation(line: 1035, column: 20, scope: !1237, inlinedAt: !1244)
!1253 = !{!621, !627, i64 118}
!1254 = !DILocation(line: 1036, column: 9, scope: !1237, inlinedAt: !1244)
!1255 = !DILocation(line: 1036, column: 25, scope: !1237, inlinedAt: !1244)
!1256 = !{!621, !444, i64 108}
!1257 = !DILocation(line: 1038, column: 22, scope: !1237, inlinedAt: !1244)
!1258 = !DILocation(line: 1038, column: 2, scope: !1237, inlinedAt: !1244)
!1259 = !DILocation(line: 1039, column: 1, scope: !1237, inlinedAt: !1244)
!1260 = !DILocation(line: 1102, column: 2, scope: !1230)
!1261 = distinct !DISubprogram(name: "pping_tc_ingress", scope: !3, file: !3, line: 1107, type: !1231, scopeLine: 1108, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1262)
!1262 = !{!1263}
!1263 = !DILocalVariable(name: "skb", arg: 1, scope: !1261, file: !3, line: 1107, type: !311)
!1264 = !DILocation(line: 0, scope: !1261)
!1265 = !DILocation(line: 0, scope: !1237, inlinedAt: !1266)
!1266 = distinct !DILocation(line: 1109, column: 2, scope: !1261)
!1267 = !DILocation(line: 1030, column: 2, scope: !1237, inlinedAt: !1266)
!1268 = !DILocation(line: 1030, column: 21, scope: !1237, inlinedAt: !1266)
!1269 = !DILocation(line: 1032, column: 6, scope: !1248, inlinedAt: !1266)
!1270 = !DILocation(line: 1032, column: 46, scope: !1248, inlinedAt: !1266)
!1271 = !DILocation(line: 1032, column: 6, scope: !1237, inlinedAt: !1266)
!1272 = !DILocation(line: 1035, column: 9, scope: !1237, inlinedAt: !1266)
!1273 = !DILocation(line: 1035, column: 20, scope: !1237, inlinedAt: !1266)
!1274 = !DILocation(line: 1036, column: 45, scope: !1237, inlinedAt: !1266)
!1275 = !{!443, !444, i64 36}
!1276 = !DILocation(line: 1036, column: 9, scope: !1237, inlinedAt: !1266)
!1277 = !DILocation(line: 1036, column: 25, scope: !1237, inlinedAt: !1266)
!1278 = !DILocation(line: 1038, column: 22, scope: !1237, inlinedAt: !1266)
!1279 = !DILocation(line: 1038, column: 2, scope: !1237, inlinedAt: !1266)
!1280 = !DILocation(line: 1039, column: 1, scope: !1237, inlinedAt: !1266)
!1281 = !DILocation(line: 1111, column: 2, scope: !1261)
!1282 = distinct !DISubprogram(name: "pping_xdp_ingress", scope: !3, file: !3, line: 1116, type: !1283, scopeLine: 1117, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1285)
!1283 = !DISubroutineType(types: !1284)
!1284 = !{!154, !1197}
!1285 = !{!1286}
!1286 = !DILocalVariable(name: "ctx", arg: 1, scope: !1282, file: !3, line: 1116, type: !1197)
!1287 = !DILocation(line: 0, scope: !1282)
!1288 = !DILocalVariable(name: "ctx", arg: 1, scope: !1289, file: !3, line: 1041, type: !1197)
!1289 = distinct !DISubprogram(name: "pping_xdp", scope: !3, file: !3, line: 1041, type: !1290, scopeLine: 1042, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1292)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{null, !1197}
!1292 = !{!1288, !1293}
!1293 = !DILocalVariable(name: "p_info", scope: !1289, file: !3, line: 1043, type: !400)
!1294 = !DILocation(line: 0, scope: !1289, inlinedAt: !1295)
!1295 = distinct !DILocation(line: 1118, column: 2, scope: !1282)
!1296 = !DILocation(line: 1043, column: 2, scope: !1289, inlinedAt: !1295)
!1297 = !DILocation(line: 1043, column: 21, scope: !1289, inlinedAt: !1295)
!1298 = !DILocation(line: 1045, column: 6, scope: !1299, inlinedAt: !1295)
!1299 = distinct !DILexicalBlock(scope: !1289, file: !3, line: 1045, column: 6)
!1300 = !DILocation(line: 1045, column: 47, scope: !1299, inlinedAt: !1295)
!1301 = !DILocation(line: 1045, column: 6, scope: !1289, inlinedAt: !1295)
!1302 = !DILocation(line: 1048, column: 9, scope: !1289, inlinedAt: !1295)
!1303 = !DILocation(line: 1048, column: 20, scope: !1289, inlinedAt: !1295)
!1304 = !DILocation(line: 1049, column: 32, scope: !1289, inlinedAt: !1295)
!1305 = !{!1219, !444, i64 12}
!1306 = !DILocation(line: 1049, column: 9, scope: !1289, inlinedAt: !1295)
!1307 = !DILocation(line: 1049, column: 25, scope: !1289, inlinedAt: !1295)
!1308 = !DILocation(line: 1051, column: 22, scope: !1289, inlinedAt: !1295)
!1309 = !DILocation(line: 1051, column: 2, scope: !1289, inlinedAt: !1295)
!1310 = !DILocation(line: 1052, column: 1, scope: !1289, inlinedAt: !1295)
!1311 = !DILocation(line: 1120, column: 2, scope: !1282)
!1312 = distinct !DISubprogram(name: "tsmap_cleanup", scope: !3, file: !3, line: 1124, type: !1313, scopeLine: 1125, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1332)
!1313 = !DISubroutineType(types: !1314)
!1314 = !{!154, !1315}
!1315 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1316, size: 64)
!1316 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_iter__bpf_map_elem", file: !3, line: 58, size: 256, elements: !1317)
!1317 = !{!1318, !1327, !1330, !1331}
!1318 = !DIDerivedType(tag: DW_TAG_member, name: "meta", scope: !1316, file: !3, line: 59, baseType: !1319, size: 64)
!1319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1320, size: 64)
!1320 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_iter_meta", file: !3, line: 52, size: 192, elements: !1321)
!1321 = !{!1322, !1325, !1326}
!1322 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !1320, file: !3, line: 53, baseType: !1323, size: 64)
!1323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1324, size: 64)
!1324 = !DICompositeType(tag: DW_TAG_structure_type, name: "seq_file", file: !233, line: 24, flags: DIFlagFwdDecl)
!1325 = !DIDerivedType(tag: DW_TAG_member, name: "session_id", scope: !1320, file: !3, line: 54, baseType: !165, size: 64, offset: 64)
!1326 = !DIDerivedType(tag: DW_TAG_member, name: "seq_num", scope: !1320, file: !3, line: 55, baseType: !165, size: 64, offset: 128)
!1327 = !DIDerivedType(tag: DW_TAG_member, name: "map", scope: !1316, file: !3, line: 60, baseType: !1328, size: 64, offset: 64)
!1328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1329, size: 64)
!1329 = !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map", file: !3, line: 60, flags: DIFlagFwdDecl)
!1330 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !1316, file: !3, line: 61, baseType: !99, size: 64, offset: 128)
!1331 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !1316, file: !3, line: 62, baseType: !99, size: 64, offset: 192)
!1332 = !{!1333, !1334, !1335, !1337, !1338, !1339, !1340, !1341, !1342}
!1333 = !DILocalVariable(name: "ctx", arg: 1, scope: !1312, file: !3, line: 1124, type: !1315)
!1334 = !DILocalVariable(name: "local_pid", scope: !1312, file: !3, line: 1126, type: !159)
!1335 = !DILocalVariable(name: "f_state", scope: !1312, file: !3, line: 1127, type: !1336)
!1336 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64)
!1337 = !DILocalVariable(name: "df_state", scope: !1312, file: !3, line: 1128, type: !179)
!1338 = !DILocalVariable(name: "df_key", scope: !1312, file: !3, line: 1129, type: !102)
!1339 = !DILocalVariable(name: "pid", scope: !1312, file: !3, line: 1130, type: !158)
!1340 = !DILocalVariable(name: "timestamp", scope: !1312, file: !3, line: 1131, type: !164)
!1341 = !DILocalVariable(name: "now", scope: !1312, file: !3, line: 1132, type: !165)
!1342 = !DILocalVariable(name: "rtt", scope: !1312, file: !3, line: 1133, type: !165)
!1343 = !DILocation(line: 0, scope: !1312)
!1344 = !DILocation(line: 1126, column: 2, scope: !1312)
!1345 = !DILocation(line: 1126, column: 19, scope: !1312)
!1346 = !DILocation(line: 1129, column: 2, scope: !1312)
!1347 = !DILocation(line: 1129, column: 23, scope: !1312)
!1348 = !DILocation(line: 1130, column: 31, scope: !1312)
!1349 = !{!1350, !452, i64 16}
!1350 = !{!"bpf_iter__bpf_map_elem", !452, i64 0, !452, i64 8, !452, i64 16, !452, i64 24}
!1351 = !DILocation(line: 1131, column: 26, scope: !1312)
!1352 = !{!1350, !452, i64 24}
!1353 = !DILocation(line: 1132, column: 14, scope: !1312)
!1354 = !DILocation(line: 1139, column: 7, scope: !1355)
!1355 = distinct !DILexicalBlock(scope: !1312, file: !3, line: 1139, column: 6)
!1356 = !DILocation(line: 1139, column: 11, scope: !1355)
!1357 = !DILocation(line: 1141, column: 13, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1312, file: !3, line: 1141, column: 6)
!1359 = !{!447, !447, i64 0}
!1360 = !DILocation(line: 1141, column: 10, scope: !1358)
!1361 = !DILocation(line: 1141, column: 6, scope: !1312)
!1362 = !DILocation(line: 1144, column: 35, scope: !1312)
!1363 = !DILocalVariable(name: "key", arg: 1, scope: !1364, file: !3, line: 219, type: !101)
!1364 = distinct !DISubprogram(name: "make_dualflow_key", scope: !3, file: !3, line: 219, type: !1147, scopeLine: 221, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1365)
!1365 = !{!1363, !1366}
!1366 = !DILocalVariable(name: "flow", arg: 2, scope: !1364, file: !3, line: 220, type: !101)
!1367 = !DILocation(line: 0, scope: !1364, inlinedAt: !1368)
!1368 = distinct !DILocation(line: 1144, column: 2, scope: !1312)
!1369 = !DILocation(line: 222, column: 6, scope: !1370, inlinedAt: !1368)
!1370 = distinct !DILexicalBlock(scope: !1364, file: !3, line: 222, column: 6)
!1371 = !DILocation(line: 222, column: 6, scope: !1364, inlinedAt: !1368)
!1372 = !DILocation(line: 223, column: 10, scope: !1370, inlinedAt: !1368)
!1373 = !{i64 0, i64 16, !888, i64 0, i64 16, !888, i64 0, i64 16, !888, i64 16, i64 2, !671, i64 18, i64 2, !671, i64 20, i64 16, !888, i64 20, i64 16, !888, i64 20, i64 16, !888, i64 36, i64 2, !671, i64 38, i64 2, !671, i64 40, i64 2, !671, i64 42, i64 1, !888, i64 43, i64 1, !888}
!1374 = !DILocation(line: 223, column: 3, scope: !1370, inlinedAt: !1368)
!1375 = !DILocation(line: 0, scope: !1146, inlinedAt: !1376)
!1376 = distinct !DILocation(line: 225, column: 3, scope: !1370, inlinedAt: !1368)
!1377 = !DILocation(line: 187, column: 19, scope: !1146, inlinedAt: !1376)
!1378 = !DILocation(line: 187, column: 8, scope: !1146, inlinedAt: !1376)
!1379 = !DILocation(line: 187, column: 12, scope: !1146, inlinedAt: !1376)
!1380 = !DILocation(line: 188, column: 21, scope: !1146, inlinedAt: !1376)
!1381 = !DILocation(line: 188, column: 8, scope: !1146, inlinedAt: !1376)
!1382 = !DILocation(line: 188, column: 14, scope: !1146, inlinedAt: !1376)
!1383 = !DILocation(line: 189, column: 21, scope: !1146, inlinedAt: !1376)
!1384 = !DILocation(line: 190, column: 8, scope: !1146, inlinedAt: !1376)
!1385 = !DILocation(line: 190, column: 21, scope: !1146, inlinedAt: !1376)
!1386 = !DILocation(line: 191, column: 8, scope: !1146, inlinedAt: !1376)
!1387 = !DILocation(line: 191, column: 17, scope: !1146, inlinedAt: !1376)
!1388 = !DILocation(line: 1145, column: 13, scope: !1312)
!1389 = !DILocation(line: 1146, column: 6, scope: !1390)
!1390 = distinct !DILexicalBlock(scope: !1312, file: !3, line: 1146, column: 6)
!1391 = !DILocation(line: 1146, column: 6, scope: !1312)
!1392 = !DILocalVariable(name: "df_state", arg: 1, scope: !1393, file: !3, line: 241, type: !179)
!1393 = distinct !DISubprogram(name: "get_flowstate_from_dualflow", scope: !3, file: !3, line: 241, type: !1394, scopeLine: 243, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1396)
!1394 = !DISubroutineType(types: !1395)
!1395 = !{!1336, !179, !101}
!1396 = !{!1392, !1397}
!1397 = !DILocalVariable(name: "flow", arg: 2, scope: !1393, file: !3, line: 242, type: !101)
!1398 = !DILocation(line: 0, scope: !1393, inlinedAt: !1399)
!1399 = distinct !DILocation(line: 1147, column: 13, scope: !1390)
!1400 = !DILocation(line: 244, column: 37, scope: !1393, inlinedAt: !1399)
!1401 = !DILocalVariable(name: "df_state", arg: 1, scope: !1402, file: !3, line: 228, type: !179)
!1402 = distinct !DISubprogram(name: "fstate_from_dfkey", scope: !3, file: !3, line: 228, type: !1403, scopeLine: 230, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1405)
!1403 = !DISubroutineType(types: !1404)
!1404 = !{!1336, !179, !197}
!1405 = !{!1401, !1406}
!1406 = !DILocalVariable(name: "is_dfkey", arg: 2, scope: !1402, file: !3, line: 229, type: !197)
!1407 = !DILocation(line: 0, scope: !1402, inlinedAt: !1408)
!1408 = distinct !DILocation(line: 244, column: 9, scope: !1393, inlinedAt: !1399)
!1409 = !DILocation(line: 231, column: 9, scope: !1402, inlinedAt: !1408)
!1410 = !DILocation(line: 1148, column: 27, scope: !1312)
!1411 = !{!1412, !447, i64 8}
!1412 = !{!"flow_state", !447, i64 0, !447, i64 8, !447, i64 16, !447, i64 24, !447, i64 32, !447, i64 40, !447, i64 48, !444, i64 56, !444, i64 60, !445, i64 64, !445, i64 65, !627, i64 66, !445, i64 67}
!1413 = !DILocation(line: 1150, column: 7, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1312, file: !3, line: 1150, column: 6)
!1415 = !DILocation(line: 1150, column: 11, scope: !1414)
!1416 = !DILocation(line: 1150, column: 20, scope: !1414)
!1417 = !DILocation(line: 1150, column: 18, scope: !1414)
!1418 = !DILocation(line: 1150, column: 37, scope: !1414)
!1419 = !DILocation(line: 1150, column: 31, scope: !1414)
!1420 = !DILocation(line: 1150, column: 63, scope: !1414)
!1421 = !DILocation(line: 1151, column: 12, scope: !1414)
!1422 = !DILocation(line: 1151, column: 10, scope: !1414)
!1423 = !DILocation(line: 1151, column: 23, scope: !1414)
!1424 = !DILocation(line: 1150, column: 6, scope: !1312)
!1425 = !DILocation(line: 1154, column: 3, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1414, file: !3, line: 1151, column: 45)
!1427 = !DILocation(line: 1155, column: 7, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1426, file: !3, line: 1155, column: 7)
!1429 = !DILocation(line: 1155, column: 51, scope: !1428)
!1430 = !DILocation(line: 1155, column: 7, scope: !1426)
!1431 = !DILocation(line: 1160, column: 16, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1433, file: !3, line: 1158, column: 8)
!1433 = distinct !DILexicalBlock(scope: !1428, file: !3, line: 1155, column: 57)
!1434 = !DILocation(line: 1159, column: 5, scope: !1432)
!1435 = !DILocation(line: 1165, column: 1, scope: !1312)
!1436 = distinct !DISubprogram(name: "flowmap_cleanup", scope: !3, file: !3, line: 1168, type: !1313, scopeLine: 1169, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1437)
!1437 = !{!1438, !1439, !1440, !1441, !1442, !1443, !1444, !1445, !1446, !1447, !1448}
!1438 = !DILocalVariable(name: "ctx", arg: 1, scope: !1436, file: !3, line: 1168, type: !1315)
!1439 = !DILocalVariable(name: "flow1", scope: !1436, file: !3, line: 1170, type: !102)
!1440 = !DILocalVariable(name: "flow2", scope: !1436, file: !3, line: 1170, type: !102)
!1441 = !DILocalVariable(name: "f_state1", scope: !1436, file: !3, line: 1171, type: !1336)
!1442 = !DILocalVariable(name: "f_state2", scope: !1436, file: !3, line: 1171, type: !1336)
!1443 = !DILocalVariable(name: "df_state", scope: !1436, file: !3, line: 1172, type: !179)
!1444 = !DILocalVariable(name: "now", scope: !1436, file: !3, line: 1173, type: !165)
!1445 = !DILocalVariable(name: "notify1", scope: !1436, file: !3, line: 1174, type: !197)
!1446 = !DILocalVariable(name: "notify2", scope: !1436, file: !3, line: 1174, type: !197)
!1447 = !DILocalVariable(name: "timeout1", scope: !1436, file: !3, line: 1174, type: !197)
!1448 = !DILocalVariable(name: "timeout2", scope: !1436, file: !3, line: 1174, type: !197)
!1449 = !DILocation(line: 0, scope: !1436)
!1450 = !DILocation(line: 1170, column: 2, scope: !1436)
!1451 = !DILocation(line: 1170, column: 23, scope: !1436)
!1452 = !DILocation(line: 1173, column: 14, scope: !1436)
!1453 = !DILocation(line: 1176, column: 30, scope: !1436)
!1454 = !DILocation(line: 1176, column: 50, scope: !1436)
!1455 = !DILocation(line: 1180, column: 7, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1436, file: !3, line: 1180, column: 6)
!1457 = !DILocation(line: 1180, column: 16, scope: !1456)
!1458 = !DILocation(line: 1180, column: 25, scope: !1456)
!1459 = !DILocation(line: 1180, column: 20, scope: !1456)
!1460 = !DILocation(line: 1180, column: 6, scope: !1436)
!1461 = !DILocation(line: 1183, column: 10, scope: !1436)
!1462 = !DILocation(line: 0, scope: !1146, inlinedAt: !1463)
!1463 = distinct !DILocation(line: 1184, column: 2, scope: !1436)
!1464 = !DILocation(line: 187, column: 19, scope: !1146, inlinedAt: !1463)
!1465 = !DILocation(line: 188, column: 21, scope: !1146, inlinedAt: !1463)
!1466 = !DILocation(line: 189, column: 21, scope: !1146, inlinedAt: !1463)
!1467 = !{i64 0, i64 15, !888, i64 0, i64 15, !888, i64 0, i64 15, !888, i64 15, i64 2, !671, i64 17, i64 2, !671}
!1468 = !{i64 0, i64 14, !888, i64 0, i64 14, !888, i64 0, i64 14, !888, i64 14, i64 2, !671, i64 16, i64 2, !671}
!1469 = !{i64 0, i64 13, !888, i64 0, i64 13, !888, i64 0, i64 13, !888, i64 13, i64 2, !671, i64 15, i64 2, !671}
!1470 = !{i64 0, i64 12, !888, i64 0, i64 12, !888, i64 0, i64 12, !888, i64 12, i64 2, !671, i64 14, i64 2, !671}
!1471 = !{i64 0, i64 11, !888, i64 0, i64 11, !888, i64 0, i64 11, !888, i64 11, i64 2, !671, i64 13, i64 2, !671}
!1472 = !{i64 0, i64 10, !888, i64 0, i64 10, !888, i64 0, i64 10, !888, i64 10, i64 2, !671, i64 12, i64 2, !671}
!1473 = !{i64 0, i64 9, !888, i64 0, i64 9, !888, i64 0, i64 9, !888, i64 9, i64 2, !671, i64 11, i64 2, !671}
!1474 = !{i64 0, i64 8, !888, i64 0, i64 8, !888, i64 0, i64 8, !888, i64 8, i64 2, !671, i64 10, i64 2, !671}
!1475 = !{i64 0, i64 7, !888, i64 0, i64 7, !888, i64 0, i64 7, !888, i64 7, i64 2, !671, i64 9, i64 2, !671}
!1476 = !{i64 0, i64 6, !888, i64 0, i64 6, !888, i64 0, i64 6, !888, i64 6, i64 2, !671, i64 8, i64 2, !671}
!1477 = !{i64 0, i64 5, !888, i64 0, i64 5, !888, i64 0, i64 5, !888, i64 5, i64 2, !671, i64 7, i64 2, !671}
!1478 = !{i64 0, i64 4, !888, i64 0, i64 4, !888, i64 0, i64 4, !888, i64 4, i64 2, !671, i64 6, i64 2, !671}
!1479 = !{i64 0, i64 3, !888, i64 0, i64 3, !888, i64 0, i64 3, !888, i64 3, i64 2, !671, i64 5, i64 2, !671}
!1480 = !{i64 0, i64 2, !888, i64 0, i64 2, !888, i64 0, i64 2, !888, i64 2, i64 2, !671, i64 4, i64 2, !671}
!1481 = !{i64 0, i64 1, !888, i64 0, i64 1, !888, i64 0, i64 1, !888, i64 1, i64 2, !671, i64 3, i64 2, !671}
!1482 = !{i64 0, i64 2, !671, i64 2, i64 2, !671}
!1483 = !{i64 0, i64 1, !671, i64 1, i64 2, !671}
!1484 = !{i64 0, i64 2, !671}
!1485 = !{i64 0, i64 1, !671}
!1486 = !DILocation(line: 190, column: 21, scope: !1146, inlinedAt: !1463)
!1487 = !DILocation(line: 0, scope: !1393, inlinedAt: !1488)
!1488 = distinct !DILocation(line: 1187, column: 13, scope: !1436)
!1489 = !DILocalVariable(name: "flow", arg: 1, scope: !1490, file: !3, line: 214, type: !101)
!1490 = distinct !DISubprogram(name: "is_dualflow_key", scope: !3, file: !3, line: 214, type: !1491, scopeLine: 215, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1493)
!1491 = !DISubroutineType(types: !1492)
!1492 = !{!197, !101}
!1493 = !{!1489}
!1494 = !DILocation(line: 0, scope: !1490, inlinedAt: !1495)
!1495 = distinct !DILocation(line: 244, column: 37, scope: !1393, inlinedAt: !1488)
!1496 = !DILocalVariable(name: "s1_", arg: 1, scope: !1497, file: !3, line: 201, type: !237)
!1497 = distinct !DISubprogram(name: "my_memcmp", scope: !3, file: !3, line: 201, type: !1498, scopeLine: 202, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1500)
!1498 = !DISubroutineType(types: !1499)
!1499 = !{!154, !237, !237, !131}
!1500 = !{!1496, !1501, !1502, !1503, !1506, !1507}
!1501 = !DILocalVariable(name: "s2_", arg: 2, scope: !1497, file: !3, line: 201, type: !237)
!1502 = !DILocalVariable(name: "size", arg: 3, scope: !1497, file: !3, line: 201, type: !131)
!1503 = !DILocalVariable(name: "s1", scope: !1497, file: !3, line: 203, type: !1504)
!1504 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1505, size: 64)
!1505 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !116)
!1506 = !DILocalVariable(name: "s2", scope: !1497, file: !3, line: 203, type: !1504)
!1507 = !DILocalVariable(name: "i", scope: !1497, file: !3, line: 204, type: !154)
!1508 = !DILocation(line: 0, scope: !1497, inlinedAt: !1509)
!1509 = distinct !DILocation(line: 216, column: 9, scope: !1490, inlinedAt: !1495)
!1510 = !DILocation(line: 207, column: 13, scope: !1511, inlinedAt: !1509)
!1511 = distinct !DILexicalBlock(scope: !1512, file: !3, line: 207, column: 7)
!1512 = distinct !DILexicalBlock(scope: !1513, file: !3, line: 206, column: 52)
!1513 = distinct !DILexicalBlock(scope: !1514, file: !3, line: 206, column: 2)
!1514 = distinct !DILexicalBlock(scope: !1497, file: !3, line: 206, column: 2)
!1515 = !DILocation(line: 207, column: 7, scope: !1512, inlinedAt: !1509)
!1516 = !DILocation(line: 0, scope: !1402, inlinedAt: !1517)
!1517 = distinct !DILocation(line: 244, column: 9, scope: !1393, inlinedAt: !1488)
!1518 = !DILocation(line: 231, column: 9, scope: !1402, inlinedAt: !1517)
!1519 = !DILocation(line: 207, column: 7, scope: !1511, inlinedAt: !1509)
!1520 = !DILocation(line: 207, column: 16, scope: !1511, inlinedAt: !1509)
!1521 = !DILocation(line: 208, column: 17, scope: !1511, inlinedAt: !1509)
!1522 = !DILocation(line: 0, scope: !1393, inlinedAt: !1523)
!1523 = distinct !DILocation(line: 1188, column: 13, scope: !1436)
!1524 = !DILocation(line: 0, scope: !1490, inlinedAt: !1525)
!1525 = distinct !DILocation(line: 244, column: 37, scope: !1393, inlinedAt: !1523)
!1526 = !DILocation(line: 0, scope: !1497, inlinedAt: !1527)
!1527 = distinct !DILocation(line: 216, column: 9, scope: !1490, inlinedAt: !1525)
!1528 = !DILocation(line: 207, column: 7, scope: !1512, inlinedAt: !1527)
!1529 = !DILocation(line: 207, column: 13, scope: !1511, inlinedAt: !1527)
!1530 = !DILocation(line: 207, column: 7, scope: !1511, inlinedAt: !1527)
!1531 = !DILocation(line: 207, column: 16, scope: !1511, inlinedAt: !1527)
!1532 = !DILocation(line: 208, column: 17, scope: !1511, inlinedAt: !1527)
!1533 = !DILocation(line: 0, scope: !1402, inlinedAt: !1534)
!1534 = distinct !DILocation(line: 244, column: 9, scope: !1393, inlinedAt: !1523)
!1535 = !DILocation(line: 231, column: 9, scope: !1402, inlinedAt: !1534)
!1536 = !DILocalVariable(name: "flow", arg: 1, scope: !1537, file: !3, line: 1054, type: !101)
!1537 = distinct !DISubprogram(name: "is_flow_old", scope: !3, file: !3, line: 1054, type: !1538, scopeLine: 1056, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1540)
!1538 = !DISubroutineType(types: !1539)
!1539 = !{!197, !101, !1336, !165}
!1540 = !{!1536, !1541, !1542, !1543, !1544}
!1541 = !DILocalVariable(name: "f_state", arg: 2, scope: !1537, file: !3, line: 1054, type: !1336)
!1542 = !DILocalVariable(name: "time", arg: 3, scope: !1537, file: !3, line: 1055, type: !165)
!1543 = !DILocalVariable(name: "age", scope: !1537, file: !3, line: 1057, type: !165)
!1544 = !DILocalVariable(name: "ts", scope: !1537, file: !3, line: 1058, type: !165)
!1545 = !DILocation(line: 0, scope: !1537, inlinedAt: !1546)
!1546 = distinct !DILocation(line: 1190, column: 13, scope: !1436)
!1547 = !DILocalVariable(name: "f_state", arg: 1, scope: !1548, file: !3, line: 782, type: !1336)
!1548 = distinct !DISubprogram(name: "is_flowstate_active", scope: !3, file: !3, line: 782, type: !1549, scopeLine: 783, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1551)
!1549 = !DISubroutineType(types: !1550)
!1550 = !{!197, !1336}
!1551 = !{!1547}
!1552 = !DILocation(line: 0, scope: !1548, inlinedAt: !1553)
!1553 = distinct !DILocation(line: 1060, column: 19, scope: !1554, inlinedAt: !1546)
!1554 = distinct !DILexicalBlock(scope: !1537, file: !3, line: 1060, column: 6)
!1555 = !DILocation(line: 784, column: 18, scope: !1548, inlinedAt: !1553)
!1556 = !{!1412, !445, i64 64}
!1557 = !DILocation(line: 1060, column: 6, scope: !1537, inlinedAt: !1546)
!1558 = !DILocation(line: 1063, column: 16, scope: !1537, inlinedAt: !1546)
!1559 = !{!1412, !447, i64 16}
!1560 = !DILocation(line: 1064, column: 9, scope: !1561, inlinedAt: !1546)
!1561 = distinct !DILexicalBlock(scope: !1537, file: !3, line: 1064, column: 6)
!1562 = !DILocation(line: 1064, column: 6, scope: !1537, inlinedAt: !1546)
!1563 = !DILocation(line: 1066, column: 13, scope: !1537, inlinedAt: !1546)
!1564 = !DILocation(line: 1068, column: 30, scope: !1537, inlinedAt: !1546)
!1565 = !DILocation(line: 1068, column: 59, scope: !1537, inlinedAt: !1546)
!1566 = !DILocation(line: 1070, column: 39, scope: !1537, inlinedAt: !1546)
!1567 = !DILocation(line: 1072, column: 29, scope: !1537, inlinedAt: !1546)
!1568 = !DILocation(line: 1073, column: 13, scope: !1537, inlinedAt: !1546)
!1569 = !DILocation(line: 0, scope: !1537, inlinedAt: !1570)
!1570 = distinct !DILocation(line: 1191, column: 13, scope: !1436)
!1571 = !DILocation(line: 0, scope: !1548, inlinedAt: !1572)
!1572 = distinct !DILocation(line: 1060, column: 19, scope: !1554, inlinedAt: !1570)
!1573 = !DILocation(line: 784, column: 18, scope: !1548, inlinedAt: !1572)
!1574 = !DILocation(line: 1060, column: 6, scope: !1537, inlinedAt: !1570)
!1575 = !DILocation(line: 1063, column: 16, scope: !1537, inlinedAt: !1570)
!1576 = !DILocation(line: 1064, column: 9, scope: !1561, inlinedAt: !1570)
!1577 = !DILocation(line: 1064, column: 6, scope: !1537, inlinedAt: !1570)
!1578 = !DILocation(line: 1066, column: 13, scope: !1537, inlinedAt: !1570)
!1579 = !DILocation(line: 1068, column: 30, scope: !1537, inlinedAt: !1570)
!1580 = !DILocation(line: 1068, column: 59, scope: !1537, inlinedAt: !1570)
!1581 = !DILocation(line: 1070, column: 39, scope: !1537, inlinedAt: !1570)
!1582 = !DILocation(line: 1072, column: 29, scope: !1537, inlinedAt: !1570)
!1583 = !DILocation(line: 1073, column: 13, scope: !1537, inlinedAt: !1570)
!1584 = !DILocation(line: 0, scope: !1548, inlinedAt: !1585)
!1585 = distinct !DILocation(line: 1193, column: 8, scope: !1586)
!1586 = distinct !DILexicalBlock(scope: !1436, file: !3, line: 1193, column: 6)
!1587 = !DILocation(line: 784, column: 18, scope: !1548, inlinedAt: !1585)
!1588 = !DILocation(line: 1193, column: 38, scope: !1586)
!1589 = !DILocation(line: 0, scope: !1548, inlinedAt: !1590)
!1590 = distinct !DILocation(line: 1194, column: 8, scope: !1586)
!1591 = !DILocation(line: 784, column: 18, scope: !1548, inlinedAt: !1590)
!1592 = !DILocation(line: 1194, column: 38, scope: !1586)
!1593 = !DILocalVariable(name: "f_state", arg: 1, scope: !1594, file: !3, line: 818, type: !1336)
!1594 = distinct !DISubprogram(name: "should_notify_closing", scope: !3, file: !3, line: 818, type: !1549, scopeLine: 819, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1595)
!1595 = !{!1593}
!1596 = !DILocation(line: 0, scope: !1594, inlinedAt: !1597)
!1597 = distinct !DILocation(line: 1196, column: 13, scope: !1598)
!1598 = distinct !DILexicalBlock(scope: !1586, file: !3, line: 1194, column: 52)
!1599 = !DILocation(line: 0, scope: !1594, inlinedAt: !1600)
!1600 = distinct !DILocation(line: 1197, column: 13, scope: !1598)
!1601 = !DILocation(line: 820, column: 29, scope: !1594, inlinedAt: !1600)
!1602 = !DILocation(line: 1197, column: 45, scope: !1598)
!1603 = !DILocation(line: 1198, column: 7, scope: !1604)
!1604 = distinct !DILexicalBlock(scope: !1598, file: !3, line: 1198, column: 7)
!1605 = !DILocation(line: 1198, column: 48, scope: !1604)
!1606 = !DILocation(line: 1198, column: 7, scope: !1598)
!1607 = !DILocation(line: 820, column: 29, scope: !1594, inlinedAt: !1597)
!1608 = !DILocation(line: 1196, column: 45, scope: !1598)
!1609 = !DILocation(line: 1200, column: 8, scope: !1610)
!1610 = distinct !DILexicalBlock(scope: !1604, file: !3, line: 1198, column: 54)
!1611 = !DILocalVariable(name: "ctx", arg: 1, scope: !1612, file: !3, line: 1076, type: !99)
!1612 = distinct !DISubprogram(name: "send_flow_timeout_message", scope: !3, file: !3, line: 1076, type: !1613, scopeLine: 1078, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1615)
!1613 = !DISubroutineType(types: !1614)
!1614 = !{null, !99, !101, !165}
!1615 = !{!1611, !1616, !1617, !1618}
!1616 = !DILocalVariable(name: "flow", arg: 2, scope: !1612, file: !3, line: 1076, type: !101)
!1617 = !DILocalVariable(name: "time", arg: 3, scope: !1612, file: !3, line: 1077, type: !165)
!1618 = !DILocalVariable(name: "fe", scope: !1612, file: !3, line: 1079, type: !1619)
!1619 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_event", file: !6, line: 162, size: 512, elements: !1620)
!1620 = !{!1621, !1622, !1623, !1624, !1625, !1626, !1627}
!1621 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !1619, file: !6, line: 163, baseType: !165, size: 64)
!1622 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !1619, file: !6, line: 164, baseType: !165, size: 64, offset: 64)
!1623 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !1619, file: !6, line: 165, baseType: !102, size: 352, offset: 128)
!1624 = !DIDerivedType(tag: DW_TAG_member, name: "flow_event_type", scope: !1619, file: !6, line: 166, baseType: !5, size: 8, offset: 480)
!1625 = !DIDerivedType(tag: DW_TAG_member, name: "reason", scope: !1619, file: !6, line: 167, baseType: !13, size: 8, offset: 488)
!1626 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !1619, file: !6, line: 168, baseType: !93, size: 8, offset: 496)
!1627 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !1619, file: !6, line: 169, baseType: !116, size: 8, offset: 504)
!1628 = !DILocation(line: 0, scope: !1612, inlinedAt: !1629)
!1629 = distinct !DILocation(line: 1201, column: 5, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1610, file: !3, line: 1200, column: 8)
!1631 = !DILocation(line: 1079, column: 2, scope: !1612, inlinedAt: !1629)
!1632 = !DILocation(line: 1079, column: 20, scope: !1612, inlinedAt: !1629)
!1633 = !DILocation(line: 1079, column: 25, scope: !1612, inlinedAt: !1629)
!1634 = !{!1635, !447, i64 0}
!1635 = !{!"flow_event", !447, i64 0, !447, i64 8, !623, i64 16, !445, i64 60, !445, i64 61, !445, i64 62, !445, i64 63}
!1636 = !{!1635, !447, i64 8}
!1637 = !{!1635, !445, i64 60}
!1638 = !{!1635, !445, i64 61}
!1639 = !{!1635, !445, i64 62}
!1640 = !{!1635, !445, i64 63}
!1641 = !DILocation(line: 0, scope: !1146, inlinedAt: !1642)
!1642 = distinct !DILocation(line: 1089, column: 2, scope: !1612, inlinedAt: !1629)
!1643 = !DILocation(line: 187, column: 19, scope: !1146, inlinedAt: !1642)
!1644 = !DILocation(line: 187, column: 8, scope: !1146, inlinedAt: !1642)
!1645 = !DILocation(line: 187, column: 12, scope: !1146, inlinedAt: !1642)
!1646 = !DILocation(line: 188, column: 21, scope: !1146, inlinedAt: !1642)
!1647 = !DILocation(line: 188, column: 8, scope: !1146, inlinedAt: !1642)
!1648 = !DILocation(line: 188, column: 14, scope: !1146, inlinedAt: !1642)
!1649 = !DILocation(line: 189, column: 21, scope: !1146, inlinedAt: !1642)
!1650 = !DILocation(line: 190, column: 8, scope: !1146, inlinedAt: !1642)
!1651 = !DILocation(line: 190, column: 21, scope: !1146, inlinedAt: !1642)
!1652 = !DILocation(line: 191, column: 8, scope: !1146, inlinedAt: !1642)
!1653 = !DILocation(line: 191, column: 17, scope: !1146, inlinedAt: !1642)
!1654 = !DILocation(line: 1091, column: 2, scope: !1612, inlinedAt: !1629)
!1655 = !DILocation(line: 1092, column: 1, scope: !1612, inlinedAt: !1629)
!1656 = !DILocation(line: 1201, column: 5, scope: !1630)
!1657 = !DILocation(line: 1202, column: 8, scope: !1610)
!1658 = !DILocation(line: 0, scope: !1612, inlinedAt: !1659)
!1659 = distinct !DILocation(line: 1203, column: 5, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1610, file: !3, line: 1202, column: 8)
!1661 = !DILocation(line: 1079, column: 2, scope: !1612, inlinedAt: !1659)
!1662 = !DILocation(line: 1079, column: 20, scope: !1612, inlinedAt: !1659)
!1663 = !DILocation(line: 1079, column: 25, scope: !1612, inlinedAt: !1659)
!1664 = !DILocation(line: 0, scope: !1146, inlinedAt: !1665)
!1665 = distinct !DILocation(line: 1089, column: 2, scope: !1612, inlinedAt: !1659)
!1666 = !DILocation(line: 187, column: 8, scope: !1146, inlinedAt: !1665)
!1667 = !DILocation(line: 187, column: 12, scope: !1146, inlinedAt: !1665)
!1668 = !DILocation(line: 188, column: 8, scope: !1146, inlinedAt: !1665)
!1669 = !DILocation(line: 188, column: 14, scope: !1146, inlinedAt: !1665)
!1670 = !DILocation(line: 189, column: 21, scope: !1146, inlinedAt: !1665)
!1671 = !DILocation(line: 190, column: 21, scope: !1146, inlinedAt: !1665)
!1672 = !DILocation(line: 191, column: 8, scope: !1146, inlinedAt: !1665)
!1673 = !DILocation(line: 191, column: 17, scope: !1146, inlinedAt: !1665)
!1674 = !DILocation(line: 1091, column: 2, scope: !1612, inlinedAt: !1659)
!1675 = !DILocation(line: 1092, column: 1, scope: !1612, inlinedAt: !1659)
!1676 = !DILocation(line: 1203, column: 5, scope: !1660)
!1677 = !DILocation(line: 1208, column: 1, scope: !1436)
!1678 = !DILocation(line: 0, scope: !1490)
!1679 = !DILocation(line: 216, column: 19, scope: !1490)
!1680 = !DILocation(line: 216, column: 40, scope: !1490)
!1681 = !DILocation(line: 216, column: 33, scope: !1490)
!1682 = !DILocation(line: 0, scope: !1497, inlinedAt: !1683)
!1683 = distinct !DILocation(line: 216, column: 9, scope: !1490)
!1684 = !DILocation(line: 207, column: 7, scope: !1511, inlinedAt: !1683)
!1685 = !DILocation(line: 207, column: 16, scope: !1511, inlinedAt: !1683)
!1686 = !DILocation(line: 207, column: 13, scope: !1511, inlinedAt: !1683)
!1687 = !DILocation(line: 207, column: 7, scope: !1512, inlinedAt: !1683)
!1688 = !DILocation(line: 208, column: 17, scope: !1511, inlinedAt: !1683)
!1689 = !DILocation(line: 208, column: 4, scope: !1511, inlinedAt: !1683)
!1690 = !DILocation(line: 216, column: 2, scope: !1490)
!1691 = distinct !DISubprogram(name: "pping_parsed_packet", scope: !3, file: !3, line: 998, type: !1692, scopeLine: 999, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1694)
!1692 = !DISubroutineType(types: !1693)
!1693 = !{null, !99, !399}
!1694 = !{!1695, !1696, !1697, !1698, !1699}
!1695 = !DILocalVariable(name: "ctx", arg: 1, scope: !1691, file: !3, line: 998, type: !99)
!1696 = !DILocalVariable(name: "p_info", arg: 2, scope: !1691, file: !3, line: 998, type: !399)
!1697 = !DILocalVariable(name: "df_state", scope: !1691, file: !3, line: 1000, type: !179)
!1698 = !DILocalVariable(name: "fw_flow", scope: !1691, file: !3, line: 1001, type: !1336)
!1699 = !DILocalVariable(name: "rev_flow", scope: !1691, file: !3, line: 1001, type: !1336)
!1700 = !DILocation(line: 0, scope: !1691)
!1701 = !DILocalVariable(name: "ctx", arg: 1, scope: !1702, file: !3, line: 764, type: !99)
!1702 = distinct !DISubprogram(name: "lookup_or_create_dualflow_state", scope: !3, file: !3, line: 764, type: !1703, scopeLine: 765, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1705)
!1703 = !DISubroutineType(types: !1704)
!1704 = !{!179, !99, !399}
!1705 = !{!1701, !1706, !1707}
!1706 = !DILocalVariable(name: "p_info", arg: 2, scope: !1702, file: !3, line: 764, type: !399)
!1707 = !DILocalVariable(name: "df_state", scope: !1702, file: !3, line: 766, type: !179)
!1708 = !DILocation(line: 0, scope: !1702, inlinedAt: !1709)
!1709 = distinct !DILocation(line: 1003, column: 13, scope: !1691)
!1710 = !DILocalVariable(name: "p_info", arg: 1, scope: !1711, file: !3, line: 262, type: !399)
!1711 = distinct !DISubprogram(name: "get_dualflow_key_from_packet", scope: !3, file: !3, line: 262, type: !1712, scopeLine: 263, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1714)
!1712 = !DISubroutineType(types: !1713)
!1713 = !{!101, !399}
!1714 = !{!1710}
!1715 = !DILocation(line: 0, scope: !1711, inlinedAt: !1716)
!1716 = distinct !DILocation(line: 769, column: 12, scope: !1702, inlinedAt: !1709)
!1717 = !DILocation(line: 264, column: 17, scope: !1711, inlinedAt: !1716)
!1718 = !DILocation(line: 264, column: 9, scope: !1711, inlinedAt: !1716)
!1719 = !DILocation(line: 769, column: 12, scope: !1702, inlinedAt: !1709)
!1720 = !DILocation(line: 768, column: 13, scope: !1702, inlinedAt: !1709)
!1721 = !DILocation(line: 771, column: 6, scope: !1722, inlinedAt: !1709)
!1722 = distinct !DILexicalBlock(scope: !1702, file: !3, line: 771, column: 6)
!1723 = !DILocation(line: 771, column: 6, scope: !1702, inlinedAt: !1709)
!1724 = !DILocation(line: 772, column: 3, scope: !1722, inlinedAt: !1709)
!1725 = !DILocation(line: 775, column: 15, scope: !1726, inlinedAt: !1709)
!1726 = distinct !DILexicalBlock(scope: !1702, file: !3, line: 775, column: 6)
!1727 = !DILocation(line: 775, column: 25, scope: !1726, inlinedAt: !1709)
!1728 = !DILocation(line: 775, column: 36, scope: !1726, inlinedAt: !1709)
!1729 = !DILocation(line: 775, column: 69, scope: !1726, inlinedAt: !1709)
!1730 = !DILocalVariable(name: "ctx", arg: 1, scope: !1731, file: !3, line: 747, type: !99)
!1731 = distinct !DISubprogram(name: "create_dualflow_state", scope: !3, file: !3, line: 747, type: !1703, scopeLine: 748, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1732)
!1732 = !{!1730, !1733, !1734, !1735}
!1733 = !DILocalVariable(name: "p_info", arg: 2, scope: !1731, file: !3, line: 747, type: !399)
!1734 = !DILocalVariable(name: "key", scope: !1731, file: !3, line: 749, type: !101)
!1735 = !DILocalVariable(name: "new_state", scope: !1731, file: !3, line: 750, type: !180)
!1736 = !DILocation(line: 0, scope: !1731, inlinedAt: !1737)
!1737 = distinct !DILocation(line: 779, column: 9, scope: !1702, inlinedAt: !1709)
!1738 = !DILocation(line: 0, scope: !1711, inlinedAt: !1739)
!1739 = distinct !DILocation(line: 749, column: 30, scope: !1731, inlinedAt: !1737)
!1740 = !DILocation(line: 264, column: 17, scope: !1711, inlinedAt: !1739)
!1741 = !DILocation(line: 264, column: 9, scope: !1711, inlinedAt: !1739)
!1742 = !DILocation(line: 750, column: 2, scope: !1731, inlinedAt: !1737)
!1743 = !DILocation(line: 750, column: 25, scope: !1731, inlinedAt: !1737)
!1744 = !DILocalVariable(name: "df_state", arg: 1, scope: !1745, file: !3, line: 734, type: !179)
!1745 = distinct !DISubprogram(name: "init_dualflow_state", scope: !3, file: !3, line: 734, type: !1746, scopeLine: 736, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1748)
!1746 = !DISubroutineType(types: !1747)
!1747 = !{null, !179, !399}
!1748 = !{!1744, !1749, !1750, !1751}
!1749 = !DILocalVariable(name: "p_info", arg: 2, scope: !1745, file: !3, line: 735, type: !399)
!1750 = !DILocalVariable(name: "fw_state", scope: !1745, file: !3, line: 737, type: !1336)
!1751 = !DILocalVariable(name: "rev_state", scope: !1745, file: !3, line: 739, type: !1336)
!1752 = !DILocation(line: 0, scope: !1745, inlinedAt: !1753)
!1753 = distinct !DILocation(line: 752, column: 2, scope: !1731, inlinedAt: !1737)
!1754 = !DILocalVariable(name: "f_state", arg: 1, scope: !1755, file: !3, line: 710, type: !1336)
!1755 = distinct !DISubprogram(name: "init_flowstate", scope: !3, file: !3, line: 710, type: !1756, scopeLine: 712, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1758)
!1756 = !DISubroutineType(types: !1757)
!1757 = !{null, !1336, !399}
!1758 = !{!1754, !1759}
!1759 = !DILocalVariable(name: "p_info", arg: 2, scope: !1755, file: !3, line: 711, type: !399)
!1760 = !DILocation(line: 0, scope: !1755, inlinedAt: !1761)
!1761 = distinct !DILocation(line: 742, column: 2, scope: !1745, inlinedAt: !1753)
!1762 = !DILocation(line: 713, column: 11, scope: !1755, inlinedAt: !1761)
!1763 = !DILocation(line: 713, column: 22, scope: !1755, inlinedAt: !1761)
!1764 = !DILocation(line: 714, column: 36, scope: !1755, inlinedAt: !1761)
!1765 = !DILocation(line: 714, column: 11, scope: !1755, inlinedAt: !1761)
!1766 = !DILocation(line: 714, column: 26, scope: !1755, inlinedAt: !1761)
!1767 = !DILocation(line: 717, column: 33, scope: !1755, inlinedAt: !1761)
!1768 = !DILocation(line: 717, column: 11, scope: !1755, inlinedAt: !1761)
!1769 = !DILocation(line: 717, column: 19, scope: !1755, inlinedAt: !1761)
!1770 = !{!1412, !444, i64 56}
!1771 = !DILocation(line: 718, column: 47, scope: !1755, inlinedAt: !1761)
!1772 = !DILocation(line: 718, column: 28, scope: !1755, inlinedAt: !1761)
!1773 = !DILocation(line: 719, column: 16, scope: !1755, inlinedAt: !1761)
!1774 = !DILocation(line: 718, column: 11, scope: !1755, inlinedAt: !1761)
!1775 = !DILocation(line: 718, column: 26, scope: !1755, inlinedAt: !1761)
!1776 = !{!1412, !445, i64 65}
!1777 = !DILocation(line: 721, column: 11, scope: !1755, inlinedAt: !1761)
!1778 = !DILocation(line: 721, column: 32, scope: !1755, inlinedAt: !1761)
!1779 = !{!1412, !627, i64 66}
!1780 = !DILocalVariable(name: "f_state", arg: 1, scope: !1781, file: !3, line: 724, type: !1336)
!1781 = distinct !DISubprogram(name: "init_empty_flowstate", scope: !3, file: !3, line: 724, type: !1782, scopeLine: 725, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1784)
!1782 = !DISubroutineType(types: !1783)
!1783 = !{null, !1336}
!1784 = !{!1780}
!1785 = !DILocation(line: 0, scope: !1781, inlinedAt: !1786)
!1786 = distinct !DILocation(line: 743, column: 2, scope: !1745, inlinedAt: !1753)
!1787 = !DILocation(line: 726, column: 11, scope: !1781, inlinedAt: !1786)
!1788 = !DILocation(line: 726, column: 22, scope: !1781, inlinedAt: !1786)
!1789 = !DILocation(line: 727, column: 11, scope: !1781, inlinedAt: !1786)
!1790 = !DILocation(line: 727, column: 32, scope: !1781, inlinedAt: !1786)
!1791 = !DILocation(line: 754, column: 39, scope: !1792, inlinedAt: !1737)
!1792 = distinct !DILexicalBlock(scope: !1731, file: !3, line: 754, column: 6)
!1793 = !DILocation(line: 754, column: 6, scope: !1792, inlinedAt: !1737)
!1794 = !DILocation(line: 754, column: 69, scope: !1792, inlinedAt: !1737)
!1795 = !DILocation(line: 754, column: 6, scope: !1731, inlinedAt: !1737)
!1796 = !DILocalVariable(name: "ctx", arg: 1, scope: !1797, file: !3, line: 686, type: !99)
!1797 = distinct !DISubprogram(name: "send_map_full_event", scope: !3, file: !3, line: 686, type: !1798, scopeLine: 688, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1800)
!1798 = !DISubroutineType(types: !1799)
!1799 = !{null, !99, !399, !37}
!1800 = !{!1796, !1801, !1802, !1803}
!1801 = !DILocalVariable(name: "p_info", arg: 2, scope: !1797, file: !3, line: 686, type: !399)
!1802 = !DILocalVariable(name: "map", arg: 3, scope: !1797, file: !3, line: 687, type: !37)
!1803 = !DILocalVariable(name: "me", scope: !1797, file: !3, line: 689, type: !1804)
!1804 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "map_full_event", file: !6, line: 176, size: 512, elements: !1805)
!1805 = !{!1806, !1807, !1808, !1809, !1810}
!1806 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !1804, file: !6, line: 177, baseType: !165, size: 64)
!1807 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !1804, file: !6, line: 178, baseType: !165, size: 64, offset: 64)
!1808 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !1804, file: !6, line: 179, baseType: !102, size: 352, offset: 128)
!1809 = !DIDerivedType(tag: DW_TAG_member, name: "map", scope: !1804, file: !6, line: 180, baseType: !37, size: 8, offset: 480)
!1810 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !1804, file: !6, line: 181, baseType: !228, size: 24, offset: 488)
!1811 = !DILocation(line: 0, scope: !1797, inlinedAt: !1812)
!1812 = distinct !DILocation(line: 756, column: 3, scope: !1813, inlinedAt: !1737)
!1813 = distinct !DILexicalBlock(scope: !1792, file: !3, line: 755, column: 9)
!1814 = !DILocation(line: 689, column: 2, scope: !1797, inlinedAt: !1812)
!1815 = !DILocation(line: 689, column: 24, scope: !1797, inlinedAt: !1812)
!1816 = !DILocation(line: 691, column: 14, scope: !1817, inlinedAt: !1812)
!1817 = distinct !DILexicalBlock(scope: !1797, file: !3, line: 691, column: 6)
!1818 = !DILocation(line: 691, column: 21, scope: !1817, inlinedAt: !1812)
!1819 = !DILocation(line: 691, column: 19, scope: !1817, inlinedAt: !1812)
!1820 = !DILocation(line: 691, column: 41, scope: !1817, inlinedAt: !1812)
!1821 = !DILocation(line: 692, column: 21, scope: !1817, inlinedAt: !1812)
!1822 = !DILocation(line: 692, column: 19, scope: !1817, inlinedAt: !1812)
!1823 = !DILocation(line: 692, column: 41, scope: !1817, inlinedAt: !1812)
!1824 = !DILocation(line: 691, column: 6, scope: !1797, inlinedAt: !1812)
!1825 = !DILocation(line: 695, column: 22, scope: !1797, inlinedAt: !1812)
!1826 = !DILocation(line: 697, column: 2, scope: !1797, inlinedAt: !1812)
!1827 = !DILocation(line: 698, column: 5, scope: !1797, inlinedAt: !1812)
!1828 = !DILocation(line: 698, column: 16, scope: !1797, inlinedAt: !1812)
!1829 = !{!1830, !447, i64 0}
!1830 = !{!"map_full_event", !447, i64 0, !447, i64 8, !623, i64 16, !445, i64 60, !445, i64 61}
!1831 = !DILocation(line: 699, column: 5, scope: !1797, inlinedAt: !1812)
!1832 = !DILocation(line: 699, column: 15, scope: !1797, inlinedAt: !1812)
!1833 = !{!1830, !447, i64 8}
!1834 = !DILocation(line: 700, column: 5, scope: !1797, inlinedAt: !1812)
!1835 = !DILocation(line: 700, column: 24, scope: !1797, inlinedAt: !1812)
!1836 = !DILocation(line: 701, column: 5, scope: !1797, inlinedAt: !1812)
!1837 = !DILocation(line: 701, column: 9, scope: !1797, inlinedAt: !1812)
!1838 = !{!1830, !445, i64 60}
!1839 = !DILocation(line: 703, column: 2, scope: !1797, inlinedAt: !1812)
!1840 = !DILocation(line: 704, column: 1, scope: !1797, inlinedAt: !1812)
!1841 = !DILocation(line: 757, column: 3, scope: !1813, inlinedAt: !1737)
!1842 = !DILocation(line: 760, column: 9, scope: !1731, inlinedAt: !1737)
!1843 = !DILocation(line: 760, column: 2, scope: !1731, inlinedAt: !1737)
!1844 = !DILocation(line: 761, column: 1, scope: !1731, inlinedAt: !1737)
!1845 = !DILocation(line: 779, column: 2, scope: !1702, inlinedAt: !1709)
!1846 = !DILocation(line: 1004, column: 7, scope: !1847)
!1847 = distinct !DILexicalBlock(scope: !1691, file: !3, line: 1004, column: 6)
!1848 = !DILocation(line: 1004, column: 6, scope: !1691)
!1849 = !DILocalVariable(name: "df_state", arg: 1, scope: !1850, file: !3, line: 248, type: !179)
!1850 = distinct !DISubprogram(name: "get_flowstate_from_packet", scope: !3, file: !3, line: 248, type: !1851, scopeLine: 250, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1853)
!1851 = !DISubroutineType(types: !1852)
!1852 = !{!1336, !179, !399}
!1853 = !{!1849, !1854}
!1854 = !DILocalVariable(name: "p_info", arg: 2, scope: !1850, file: !3, line: 249, type: !399)
!1855 = !DILocation(line: 0, scope: !1850, inlinedAt: !1856)
!1856 = distinct !DILocation(line: 1007, column: 12, scope: !1691)
!1857 = !DILocation(line: 251, column: 45, scope: !1850, inlinedAt: !1856)
!1858 = !DILocation(line: 0, scope: !1402, inlinedAt: !1859)
!1859 = distinct !DILocation(line: 251, column: 9, scope: !1850, inlinedAt: !1856)
!1860 = !DILocation(line: 231, column: 9, scope: !1402, inlinedAt: !1859)
!1861 = !DILocalVariable(name: "p_info", arg: 1, scope: !1862, file: !3, line: 788, type: !399)
!1862 = distinct !DISubprogram(name: "update_forward_flowstate", scope: !3, file: !3, line: 788, type: !1863, scopeLine: 790, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1865)
!1863 = !DISubroutineType(types: !1864)
!1864 = !{null, !399, !1336}
!1865 = !{!1861, !1866}
!1866 = !DILocalVariable(name: "f_state", arg: 2, scope: !1862, file: !3, line: 789, type: !1336)
!1867 = !DILocation(line: 0, scope: !1862, inlinedAt: !1868)
!1868 = distinct !DILocation(line: 1008, column: 2, scope: !1691)
!1869 = !DILocation(line: 792, column: 15, scope: !1870, inlinedAt: !1868)
!1870 = distinct !DILexicalBlock(scope: !1862, file: !3, line: 792, column: 6)
!1871 = !DILocation(line: 792, column: 52, scope: !1870, inlinedAt: !1868)
!1872 = !DILocation(line: 792, column: 63, scope: !1870, inlinedAt: !1868)
!1873 = !DILocation(line: 792, column: 6, scope: !1862, inlinedAt: !1868)
!1874 = !DILocation(line: 0, scope: !1755, inlinedAt: !1875)
!1875 = distinct !DILocation(line: 793, column: 3, scope: !1870, inlinedAt: !1868)
!1876 = !DILocation(line: 713, column: 22, scope: !1755, inlinedAt: !1875)
!1877 = !DILocation(line: 714, column: 36, scope: !1755, inlinedAt: !1875)
!1878 = !DILocation(line: 714, column: 11, scope: !1755, inlinedAt: !1875)
!1879 = !DILocation(line: 714, column: 26, scope: !1755, inlinedAt: !1875)
!1880 = !DILocation(line: 717, column: 33, scope: !1755, inlinedAt: !1875)
!1881 = !DILocation(line: 717, column: 11, scope: !1755, inlinedAt: !1875)
!1882 = !DILocation(line: 717, column: 19, scope: !1755, inlinedAt: !1875)
!1883 = !DILocation(line: 718, column: 36, scope: !1755, inlinedAt: !1875)
!1884 = !DILocation(line: 718, column: 47, scope: !1755, inlinedAt: !1875)
!1885 = !DILocation(line: 718, column: 28, scope: !1755, inlinedAt: !1875)
!1886 = !DILocation(line: 719, column: 16, scope: !1755, inlinedAt: !1875)
!1887 = !DILocation(line: 718, column: 11, scope: !1755, inlinedAt: !1875)
!1888 = !DILocation(line: 718, column: 26, scope: !1755, inlinedAt: !1875)
!1889 = !DILocation(line: 721, column: 11, scope: !1755, inlinedAt: !1875)
!1890 = !DILocation(line: 721, column: 32, scope: !1755, inlinedAt: !1875)
!1891 = !DILocalVariable(name: "f_state", arg: 1, scope: !1892, file: !3, line: 908, type: !1336)
!1892 = distinct !DISubprogram(name: "pping_timestamp_packet", scope: !3, file: !3, line: 908, type: !1893, scopeLine: 910, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1895)
!1893 = !DISubroutineType(types: !1894)
!1894 = !{null, !1336, !99, !399}
!1895 = !{!1891, !1896, !1897}
!1896 = !DILocalVariable(name: "ctx", arg: 2, scope: !1892, file: !3, line: 908, type: !99)
!1897 = !DILocalVariable(name: "p_info", arg: 3, scope: !1892, file: !3, line: 909, type: !399)
!1898 = !DILocation(line: 0, scope: !1892, inlinedAt: !1899)
!1899 = distinct !DILocation(line: 1009, column: 2, scope: !1691)
!1900 = !DILocation(line: 0, scope: !1548, inlinedAt: !1901)
!1901 = distinct !DILocation(line: 911, column: 7, scope: !1902, inlinedAt: !1899)
!1902 = distinct !DILexicalBlock(scope: !1892, file: !3, line: 911, column: 6)
!1903 = !DILocation(line: 911, column: 36, scope: !1902, inlinedAt: !1899)
!1904 = !DILocation(line: 796, column: 12, scope: !1905, inlinedAt: !1868)
!1905 = distinct !DILexicalBlock(scope: !1906, file: !3, line: 795, column: 36)
!1906 = distinct !DILexicalBlock(scope: !1862, file: !3, line: 795, column: 6)
!1907 = !DILocation(line: 796, column: 21, scope: !1905, inlinedAt: !1868)
!1908 = !{!1412, !447, i64 24}
!1909 = !DILocation(line: 797, column: 34, scope: !1905, inlinedAt: !1868)
!1910 = !DILocation(line: 797, column: 26, scope: !1905, inlinedAt: !1868)
!1911 = !DILocation(line: 797, column: 12, scope: !1905, inlinedAt: !1868)
!1912 = !DILocation(line: 797, column: 23, scope: !1905, inlinedAt: !1868)
!1913 = !{!1412, !447, i64 32}
!1914 = !DILocation(line: 911, column: 48, scope: !1902, inlinedAt: !1899)
!1915 = !DILocation(line: 911, column: 6, scope: !1892, inlinedAt: !1899)
!1916 = !DILocation(line: 914, column: 13, scope: !1917, inlinedAt: !1899)
!1917 = distinct !DILexicalBlock(scope: !1892, file: !3, line: 914, column: 6)
!1918 = !{!805, !627, i64 19}
!1919 = !DILocation(line: 914, column: 23, scope: !1917, inlinedAt: !1899)
!1920 = !DILocation(line: 914, column: 34, scope: !1917, inlinedAt: !1899)
!1921 = !DILocation(line: 914, column: 45, scope: !1917, inlinedAt: !1899)
!1922 = !DILocalVariable(name: "p_info", arg: 1, scope: !1923, file: !3, line: 859, type: !399)
!1923 = distinct !DISubprogram(name: "is_local_address", scope: !3, file: !3, line: 859, type: !1924, scopeLine: 860, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1926)
!1924 = !DISubroutineType(types: !1925)
!1925 = !{!197, !399, !99}
!1926 = !{!1922, !1927, !1928, !1929, !1930, !1934}
!1927 = !DILocalVariable(name: "ctx", arg: 2, scope: !1923, file: !3, line: 859, type: !99)
!1928 = !DILocalVariable(name: "ret", scope: !1923, file: !3, line: 861, type: !154)
!1929 = !DILocalVariable(name: "lookup", scope: !1923, file: !3, line: 862, type: !256)
!1930 = !DILocalVariable(name: "src", scope: !1931, file: !3, line: 874, type: !145)
!1931 = distinct !DILexicalBlock(scope: !1932, file: !3, line: 873, column: 40)
!1932 = distinct !DILexicalBlock(scope: !1933, file: !3, line: 873, column: 13)
!1933 = distinct !DILexicalBlock(scope: !1923, file: !3, line: 869, column: 6)
!1934 = !DILocalVariable(name: "dst", scope: !1931, file: !3, line: 875, type: !145)
!1935 = !DILocation(line: 0, scope: !1923, inlinedAt: !1936)
!1936 = distinct !DILocation(line: 915, column: 6, scope: !1917, inlinedAt: !1899)
!1937 = !DILocation(line: 862, column: 2, scope: !1923, inlinedAt: !1936)
!1938 = !DILocation(line: 862, column: 24, scope: !1923, inlinedAt: !1936)
!1939 = !DILocation(line: 863, column: 2, scope: !1923, inlinedAt: !1936)
!1940 = !DILocation(line: 865, column: 27, scope: !1923, inlinedAt: !1936)
!1941 = !DILocation(line: 865, column: 9, scope: !1923, inlinedAt: !1936)
!1942 = !DILocation(line: 865, column: 17, scope: !1923, inlinedAt: !1936)
!1943 = !{!1944, !444, i64 8}
!1944 = !{!"bpf_fib_lookup", !445, i64 0, !445, i64 1, !626, i64 2, !626, i64 4, !626, i64 6, !444, i64 8, !445, i64 12, !445, i64 16, !445, i64 32, !626, i64 48, !626, i64 50, !445, i64 52, !445, i64 58}
!1945 = !DILocation(line: 866, column: 35, scope: !1923, inlinedAt: !1936)
!1946 = !DILocation(line: 866, column: 16, scope: !1923, inlinedAt: !1936)
!1947 = !{!1944, !445, i64 0}
!1948 = !DILocation(line: 867, column: 27, scope: !1923, inlinedAt: !1936)
!1949 = !{!621, !626, i64 116}
!1950 = !DILocation(line: 867, column: 9, scope: !1923, inlinedAt: !1936)
!1951 = !DILocation(line: 867, column: 17, scope: !1923, inlinedAt: !1936)
!1952 = !{!1944, !626, i64 6}
!1953 = !DILocation(line: 869, column: 6, scope: !1923, inlinedAt: !1936)
!1954 = !DILocation(line: 870, column: 24, scope: !1955, inlinedAt: !1936)
!1955 = distinct !DILexicalBlock(scope: !1933, file: !3, line: 869, column: 32)
!1956 = !DILocation(line: 870, column: 31, scope: !1955, inlinedAt: !1936)
!1957 = !DILocation(line: 870, column: 10, scope: !1955, inlinedAt: !1936)
!1958 = !DILocation(line: 870, column: 14, scope: !1955, inlinedAt: !1936)
!1959 = !DILocalVariable(name: "ipv6", arg: 1, scope: !1960, file: !3, line: 163, type: !145)
!1960 = distinct !DISubprogram(name: "ipv4_from_ipv6", scope: !3, file: !3, line: 163, type: !1961, scopeLine: 164, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1963)
!1961 = !DISubroutineType(types: !1962)
!1962 = !{!130, !145}
!1963 = !{!1959}
!1964 = !DILocation(line: 0, scope: !1960, inlinedAt: !1965)
!1965 = distinct !DILocation(line: 871, column: 21, scope: !1955, inlinedAt: !1936)
!1966 = !DILocation(line: 165, column: 9, scope: !1960, inlinedAt: !1965)
!1967 = !DILocation(line: 871, column: 10, scope: !1955, inlinedAt: !1936)
!1968 = !DILocation(line: 871, column: 19, scope: !1955, inlinedAt: !1936)
!1969 = !DILocation(line: 0, scope: !1960, inlinedAt: !1970)
!1970 = distinct !DILocation(line: 872, column: 21, scope: !1955, inlinedAt: !1936)
!1971 = !DILocation(line: 165, column: 9, scope: !1960, inlinedAt: !1970)
!1972 = !DILocation(line: 872, column: 10, scope: !1955, inlinedAt: !1936)
!1973 = !DILocation(line: 872, column: 19, scope: !1955, inlinedAt: !1936)
!1974 = !DILocation(line: 873, column: 2, scope: !1955, inlinedAt: !1936)
!1975 = !DILocation(line: 874, column: 45, scope: !1931, inlinedAt: !1936)
!1976 = !DILocation(line: 0, scope: !1931, inlinedAt: !1936)
!1977 = !DILocation(line: 875, column: 45, scope: !1931, inlinedAt: !1936)
!1978 = !DILocation(line: 877, column: 36, scope: !1931, inlinedAt: !1936)
!1979 = !DILocation(line: 877, column: 10, scope: !1931, inlinedAt: !1936)
!1980 = !DILocation(line: 877, column: 19, scope: !1931, inlinedAt: !1936)
!1981 = !DILocation(line: 878, column: 33, scope: !1931, inlinedAt: !1936)
!1982 = !DILocation(line: 879, column: 33, scope: !1931, inlinedAt: !1936)
!1983 = !DILocation(line: 880, column: 2, scope: !1931, inlinedAt: !1936)
!1984 = !DILocation(line: 882, column: 40, scope: !1923, inlinedAt: !1936)
!1985 = !DILocation(line: 882, column: 23, scope: !1923, inlinedAt: !1936)
!1986 = !DILocation(line: 882, column: 9, scope: !1923, inlinedAt: !1936)
!1987 = !DILocation(line: 882, column: 21, scope: !1923, inlinedAt: !1936)
!1988 = !{!1944, !445, i64 1}
!1989 = !DILocation(line: 883, column: 9, scope: !1923, inlinedAt: !1936)
!1990 = !DILocation(line: 883, column: 15, scope: !1923, inlinedAt: !1936)
!1991 = !{!1944, !626, i64 2}
!1992 = !DILocation(line: 884, column: 9, scope: !1923, inlinedAt: !1936)
!1993 = !DILocation(line: 884, column: 15, scope: !1923, inlinedAt: !1936)
!1994 = !{!1944, !626, i64 4}
!1995 = !DILocation(line: 886, column: 8, scope: !1923, inlinedAt: !1936)
!1996 = !DILocation(line: 888, column: 43, scope: !1923, inlinedAt: !1936)
!1997 = !DILocation(line: 890, column: 1, scope: !1923, inlinedAt: !1936)
!1998 = !DILocation(line: 914, column: 6, scope: !1892, inlinedAt: !1899)
!1999 = !DILocation(line: 919, column: 16, scope: !2000, inlinedAt: !1899)
!2000 = distinct !DILexicalBlock(scope: !1892, file: !3, line: 919, column: 6)
!2001 = !DILocation(line: 919, column: 37, scope: !2000, inlinedAt: !1899)
!2002 = !DILocation(line: 919, column: 48, scope: !2000, inlinedAt: !1899)
!2003 = !DILocation(line: 919, column: 65, scope: !2000, inlinedAt: !1899)
!2004 = !DILocation(line: 922, column: 33, scope: !1892, inlinedAt: !1899)
!2005 = !DILocation(line: 922, column: 11, scope: !1892, inlinedAt: !1899)
!2006 = !DILocation(line: 922, column: 19, scope: !1892, inlinedAt: !1899)
!2007 = !DILocation(line: 925, column: 36, scope: !2008, inlinedAt: !1899)
!2008 = distinct !DILexicalBlock(scope: !1892, file: !3, line: 925, column: 6)
!2009 = !DILocalVariable(name: "pid", arg: 1, scope: !2010, file: !3, line: 892, type: !158)
!2010 = distinct !DISubprogram(name: "is_new_identifier", scope: !3, file: !3, line: 892, type: !2011, scopeLine: 893, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2013)
!2011 = !DISubroutineType(types: !2012)
!2012 = !{!197, !158, !1336}
!2013 = !{!2009, !2014}
!2014 = !DILocalVariable(name: "f_state", arg: 2, scope: !2010, file: !3, line: 892, type: !1336)
!2015 = !DILocation(line: 0, scope: !2010, inlinedAt: !2016)
!2016 = distinct !DILocation(line: 920, column: 7, scope: !2000, inlinedAt: !1899)
!2017 = !DILocation(line: 894, column: 16, scope: !2018, inlinedAt: !2016)
!2018 = distinct !DILexicalBlock(scope: !2010, file: !3, line: 894, column: 6)
!2019 = !{!622, !626, i64 40}
!2020 = !DILocation(line: 894, column: 22, scope: !2018, inlinedAt: !2016)
!2021 = !{!622, !444, i64 44}
!2022 = !DILocation(line: 894, column: 6, scope: !2010, inlinedAt: !2016)
!2023 = !DILocation(line: 919, column: 6, scope: !1892, inlinedAt: !1899)
!2024 = !DILocation(line: 926, column: 30, scope: !2008, inlinedAt: !1899)
!2025 = !DILocation(line: 926, column: 45, scope: !2008, inlinedAt: !1899)
!2026 = !DILocation(line: 927, column: 15, scope: !2008, inlinedAt: !1899)
!2027 = !{!805, !627, i64 16}
!2028 = !DILocation(line: 927, column: 8, scope: !2008, inlinedAt: !1899)
!2029 = !DILocalVariable(name: "now", arg: 1, scope: !2030, file: !3, line: 618, type: !165)
!2030 = distinct !DISubprogram(name: "is_rate_limited", scope: !3, file: !3, line: 618, type: !2031, scopeLine: 619, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2033)
!2031 = !DISubroutineType(types: !2032)
!2032 = !{!197, !165, !165, !165}
!2033 = !{!2029, !2034, !2035}
!2034 = !DILocalVariable(name: "last_ts", arg: 2, scope: !2030, file: !3, line: 618, type: !165)
!2035 = !DILocalVariable(name: "rtt", arg: 3, scope: !2030, file: !3, line: 618, type: !165)
!2036 = !DILocation(line: 0, scope: !2030, inlinedAt: !2037)
!2037 = distinct !DILocation(line: 926, column: 6, scope: !2008, inlinedAt: !1899)
!2038 = !DILocation(line: 620, column: 10, scope: !2039, inlinedAt: !2037)
!2039 = distinct !DILexicalBlock(scope: !2030, file: !3, line: 620, column: 6)
!2040 = !DILocation(line: 620, column: 6, scope: !2030, inlinedAt: !2037)
!2041 = !DILocation(line: 624, column: 13, scope: !2042, inlinedAt: !2037)
!2042 = distinct !DILexicalBlock(scope: !2030, file: !3, line: 624, column: 6)
!2043 = !{!805, !447, i64 8}
!2044 = !DILocation(line: 624, column: 6, scope: !2042, inlinedAt: !2037)
!2045 = !DILocation(line: 624, column: 22, scope: !2042, inlinedAt: !2037)
!2046 = !DILocation(line: 625, column: 26, scope: !2042, inlinedAt: !2037)
!2047 = !DILocation(line: 625, column: 24, scope: !2042, inlinedAt: !2037)
!2048 = !DILocation(line: 925, column: 6, scope: !1892, inlinedAt: !1899)
!2049 = !DILocation(line: 628, column: 32, scope: !2030, inlinedAt: !2037)
!2050 = !{!805, !447, i64 0}
!2051 = !DILocation(line: 628, column: 23, scope: !2030, inlinedAt: !2037)
!2052 = !DILocation(line: 922, column: 29, scope: !1892, inlinedAt: !1899)
!2053 = !DILocation(line: 936, column: 32, scope: !1892, inlinedAt: !1899)
!2054 = !DILocation(line: 937, column: 36, scope: !1892, inlinedAt: !1899)
!2055 = !DILocation(line: 937, column: 11, scope: !1892, inlinedAt: !1899)
!2056 = !DILocation(line: 937, column: 26, scope: !1892, inlinedAt: !1899)
!2057 = !DILocation(line: 939, column: 38, scope: !2058, inlinedAt: !1899)
!2058 = distinct !DILexicalBlock(scope: !1892, file: !3, line: 939, column: 6)
!2059 = !DILocation(line: 939, column: 52, scope: !2058, inlinedAt: !1899)
!2060 = !DILocation(line: 939, column: 6, scope: !2058, inlinedAt: !1899)
!2061 = !DILocation(line: 940, column: 18, scope: !2058, inlinedAt: !1899)
!2062 = !DILocation(line: 939, column: 6, scope: !1892, inlinedAt: !1899)
!2063 = !DILocation(line: 941, column: 34, scope: !2058, inlinedAt: !1899)
!2064 = !DILocation(line: 941, column: 3, scope: !2058, inlinedAt: !1899)
!2065 = !DILocation(line: 0, scope: !1797, inlinedAt: !2066)
!2066 = distinct !DILocation(line: 943, column: 3, scope: !2058, inlinedAt: !1899)
!2067 = !DILocation(line: 689, column: 2, scope: !1797, inlinedAt: !2066)
!2068 = !DILocation(line: 689, column: 24, scope: !1797, inlinedAt: !2066)
!2069 = !DILocation(line: 691, column: 14, scope: !1817, inlinedAt: !2066)
!2070 = !DILocation(line: 691, column: 21, scope: !1817, inlinedAt: !2066)
!2071 = !DILocation(line: 691, column: 19, scope: !1817, inlinedAt: !2066)
!2072 = !DILocation(line: 691, column: 41, scope: !1817, inlinedAt: !2066)
!2073 = !DILocation(line: 692, column: 21, scope: !1817, inlinedAt: !2066)
!2074 = !DILocation(line: 692, column: 19, scope: !1817, inlinedAt: !2066)
!2075 = !DILocation(line: 692, column: 41, scope: !1817, inlinedAt: !2066)
!2076 = !DILocation(line: 691, column: 6, scope: !1797, inlinedAt: !2066)
!2077 = !DILocation(line: 695, column: 22, scope: !1797, inlinedAt: !2066)
!2078 = !DILocation(line: 697, column: 2, scope: !1797, inlinedAt: !2066)
!2079 = !DILocation(line: 698, column: 5, scope: !1797, inlinedAt: !2066)
!2080 = !DILocation(line: 698, column: 16, scope: !1797, inlinedAt: !2066)
!2081 = !DILocation(line: 699, column: 5, scope: !1797, inlinedAt: !2066)
!2082 = !DILocation(line: 699, column: 15, scope: !1797, inlinedAt: !2066)
!2083 = !DILocation(line: 700, column: 5, scope: !1797, inlinedAt: !2066)
!2084 = !DILocation(line: 700, column: 24, scope: !1797, inlinedAt: !2066)
!2085 = !DILocation(line: 701, column: 5, scope: !1797, inlinedAt: !2066)
!2086 = !DILocation(line: 701, column: 9, scope: !1797, inlinedAt: !2066)
!2087 = !DILocation(line: 703, column: 2, scope: !1797, inlinedAt: !2066)
!2088 = !DILocation(line: 704, column: 1, scope: !1797, inlinedAt: !2066)
!2089 = !DILocalVariable(name: "df_state", arg: 1, scope: !2090, file: !3, line: 255, type: !179)
!2090 = distinct !DISubprogram(name: "get_reverse_flowstate_from_packet", scope: !3, file: !3, line: 255, type: !1851, scopeLine: 257, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2091)
!2091 = !{!2089, !2092}
!2092 = !DILocalVariable(name: "p_info", arg: 2, scope: !2090, file: !3, line: 256, type: !399)
!2093 = !DILocation(line: 0, scope: !2090, inlinedAt: !2094)
!2094 = distinct !DILocation(line: 1011, column: 13, scope: !1691)
!2095 = !DILocation(line: 258, column: 46, scope: !2090, inlinedAt: !2094)
!2096 = !DILocation(line: 0, scope: !1402, inlinedAt: !2097)
!2097 = distinct !DILocation(line: 258, column: 9, scope: !2090, inlinedAt: !2094)
!2098 = !DILocation(line: 231, column: 9, scope: !1402, inlinedAt: !2097)
!2099 = !DILocalVariable(name: "ctx", arg: 1, scope: !2100, file: !3, line: 801, type: !99)
!2100 = distinct !DISubprogram(name: "update_reverse_flowstate", scope: !3, file: !3, line: 801, type: !2101, scopeLine: 803, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2103)
!2101 = !DISubroutineType(types: !2102)
!2102 = !{null, !99, !399, !1336}
!2103 = !{!2099, !2104, !2105}
!2104 = !DILocalVariable(name: "p_info", arg: 2, scope: !2100, file: !3, line: 801, type: !399)
!2105 = !DILocalVariable(name: "f_state", arg: 3, scope: !2100, file: !3, line: 802, type: !1336)
!2106 = !DILocation(line: 0, scope: !2100, inlinedAt: !2107)
!2107 = distinct !DILocation(line: 1012, column: 2, scope: !1691)
!2108 = !DILocation(line: 0, scope: !1548, inlinedAt: !2109)
!2109 = distinct !DILocation(line: 804, column: 7, scope: !2110, inlinedAt: !2107)
!2110 = distinct !DILexicalBlock(scope: !2100, file: !3, line: 804, column: 6)
!2111 = !DILocation(line: 784, column: 18, scope: !1548, inlinedAt: !2109)
!2112 = !DILocation(line: 804, column: 6, scope: !2100, inlinedAt: !2107)
!2113 = !DILocation(line: 809, column: 14, scope: !2114, inlinedAt: !2107)
!2114 = distinct !DILexicalBlock(scope: !2100, file: !3, line: 808, column: 6)
!2115 = !DILocation(line: 809, column: 25, scope: !2114, inlinedAt: !2107)
!2116 = !DILocation(line: 808, column: 6, scope: !2100, inlinedAt: !2107)
!2117 = !DILocation(line: 810, column: 23, scope: !2118, inlinedAt: !2107)
!2118 = distinct !DILexicalBlock(scope: !2114, file: !3, line: 809, column: 53)
!2119 = !DILocalVariable(name: "ctx", arg: 1, scope: !2120, file: !3, line: 637, type: !99)
!2120 = distinct !DISubprogram(name: "send_flow_open_event", scope: !3, file: !3, line: 637, type: !2101, scopeLine: 639, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2121)
!2121 = !{!2119, !2122, !2123, !2124}
!2122 = !DILocalVariable(name: "p_info", arg: 2, scope: !2120, file: !3, line: 637, type: !399)
!2123 = !DILocalVariable(name: "rev_flow", arg: 3, scope: !2120, file: !3, line: 638, type: !1336)
!2124 = !DILocalVariable(name: "fe", scope: !2120, file: !3, line: 640, type: !1619)
!2125 = !DILocation(line: 0, scope: !2120, inlinedAt: !2126)
!2126 = distinct !DILocation(line: 811, column: 3, scope: !2118, inlinedAt: !2107)
!2127 = !DILocation(line: 640, column: 2, scope: !2120, inlinedAt: !2126)
!2128 = !DILocation(line: 640, column: 20, scope: !2120, inlinedAt: !2126)
!2129 = !DILocation(line: 640, column: 25, scope: !2120, inlinedAt: !2126)
!2130 = !DILocation(line: 646, column: 26, scope: !2120, inlinedAt: !2126)
!2131 = !DILocation(line: 644, column: 23, scope: !2120, inlinedAt: !2126)
!2132 = !DILocation(line: 645, column: 23, scope: !2120, inlinedAt: !2126)
!2133 = !DILocation(line: 650, column: 2, scope: !2120, inlinedAt: !2126)
!2134 = !DILocation(line: 651, column: 1, scope: !2120, inlinedAt: !2126)
!2135 = !DILocation(line: 812, column: 2, scope: !2118, inlinedAt: !2107)
!2136 = !DILocation(line: 814, column: 11, scope: !2100, inlinedAt: !2107)
!2137 = !DILocation(line: 814, column: 19, scope: !2100, inlinedAt: !2107)
!2138 = !{!1412, !447, i64 40}
!2139 = !DILocation(line: 815, column: 32, scope: !2100, inlinedAt: !2107)
!2140 = !DILocation(line: 815, column: 24, scope: !2100, inlinedAt: !2107)
!2141 = !DILocation(line: 815, column: 11, scope: !2100, inlinedAt: !2107)
!2142 = !DILocation(line: 815, column: 21, scope: !2100, inlinedAt: !2107)
!2143 = !{!1412, !447, i64 48}
!2144 = !DILocation(line: 816, column: 1, scope: !2100, inlinedAt: !2107)
!2145 = !DILocalVariable(name: "f_state", arg: 1, scope: !2146, file: !3, line: 949, type: !1336)
!2146 = distinct !DISubprogram(name: "pping_match_packet", scope: !3, file: !3, line: 949, type: !1893, scopeLine: 951, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2147)
!2147 = !{!2145, !2148, !2149, !2150, !2168}
!2148 = !DILocalVariable(name: "ctx", arg: 2, scope: !2146, file: !3, line: 949, type: !99)
!2149 = !DILocalVariable(name: "p_info", arg: 3, scope: !2146, file: !3, line: 950, type: !399)
!2150 = !DILocalVariable(name: "re", scope: !2146, file: !3, line: 952, type: !2151)
!2151 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rtt_event", file: !6, line: 144, size: 960, elements: !2152)
!2152 = !{!2153, !2154, !2155, !2156, !2157, !2158, !2159, !2160, !2161, !2162, !2163, !2164}
!2153 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !2151, file: !6, line: 145, baseType: !165, size: 64)
!2154 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !2151, file: !6, line: 146, baseType: !165, size: 64, offset: 64)
!2155 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !2151, file: !6, line: 147, baseType: !102, size: 352, offset: 128)
!2156 = !DIDerivedType(tag: DW_TAG_member, name: "padding", scope: !2151, file: !6, line: 148, baseType: !131, size: 32, offset: 480)
!2157 = !DIDerivedType(tag: DW_TAG_member, name: "rtt", scope: !2151, file: !6, line: 149, baseType: !165, size: 64, offset: 512)
!2158 = !DIDerivedType(tag: DW_TAG_member, name: "min_rtt", scope: !2151, file: !6, line: 150, baseType: !165, size: 64, offset: 576)
!2159 = !DIDerivedType(tag: DW_TAG_member, name: "sent_pkts", scope: !2151, file: !6, line: 151, baseType: !165, size: 64, offset: 640)
!2160 = !DIDerivedType(tag: DW_TAG_member, name: "sent_bytes", scope: !2151, file: !6, line: 152, baseType: !165, size: 64, offset: 704)
!2161 = !DIDerivedType(tag: DW_TAG_member, name: "rec_pkts", scope: !2151, file: !6, line: 153, baseType: !165, size: 64, offset: 768)
!2162 = !DIDerivedType(tag: DW_TAG_member, name: "rec_bytes", scope: !2151, file: !6, line: 154, baseType: !165, size: 64, offset: 832)
!2163 = !DIDerivedType(tag: DW_TAG_member, name: "match_on_egress", scope: !2151, file: !6, line: 155, baseType: !197, size: 8, offset: 896)
!2164 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !2151, file: !6, line: 156, baseType: !2165, size: 56, offset: 904)
!2165 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 56, elements: !2166)
!2166 = !{!2167}
!2167 = !DISubrange(count: 7)
!2168 = !DILocalVariable(name: "p_ts", scope: !2146, file: !3, line: 953, type: !164)
!2169 = !DILocation(line: 0, scope: !2146, inlinedAt: !2170)
!2170 = distinct !DILocation(line: 1013, column: 2, scope: !1691)
!2171 = !DILocation(line: 952, column: 2, scope: !2146, inlinedAt: !2170)
!2172 = !DILocation(line: 952, column: 19, scope: !2146, inlinedAt: !2170)
!2173 = !DILocation(line: 0, scope: !1548, inlinedAt: !2174)
!2174 = distinct !DILocation(line: 955, column: 7, scope: !2175, inlinedAt: !2170)
!2175 = distinct !DILexicalBlock(scope: !2146, file: !3, line: 955, column: 6)
!2176 = !DILocation(line: 784, column: 18, scope: !1548, inlinedAt: !2174)
!2177 = !DILocation(line: 955, column: 36, scope: !2175, inlinedAt: !2170)
!2178 = !DILocation(line: 955, column: 48, scope: !2175, inlinedAt: !2170)
!2179 = !DILocation(line: 955, column: 6, scope: !2146, inlinedAt: !2170)
!2180 = !DILocation(line: 958, column: 15, scope: !2181, inlinedAt: !2170)
!2181 = distinct !DILexicalBlock(scope: !2146, file: !3, line: 958, column: 6)
!2182 = !{!1412, !444, i64 60}
!2183 = !DILocation(line: 958, column: 38, scope: !2181, inlinedAt: !2170)
!2184 = !DILocation(line: 958, column: 6, scope: !2146, inlinedAt: !2170)
!2185 = !DILocation(line: 961, column: 50, scope: !2146, inlinedAt: !2170)
!2186 = !DILocation(line: 961, column: 41, scope: !2146, inlinedAt: !2170)
!2187 = !DILocation(line: 961, column: 9, scope: !2146, inlinedAt: !2170)
!2188 = !DILocation(line: 962, column: 7, scope: !2189, inlinedAt: !2170)
!2189 = distinct !DILexicalBlock(scope: !2146, file: !3, line: 962, column: 6)
!2190 = !DILocation(line: 962, column: 12, scope: !2189, inlinedAt: !2170)
!2191 = !DILocation(line: 962, column: 23, scope: !2189, inlinedAt: !2170)
!2192 = !DILocation(line: 962, column: 30, scope: !2189, inlinedAt: !2170)
!2193 = !DILocation(line: 962, column: 28, scope: !2189, inlinedAt: !2170)
!2194 = !DILocation(line: 962, column: 6, scope: !2146, inlinedAt: !2170)
!2195 = !DILocation(line: 965, column: 24, scope: !2146, inlinedAt: !2170)
!2196 = !DILocation(line: 965, column: 5, scope: !2146, inlinedAt: !2170)
!2197 = !DILocation(line: 965, column: 9, scope: !2146, inlinedAt: !2170)
!2198 = !{!2199, !447, i64 64}
!2199 = !{!"rtt_event", !447, i64 0, !447, i64 8, !623, i64 16, !444, i64 60, !447, i64 64, !447, i64 72, !447, i64 80, !447, i64 88, !447, i64 96, !447, i64 104, !627, i64 112, !445, i64 113}
!2200 = !DILocation(line: 968, column: 6, scope: !2201, inlinedAt: !2170)
!2201 = distinct !DILexicalBlock(scope: !2146, file: !3, line: 968, column: 6)
!2202 = !DILocation(line: 968, column: 58, scope: !2201, inlinedAt: !2170)
!2203 = !DILocation(line: 968, column: 6, scope: !2146, inlinedAt: !2170)
!2204 = !DILocation(line: 969, column: 3, scope: !2205, inlinedAt: !2170)
!2205 = distinct !DILexicalBlock(scope: !2201, file: !3, line: 968, column: 64)
!2206 = !DILocation(line: 971, column: 2, scope: !2205, inlinedAt: !2170)
!2207 = !DILocation(line: 973, column: 15, scope: !2208, inlinedAt: !2170)
!2208 = distinct !DILexicalBlock(scope: !2146, file: !3, line: 973, column: 6)
!2209 = !{!1412, !447, i64 0}
!2210 = !DILocation(line: 973, column: 28, scope: !2208, inlinedAt: !2170)
!2211 = !DILocation(line: 974, column: 20, scope: !2208, inlinedAt: !2170)
!2212 = !DILocation(line: 974, column: 3, scope: !2208, inlinedAt: !2170)
!2213 = !DILocation(line: 980, column: 24, scope: !2146, inlinedAt: !2170)
!2214 = !DILocation(line: 975, column: 42, scope: !2146, inlinedAt: !2170)
!2215 = !DILocalVariable(name: "prev_srtt", arg: 1, scope: !2216, file: !3, line: 610, type: !165)
!2216 = distinct !DISubprogram(name: "calculate_srtt", scope: !3, file: !3, line: 610, type: !2217, scopeLine: 611, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2219)
!2217 = !DISubroutineType(types: !2218)
!2218 = !{!165, !165, !165}
!2219 = !{!2215, !2220}
!2220 = !DILocalVariable(name: "rtt", arg: 2, scope: !2216, file: !3, line: 610, type: !165)
!2221 = !DILocation(line: 0, scope: !2216, inlinedAt: !2222)
!2222 = distinct !DILocation(line: 975, column: 18, scope: !2146, inlinedAt: !2170)
!2223 = !DILocation(line: 612, column: 7, scope: !2224, inlinedAt: !2222)
!2224 = distinct !DILexicalBlock(scope: !2216, file: !3, line: 612, column: 6)
!2225 = !DILocation(line: 612, column: 6, scope: !2216, inlinedAt: !2222)
!2226 = !DILocation(line: 975, column: 16, scope: !2146, inlinedAt: !2170)
!2227 = !DILocation(line: 978, column: 5, scope: !2146, inlinedAt: !2170)
!2228 = !DILocation(line: 978, column: 16, scope: !2146, inlinedAt: !2170)
!2229 = !{!2199, !447, i64 0}
!2230 = !DILocation(line: 979, column: 25, scope: !2146, inlinedAt: !2170)
!2231 = !DILocation(line: 979, column: 5, scope: !2146, inlinedAt: !2170)
!2232 = !DILocation(line: 979, column: 15, scope: !2146, inlinedAt: !2170)
!2233 = !{!2199, !447, i64 8}
!2234 = !DILocation(line: 980, column: 5, scope: !2146, inlinedAt: !2170)
!2235 = !DILocation(line: 980, column: 13, scope: !2146, inlinedAt: !2170)
!2236 = !{!2199, !447, i64 72}
!2237 = !DILocation(line: 981, column: 26, scope: !2146, inlinedAt: !2170)
!2238 = !DILocation(line: 981, column: 5, scope: !2146, inlinedAt: !2170)
!2239 = !DILocation(line: 981, column: 15, scope: !2146, inlinedAt: !2170)
!2240 = !{!2199, !447, i64 80}
!2241 = !DILocation(line: 982, column: 27, scope: !2146, inlinedAt: !2170)
!2242 = !DILocation(line: 982, column: 5, scope: !2146, inlinedAt: !2170)
!2243 = !DILocation(line: 982, column: 16, scope: !2146, inlinedAt: !2170)
!2244 = !{!2199, !447, i64 88}
!2245 = !DILocation(line: 983, column: 25, scope: !2146, inlinedAt: !2170)
!2246 = !DILocation(line: 983, column: 5, scope: !2146, inlinedAt: !2170)
!2247 = !DILocation(line: 983, column: 14, scope: !2146, inlinedAt: !2170)
!2248 = !{!2199, !447, i64 96}
!2249 = !DILocation(line: 984, column: 26, scope: !2146, inlinedAt: !2170)
!2250 = !DILocation(line: 984, column: 5, scope: !2146, inlinedAt: !2170)
!2251 = !DILocation(line: 984, column: 15, scope: !2146, inlinedAt: !2170)
!2252 = !{!2199, !447, i64 104}
!2253 = !DILocation(line: 985, column: 5, scope: !2146, inlinedAt: !2170)
!2254 = !DILocation(line: 985, column: 24, scope: !2146, inlinedAt: !2170)
!2255 = !DILocation(line: 986, column: 32, scope: !2146, inlinedAt: !2170)
!2256 = !DILocation(line: 986, column: 5, scope: !2146, inlinedAt: !2170)
!2257 = !DILocation(line: 986, column: 21, scope: !2146, inlinedAt: !2170)
!2258 = !{!2199, !627, i64 112}
!2259 = !DILocation(line: 987, column: 2, scope: !2146, inlinedAt: !2170)
!2260 = !DILocation(line: 988, column: 1, scope: !2146, inlinedAt: !2170)
!2261 = !DILocalVariable(name: "ctx", arg: 1, scope: !2262, file: !3, line: 823, type: !99)
!2262 = distinct !DISubprogram(name: "close_and_delete_flows", scope: !3, file: !3, line: 823, type: !2263, scopeLine: 826, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2265)
!2263 = !DISubroutineType(types: !2264)
!2264 = !{null, !99, !399, !1336, !1336}
!2265 = !{!2261, !2266, !2267, !2268}
!2266 = !DILocalVariable(name: "p_info", arg: 2, scope: !2262, file: !3, line: 823, type: !399)
!2267 = !DILocalVariable(name: "fw_flow", arg: 3, scope: !2262, file: !3, line: 824, type: !1336)
!2268 = !DILocalVariable(name: "rev_flow", arg: 4, scope: !2262, file: !3, line: 825, type: !1336)
!2269 = !DILocation(line: 0, scope: !2262, inlinedAt: !2270)
!2270 = distinct !DILocation(line: 1015, column: 2, scope: !1691)
!2271 = !DILocation(line: 828, column: 14, scope: !2272, inlinedAt: !2270)
!2272 = distinct !DILexicalBlock(scope: !2262, file: !3, line: 828, column: 6)
!2273 = !DILocation(line: 828, column: 47, scope: !2272, inlinedAt: !2270)
!2274 = !DILocation(line: 0, scope: !1594, inlinedAt: !2275)
!2275 = distinct !DILocation(line: 830, column: 7, scope: !2276, inlinedAt: !2270)
!2276 = distinct !DILexicalBlock(scope: !2277, file: !3, line: 830, column: 7)
!2277 = distinct !DILexicalBlock(scope: !2272, file: !3, line: 829, column: 53)
!2278 = !DILocation(line: 820, column: 18, scope: !1594, inlinedAt: !2275)
!2279 = !DILocation(line: 820, column: 29, scope: !1594, inlinedAt: !2275)
!2280 = !DILocation(line: 830, column: 7, scope: !2277, inlinedAt: !2270)
!2281 = !DILocalVariable(name: "ctx", arg: 1, scope: !2282, file: !3, line: 660, type: !99)
!2282 = distinct !DISubprogram(name: "send_flow_event", scope: !3, file: !3, line: 660, type: !2283, scopeLine: 662, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2285)
!2283 = !DISubroutineType(types: !2284)
!2284 = !{null, !99, !399, !197}
!2285 = !{!2281, !2286, !2287, !2288}
!2286 = !DILocalVariable(name: "p_info", arg: 2, scope: !2282, file: !3, line: 660, type: !399)
!2287 = !DILocalVariable(name: "rev_flow", arg: 3, scope: !2282, file: !3, line: 661, type: !197)
!2288 = !DILocalVariable(name: "fe", scope: !2282, file: !3, line: 663, type: !1619)
!2289 = !DILocation(line: 0, scope: !2282, inlinedAt: !2290)
!2290 = distinct !DILocation(line: 831, column: 4, scope: !2276, inlinedAt: !2270)
!2291 = !DILocation(line: 663, column: 2, scope: !2282, inlinedAt: !2290)
!2292 = !DILocation(line: 663, column: 20, scope: !2282, inlinedAt: !2290)
!2293 = !DILocation(line: 663, column: 25, scope: !2282, inlinedAt: !2290)
!2294 = !DILocation(line: 667, column: 24, scope: !2282, inlinedAt: !2290)
!2295 = !DILocation(line: 666, column: 21, scope: !2282, inlinedAt: !2290)
!2296 = !DILocation(line: 675, column: 31, scope: !2297, inlinedAt: !2290)
!2297 = distinct !DILexicalBlock(scope: !2298, file: !3, line: 674, column: 9)
!2298 = distinct !DILexicalBlock(scope: !2282, file: !3, line: 671, column: 6)
!2299 = !DILocation(line: 0, scope: !2298, inlinedAt: !2290)
!2300 = !DILocation(line: 679, column: 2, scope: !2282, inlinedAt: !2290)
!2301 = !DILocation(line: 680, column: 1, scope: !2282, inlinedAt: !2290)
!2302 = !DILocation(line: 836, column: 14, scope: !2303, inlinedAt: !2270)
!2303 = distinct !DILexicalBlock(scope: !2262, file: !3, line: 836, column: 6)
!2304 = !DILocation(line: 831, column: 4, scope: !2276, inlinedAt: !2270)
!2305 = !DILocation(line: 832, column: 23, scope: !2277, inlinedAt: !2270)
!2306 = !DILocation(line: 836, column: 25, scope: !2303, inlinedAt: !2270)
!2307 = !DILocation(line: 836, column: 6, scope: !2262, inlinedAt: !2270)
!2308 = !DILocation(line: 0, scope: !1594, inlinedAt: !2309)
!2309 = distinct !DILocation(line: 837, column: 7, scope: !2310, inlinedAt: !2270)
!2310 = distinct !DILexicalBlock(scope: !2311, file: !3, line: 837, column: 7)
!2311 = distinct !DILexicalBlock(scope: !2303, file: !3, line: 836, column: 53)
!2312 = !DILocation(line: 820, column: 18, scope: !1594, inlinedAt: !2309)
!2313 = !DILocation(line: 820, column: 29, scope: !1594, inlinedAt: !2309)
!2314 = !DILocation(line: 837, column: 7, scope: !2311, inlinedAt: !2270)
!2315 = !DILocation(line: 0, scope: !2282, inlinedAt: !2316)
!2316 = distinct !DILocation(line: 838, column: 4, scope: !2310, inlinedAt: !2270)
!2317 = !DILocation(line: 663, column: 2, scope: !2282, inlinedAt: !2316)
!2318 = !DILocation(line: 663, column: 20, scope: !2282, inlinedAt: !2316)
!2319 = !DILocation(line: 663, column: 25, scope: !2282, inlinedAt: !2316)
!2320 = !DILocation(line: 667, column: 24, scope: !2282, inlinedAt: !2316)
!2321 = !DILocation(line: 666, column: 21, scope: !2282, inlinedAt: !2316)
!2322 = !DILocation(line: 672, column: 25, scope: !2323, inlinedAt: !2316)
!2323 = distinct !DILexicalBlock(scope: !2298, file: !3, line: 671, column: 16)
!2324 = !DILocation(line: 0, scope: !2298, inlinedAt: !2316)
!2325 = !DILocation(line: 679, column: 2, scope: !2282, inlinedAt: !2316)
!2326 = !DILocation(line: 680, column: 1, scope: !2282, inlinedAt: !2316)
!2327 = !DILocation(line: 838, column: 4, scope: !2310, inlinedAt: !2270)
!2328 = !DILocation(line: 839, column: 24, scope: !2311, inlinedAt: !2270)
!2329 = !DILocation(line: 840, column: 2, scope: !2311, inlinedAt: !2270)
!2330 = !DILocation(line: 784, column: 18, scope: !1548, inlinedAt: !2331)
!2331 = distinct !DILocation(line: 843, column: 7, scope: !2332, inlinedAt: !2270)
!2332 = distinct !DILexicalBlock(scope: !2262, file: !3, line: 843, column: 6)
!2333 = !DILocation(line: 0, scope: !1548, inlinedAt: !2331)
!2334 = !DILocation(line: 843, column: 36, scope: !2332, inlinedAt: !2270)
!2335 = !DILocation(line: 0, scope: !1548, inlinedAt: !2336)
!2336 = distinct !DILocation(line: 843, column: 40, scope: !2332, inlinedAt: !2270)
!2337 = !DILocation(line: 784, column: 18, scope: !1548, inlinedAt: !2336)
!2338 = !DILocation(line: 843, column: 6, scope: !2262, inlinedAt: !2270)
!2339 = !DILocation(line: 0, scope: !1711, inlinedAt: !2340)
!2340 = distinct !DILocation(line: 845, column: 6, scope: !2341, inlinedAt: !2270)
!2341 = distinct !DILexicalBlock(scope: !2342, file: !3, line: 844, column: 7)
!2342 = distinct !DILexicalBlock(scope: !2332, file: !3, line: 843, column: 71)
!2343 = !DILocation(line: 264, column: 17, scope: !1711, inlinedAt: !2340)
!2344 = !DILocation(line: 264, column: 9, scope: !1711, inlinedAt: !2340)
!2345 = !DILocation(line: 845, column: 6, scope: !2341, inlinedAt: !2270)
!2346 = !DILocation(line: 844, column: 7, scope: !2341, inlinedAt: !2270)
!2347 = !DILocation(line: 844, column: 7, scope: !2342, inlinedAt: !2270)
!2348 = !DILocation(line: 1016, column: 1, scope: !1691)
