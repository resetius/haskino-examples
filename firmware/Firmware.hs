-------------------------------------------------------------------------------
-- |
-- Module      :  System.Hardware.Haskino.SamplePrograms.Rewrite.Firmware
--                Based on System.Hardware.Arduino
-- Copyright   :  (c) University of Kansas
-- License     :  BSD3
-- Stability   :  experimental
--
-- TBD.
-------------------------------------------------------------------------------

module Main where

import System.Hardware.Haskino
import Data.Word
import Data.Bits

portNum :: Word8
portNum = 0

hdlcFrameFlag :: Word8
hdlcFrameFlag = 0x7E

hdlcEscape :: Word8
hdlcEscape = 0x7D

hdlcMask :: Word8
hdlcMask = 0x20

readChar :: Arduino Word8
readChar = do
    a <- serialAvailable portNum
    if a > 0
    then do
        s <- serialRead portNum
        return $ fromIntegral s
    else readChar

readFrame :: Arduino [Word8]
readFrame = readFrame' []
  where
    readFrame' :: [Word8] -> Arduino [Word8]
    readFrame' l = do
        c <- readChar
        if c == hdlcEscape
        then do
            c' <- readChar
            let ec = c' `xor` hdlcMask 
            readFrame' $ ec : l
        else if c == hdlcFrameFlag 
             then return $ reverse l
             else readFrame' $ c : l

firmware :: Arduino ()
firmware = do
    serialBegin portNum 115200
    loop $ do
        _ <- readFrame
        return ()

main :: IO ()
main = compileProgram firmware "firmware.ino"
