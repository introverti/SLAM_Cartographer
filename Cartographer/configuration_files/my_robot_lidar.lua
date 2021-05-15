-- xavierxuan@foxmail.com
-- path:/catkin_ws/install_isolated/share/cartographer_ros/configuration_files
include "map_builder.lua"
include "trajectory_builder.lua"

options = {
--建图
  map_builder = MAP_BUILDER,
  trajectory_builder = TRAJECTORY_BUILDER,
--世界坐标
  map_frame = "map",
--SLAM代码追踪的数据
  tracking_frame = "laser_frame",
--用来发布位姿态的frame 通常是base_link
  published_frame = "laser_frame",
--启用内部里程计时,发布非闭环的局部SLAM结果 submap？
  odom_frame = "odom",

--如果启用,本地非闭环的位姿会被publish在odom_frame里
  provide_odom_frame = false,
  publish_frame_projected_to_2d = false,

--位姿推理器,融合里程计数据和IMU数据，为Local SLAM提供初始位姿估计。
  use_pose_extrapolator = true,
--外部里程计
  use_odometry = false,
--GPS数据
  use_nav_sat = false,
--路标数据
  use_landmarks = false,

--雷达数量
  num_laser_scans = 1,
--多线程雷达数量
  num_multi_echo_laser_scans = 0,
--将每个接收到的（多线程）激光扫描分割为的点云数
  num_subdivisions_per_laser_scan = 1,
--订阅的点云Topic数
  num_point_clouds = 0,
--tf2 转换时间限制
  lookup_transform_timeout_sec = 0.2,
--发布submap的时间周期
  submap_publish_period_sec = 0.3,
--发布位姿的时间周期
  pose_publish_period_sec = 5e-3,
--发布轨迹的时间周期
  trajectory_publish_period_sec = 30e-3,
--测距采样频率
  rangefinder_sampling_ratio = 1.,
--里程计信息频率
  odometry_sampling_ratio = 1.,
--固定帧位姿信息频率
  fixed_frame_pose_sampling_ratio = 1.,
--IMU信息频率
  imu_sampling_ratio = 1.,
--路标采样频率
  landmarks_sampling_ratio = 1.,
}

--2D建图
MAP_BUILDER.use_trajectory_builder_2d = true
--submap数量
TRAJECTORY_BUILDER_2D.submaps.num_range_data = 35
--TRAJECTORY_BUILDER_2D.submaps.num_range_data = 50
--积攒多少帧数据作为Node节点
--TRAJECTORY_BUILDER_2D.num_accumulated_range_data = 10

--激光测距范围
TRAJECTORY_BUILDER_2D.min_range = 0.3
TRAJECTORY_BUILDER_2D.max_range = 8
--TRAJECTORY_BUILDER_2D.min_range = 0.20
--TRAJECTORY_BUILDER_2D.max_range = 16.0
--
--如果测量距离不在测距范围内赋指定值
TRAJECTORY_BUILDER_2D.missing_data_ray_length = 1.

--是否使用IMU数据
TRAJECTORY_BUILDER_2D.use_imu_data = false
--重力加速度
--TRAJECTORY_BUILDER_2D.imu_gravity_time_constant = 9.80

TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = true
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.linear_search_window = 0.1

TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.translation_delta_cost_weight = 10.
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.rotation_delta_cost_weight = 1e-1


--POSE_GRAPH.sonstraint_builder.max_constraint_distance = 4
POSE_GRAPH.optimization_problem.huber_scale = 1e2
POSE_GRAPH.optimize_every_n_nodes = 35
POSE_GRAPH.constraint_builder.min_score = 0.65

return options
