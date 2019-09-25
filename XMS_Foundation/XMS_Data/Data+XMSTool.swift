//
//  Data+XMSTool.swift
//  artreeIOS
//
//  Created by zhangmingwei on 2019/8/30.
//  Copyright © 2019 yiku. All rights reserved.
//

import Foundation

extension Data {
    
    /// Data转String
    func utf8String_XMS() -> String {
        return String.init(data: self, encoding: String.Encoding.utf8)!;
    }
    
    /// 从资源里获取data数据
    static func dataFor_XMS(resource: String, ofType: String = "") -> Data? {
        let path = Bundle.main.path(forResource: resource, ofType: ofType);
        if (path == nil) {
            return nil;
        }
        return try? Data.init(contentsOf: URL.init(string: path!)!);
    }
    
    /// 根据压缩质量压缩图片成Data数据
    static func compressed_XMS(image: UIImage, quality: CGFloat = 1.0) -> Data? {
        var data = image.jpegData(compressionQuality: quality);
        if (data == nil) {
            data = image.pngData();
        }
        return data;
    }
    
    /// 压缩图片到多少K 比如：600k，就传入 600
    ///
    /// - Parameters:
    ///   - image: 图片
    ///   - limitSize: 最大的大小单位：K
    /// - Returns: Data
    static func compressedToSize_XMS(image: UIImage, limitSize: Int) -> Data? {
        let imagePixel = image.cgImage!.width * image.cgImage!.height;  // 图片像素
        let imageSize = imagePixel * (image.cgImage?.bitsPerPixel)! / (8 * 1024);
        if imageSize > limitSize {
            let compressedParam = CGFloat(limitSize) / CGFloat(imageSize);
            return image.jpegData(compressionQuality: compressedParam);
        }
        return image.pngData();
    }
    /// 压缩图片到100k
    static func compressedTo100K(image: UIImage) -> Data? {
        return Data.compressedToSize_XMS(image: image, limitSize: 100);
    }
    /// 压缩图片到500k
    static func compressedTo500K(image: UIImage) -> Data? {
        return Data.compressedToSize_XMS(image: image, limitSize: 500);
    }
}
