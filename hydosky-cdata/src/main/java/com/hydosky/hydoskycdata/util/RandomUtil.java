package com.hydosky.hydoskycdata.util;

import java.util.Random;

/**
 * 随机数工具类
 */
public class RandomUtil {

    /**
     * 在范围内获取long类型随机数   （min,max）
     *
     * @param min 最小值
     * @param max 最大值
     * @return
     */
    public static long getLong(long min, long max) {
        Random random = new Random();
        long number = (long) (random.nextDouble() * (max - min)) + min;
        return number;
    }

    /**
     * 在范围内获取long类型随机数   （0,max）
     *
     * @param max 最大值
     * @return
     */
    public static long getLong(long max) {
        long number = getLong(0L, max);
        return number;
    }

    /**
     * 在范围内获取int类型随机数   （min,max）
     *
     * @param min 最小值
     * @param max 最大值
     * @return
     */
    public static int getInt(int min, int max) {
        Random random = new Random();
        int number = random.nextInt(max - min) + min;
        return number;
    }

    /**
     * 在范围内获取int类型随机数   （0,max）
     *
     * @param max 最大值
     * @return
     */
    public static int getInt(int max) {
        int number = getInt(0, max);
        return number;
    }

}
