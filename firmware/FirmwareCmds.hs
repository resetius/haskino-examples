-------------------------------------------------------------------------------
-- |
-- Module      :  FirmwareCmds
-- Copyright   :  (c) University of Kansas
-- License     :  BSD3
-- Stability   :  experimental
--
-- TBD.
-------------------------------------------------------------------------------
module FirmwareCmds where

import Data.Word

data FirmwareCmd = BC_CMD_SYSTEM_RESET
                 | BC_CMD_SET_PIN_MODE
                 | BC_CMD_DELAY_MILLIS
                 | BC_CMD_DELAY_MICROS
                 | BS_CMD_REQUEST_VERSION
                 | BS_CMD_REQUEST_TYPE
                 | BS_CMD_REQUEST_MICROS
                 | BS_CMD_REQUEST_MILLIS
                 | BS_CMD_DEBUG
                 | DIG_CMD_READ_PIN
                 | DIG_CMD_WRITE_PIN
                 | DIG_CMD_READ_PORT
                 | DIG_CMD_WRITE_PORT
                 | ALG_CMD_READ_PIN
                 | ALG_CMD_WRITE_PIN
                 | ALG_CMD_TONE_PIN
                 | ALG_CMD_NOTONE_PIN
                 | I2C_CMD_CONFIG
                 | I2C_CMD_READ
                 | I2C_CMD_WRITE
                 | SER_CMD_BEGIN
                 | SER_CMD_END
                 | SER_CMD_AVAIL
                 | SER_CMD_READ
                 | SER_CMD_READ_LIST
                 | SER_CMD_WRITE
                 | SER_CMD_WRITE_LIST
                 | STEP_CMD_2PIN
                 | STEP_CMD_4PIN
                 | STEP_CMD_SET_SPEED
                 | STEP_CMD_STEP
                 | SRVO_CMD_ATTACH
                 | SRVO_CMD_DETACH
                 | SRVO_CMD_WRITE
                 | SRVO_CMD_WRITE_MICROS
                 | SRVO_CMD_READ
                 | SRVO_CMD_READ_MICROS
                 | REF_CMD_NEW
                 | REF_CMD_READ
                 | REF_CMD_WRITE
                 | UNKNOWN_COMMAND
                deriving Show

-- | Compute the numeric value of a command
firmwareCmdVal :: FirmwareCmd -> Word8
firmwareCmdVal BC_CMD_SYSTEM_RESET      = 0x10
firmwareCmdVal BC_CMD_SET_PIN_MODE      = 0x11
firmwareCmdVal BC_CMD_DELAY_MILLIS      = 0x12
firmwareCmdVal BC_CMD_DELAY_MICROS      = 0x13
firmwareCmdVal BS_CMD_REQUEST_VERSION   = 0x20
firmwareCmdVal BS_CMD_REQUEST_TYPE      = 0x21
firmwareCmdVal BS_CMD_REQUEST_MICROS    = 0x22
firmwareCmdVal BS_CMD_REQUEST_MILLIS    = 0x23
firmwareCmdVal DIG_CMD_READ_PIN         = 0x30
firmwareCmdVal DIG_CMD_WRITE_PIN        = 0x31
firmwareCmdVal DIG_CMD_READ_PORT        = 0x32
firmwareCmdVal DIG_CMD_WRITE_PORT       = 0x33
firmwareCmdVal ALG_CMD_READ_PIN         = 0x40
firmwareCmdVal ALG_CMD_WRITE_PIN        = 0x41
firmwareCmdVal ALG_CMD_TONE_PIN         = 0x42
firmwareCmdVal ALG_CMD_NOTONE_PIN       = 0x43
firmwareCmdVal I2C_CMD_CONFIG           = 0x50
firmwareCmdVal I2C_CMD_READ             = 0x51
firmwareCmdVal I2C_CMD_WRITE            = 0x52
firmwareCmdVal STEP_CMD_2PIN            = 0x60
firmwareCmdVal STEP_CMD_4PIN            = 0x61
firmwareCmdVal STEP_CMD_SET_SPEED       = 0x62
firmwareCmdVal STEP_CMD_STEP            = 0x63
firmwareCmdVal SRVO_CMD_ATTACH          = 0x80
firmwareCmdVal SRVO_CMD_DETACH          = 0x81
firmwareCmdVal SRVO_CMD_WRITE           = 0x82
firmwareCmdVal SRVO_CMD_WRITE_MICROS    = 0x83
firmwareCmdVal SRVO_CMD_READ            = 0x84
firmwareCmdVal SRVO_CMD_READ_MICROS     = 0x85
firmwareCmdVal SER_CMD_BEGIN            = 0xE0
firmwareCmdVal SER_CMD_END              = 0xE1
firmwareCmdVal SER_CMD_AVAIL            = 0xE2
firmwareCmdVal SER_CMD_READ             = 0xE3
firmwareCmdVal SER_CMD_READ_LIST        = 0xE4
firmwareCmdVal SER_CMD_WRITE            = 0xE5
firmwareCmdVal SER_CMD_WRITE_LIST       = 0xE6
firmwareCmdVal _                        = 0x00

data FirmwareCmdType = BC_CMD_TYPE
                     | BS_CMD_TYPE
                     | DIG_CMD_TYPE
                     | ALG_CMD_TYPE
                     | I2C_CMD_TYPE
                     | STEP_CMD_TYPE
                     | SVRO_CMD_TYPE
                     | REF_CMD_TYPE
                     | SER_CMD_TYPE

firmwareTypeVal :: FirmwareCmdType -> Word8
firmwareTypeVal BC_CMD_TYPE = 0x10
firmwareTypeVal BS_CMD_TYPE = 0x20
firmwareTypeVal DIG_CMD_TYPE = 0x30
firmwareTypeVal ALG_CMD_TYPE = 0x40
firmwareTypeVal I2C_CMD_TYPE = 0x50
firmwareTypeVal STEP_CMD_TYPE = 0x60
firmwareTypeVal SVRO_CMD_TYPE = 0x80
firmwareTypeVal REF_CMD_TYPE = 0xC0
firmwareTypeVal SER_CMD_TYPE = 0xE0

data ExprType = EXPR_UNIT
              | EXPR_BOOL
              | EXPR_WORD8
              | EXPR_WORD16
              | EXPR_WORD32
              | EXPR_INT8
              | EXPR_INT16
              | EXPR_INT32
              | EXPR_LIST8
              | EXPR_FLOAT

exprTypeVal :: ExprType -> Word8
exprTypeVal EXPR_UNIT = 0x00
exprTypeVal EXPR_BOOL = 0x01
exprTypeVal EXPR_WORD8 = 0x02
exprTypeVal EXPR_WORD16 = 0x03
exprTypeVal EXPR_WORD32 = 0x04
exprTypeVal EXPR_INT8 = 0x05
exprTypeVal EXPR_INT16 = 0x06
exprTypeVal EXPR_INT32 = 0x07
exprTypeVal EXPR_LIST8 = 0x08
exprTypeVal EXPR_FLOAT = 0x09

data ExprOp = EXPR_LIT

exprOpVal :: ExprOp -> Word8
exprOpVal EXPR_LIT = 0x00

data FirmwareReply =  BC_RESP_DELAY
                   |  BC_RESP_IF_THEN_ELSE
                   |  BC_RESP_ITERATE
                   |  BS_RESP_VERSION
                   |  BS_RESP_TYPE
                   |  BS_RESP_MICROS
                   |  BS_RESP_MILLIS
                   |  BS_RESP_STRING
                   |  BS_RESP_DEBUG
                   |  DIG_RESP_READ_PIN
                   |  DIG_RESP_READ_PORT
                   |  ALG_RESP_READ_PIN
                   |  I2C_RESP_READ
                   |  SER_RESP_AVAIL
                   |  SER_RESP_READ
                   |  SER_RESP_READ_LIST
                   |  STEP_RESP_2PIN
                   |  STEP_RESP_4PIN
                   |  STEP_RESP_STEP
                   |  SRVO_RESP_ATTACH
                   |  SRVO_RESP_READ
                   |  SRVO_RESP_READ_MICROS
                   |  SCHED_RESP_QUERY
                   |  SCHED_RESP_QUERY_ALL
                   |  SCHED_RESP_BOOT
                   |  REF_RESP_NEW
                   |  REF_RESP_READ
                   |  EXPR_RESP_RET
                deriving Show

firmwareReplyVal :: FirmwareReply -> Word8
firmwareReplyVal BC_RESP_DELAY         = 0x18
firmwareReplyVal BC_RESP_IF_THEN_ELSE  = 0x19
firmwareReplyVal BC_RESP_ITERATE       = 0x1A
firmwareReplyVal BS_RESP_VERSION       = 0x28
firmwareReplyVal BS_RESP_TYPE          = 0x29
firmwareReplyVal BS_RESP_MICROS        = 0x2A
firmwareReplyVal BS_RESP_MILLIS        = 0x2B
firmwareReplyVal BS_RESP_STRING        = 0x2C
firmwareReplyVal BS_RESP_DEBUG         = 0x2D
firmwareReplyVal DIG_RESP_READ_PIN     = 0x38
firmwareReplyVal DIG_RESP_READ_PORT    = 0x39
firmwareReplyVal ALG_RESP_READ_PIN     = 0x48
firmwareReplyVal I2C_RESP_READ         = 0x58
firmwareReplyVal STEP_RESP_2PIN        = 0x68
firmwareReplyVal STEP_RESP_4PIN        = 0x69
firmwareReplyVal STEP_RESP_STEP        = 0x6A
firmwareReplyVal SRVO_RESP_ATTACH      = 0x88
firmwareReplyVal SRVO_RESP_READ        = 0x89
firmwareReplyVal SRVO_RESP_READ_MICROS = 0x8A
firmwareReplyVal SCHED_RESP_QUERY      = 0xB0
firmwareReplyVal SCHED_RESP_QUERY_ALL  = 0xB1
firmwareReplyVal SCHED_RESP_BOOT       = 0xB2
firmwareReplyVal REF_RESP_NEW          = 0xC8
firmwareReplyVal REF_RESP_READ         = 0xC9
firmwareReplyVal EXPR_RESP_RET         = 0xD8
firmwareReplyVal SER_RESP_AVAIL        = 0xE8
firmwareReplyVal SER_RESP_READ         = 0xE9
firmwareReplyVal SER_RESP_READ_LIST    = 0xEA

